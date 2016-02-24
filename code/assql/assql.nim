import
    db_common,
    db_postgres,
    tables,
    sequtils,
    strutils,
    macros

const prefix = "-- name:"

type
    SqlProc = tuple[
        name:   string,
        doc:    string,
        query:  string,
        rquery: string,
        args:   seq[string]]
    SqlProcs = seq[SqlProc]


proc `$`(p: SqlProc): string =
    result = ""
    result &= "\e[1m\e[35mName" & "\e[0m:  \e[1m" & p.name & "\n"
    result &= "\e[1m\e[32mDoc" & "\e[0m:   " & p.doc & "\n"
    result &= "\e[1m\e[33mQuery" & "\e[0m: " & p.query & "\n"
    result &= "\e[1m\e[33m     " & "\e[0m  " & p.rquery & "\n"
    if p.args.len > 0:
        result &= "\e[1m\e[36mArgs" & "\e[0m:  " & p.args.join(", ") & "\n"


proc `$`(ps: SqlProcs): string =
    result = ""
    for p in ps:
        result &= $p


proc parseParameters(sproc: var SqlProc) =
    sproc.args = @[]
    sproc.rquery = ""
    var
        word: string
        lastpoint = 0
        ids = initTable[string, int]()

    proc addWord(sproc: var SqlProc, ids: var type(ids)) =
        if word != nil:
            discard ids.hasKeyOrPut(word, sproc.args.len + 1)
            sproc.rquery &= "$" & $ids[word]
            sproc.args.add word
            word = nil

    for idx, c in sproc.query:
        if c == ':':
            sproc.rquery &= sproc.query[lastpoint..idx - 1]
            word = ""
        elif word != nil:
            if c in Letters:
                word &= $c
            else:
                sproc.addWord ids
            lastpoint = idx

    sproc.rquery &= sproc.query[lastpoint + word.len..^1]
    sproc.addWord ids
    sproc.args = sproc.args.deduplicate


proc parseAssqlProcs(file: string): SqlProcs =
    var procs: SqlProcs = @[]
    let lines = file.splitLines
    var current: SqlProc
    var idx = 0

    proc addResult(ps: var type(procs), p: SqlProc) =
        if current.name != nil:
            current.doc = current.doc.strip
            current.query = current.query.strip
            # TODO: Validate sql here
            current.parseParameters
            procs.add current

        current.name  = nil
        current.doc   = ""
        current.query = ""

    while idx < lines.len:
        if lines[idx].startsWith(prefix):
            procs.addResult current
            current.name = lines[idx][prefix.len..^1].strip
            inc idx

            while idx < lines.len and lines[idx].strip.startsWith("--"):
                current.doc &= lines[idx].strip[2..^1]
                inc idx

        elif current.name != nil:
            current.query &= lines[idx].strip & " "
            inc idx

    procs.addResult current
    return procs


proc exec*(db: DbConn, query: string, params: varargs[string]): string =
    echo "Exec: '" & query & "' with parameters: " & params.join(", ")
    # db.exec(query.sql, params)


macro parseAssql*(name: static[string]): stmt {.immediate.} =
    var procs = name.slurp.parseAssqlProcs
    result = newStmtList()

    for p in procs:
        p.echo
        var
            args = @[
                newIdentNode(!"string"),
                newIdentDefs(newIdentNode(!"db"), newIdentNode(!"DbConn"))]
            call = newCall(newIdentNode(!"exec"), newIdentNode(!"db"), newStrLitNode(p.rquery))

        for arg in p.args:
            args.add(newIdentDefs(newIdentNode(!arg), newIdentNode(!"string")))
            call.add(newIdentNode(!arg))

        result.add(newProc(newIdentNode(p.name), args, call))
