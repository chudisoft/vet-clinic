/* Database schema to keep the structure of the entire database. */

CREATE TABLE animals (
    id serial PRIMARY KEY,
    name varchar(255),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal(10, 2)
);

ALTER TABLE animals ADD COLUMN species varchar(255);
