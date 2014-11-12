DROP TABLE IF EXISTS entries;
DROP TABLE IF EXISTS phones;
DROP TABLE IF EXISTS emails;

CREATE TABLE entries (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(225),
  last_name VARCHAR(225)
);

CREATE TABLE phones (
  id INTEGER PRIMARY KEY,
  category VARCHAR(225),
  digits VARCHAR(225)
);

CREATE TABLE emails (
  id INTEGER PRIMARY KEY,
  category VARCHAR(225),
  address VARCHAR(225)
);
