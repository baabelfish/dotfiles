-- name: getAllThings
-- whatever
SELECT *
FROM things


-- name: getThing
-- whatever
-- and some other
-- lines
SELECT *
FROM things
WHERE thing = :thing


-- name: getUserByNameAndAge
-- whatever
SELECT *
FROM users
WHERE age = :age AND
    (name = :name OR parent != :name)
