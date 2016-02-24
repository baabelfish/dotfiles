import
    db_postgres,
    assql

parseAssql("test.sql")

var db: DbConn
discard db.getAllThings
discard db.getUserByNameAndAge($42, "hessu hopo")

# discard db.getUserByNameAndAge((age: 42, name: "hessu hopo")) # Tuple format
# discard db.getUserByNameAndAge(42, "hessu hopo") # Typed parameters (with tuple)


# Make a rfc
# proc foo*(a, b: int): auto = (a * 2, b * 2)
# proc bar*(a, b: int): auto = (a / 2, b / 2)
# foo(10, 20).bar
