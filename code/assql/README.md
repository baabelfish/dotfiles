Assql
=====

Like yesql but for Nim.


# Usage

Create ``test.sql``
```sql
-- name: getHelloWorlds
-- Get some hello worlds
SELECT *
FROM hellos
WHERE hello = :world
```

Create ``test.nim``
```sql
var db: DbConn
parseAssql("test.sql")
db.getHelloWorlds("moro").echo

# parseAssql creates the following proc at compile time:
# proc getHelloWorlds*(db: DbConn, world: string): string =
#     ## Get some hello worlds
#     exec(db, sql"SELECT * FROM hellos WHERE hello = $1", @[world])
```
