DROP TABLE IF EXISTS address_entries;
DROP TABLE IF EXISTS phone_numbers;
DROP TABLE IF EXISTS email_addresses;

CREATE TABLE address_entries (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(225),
  last_name VARCHAR(225),
  # You might not want to put this here
);

CREATE TABLE phone_numbers (
  id INTEGER PRIMARY KEY,
  category VARCHAR(225),
  digits VARCHAR(225),
  address_index INTEGER
);

CREATE TABLE email_addresses (
  id INTEGER PRIMARY KEY,
  category VARCHAR(225),
  address VARCHAR(225),
  address_index INTEGER
);
