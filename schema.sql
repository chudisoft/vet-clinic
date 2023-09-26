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


CREATE TABLE owners (
    id serial PRIMARY KEY,
    full_name varchar(255),
    age integer
);
CREATE TABLE species (
    id serial PRIMARY KEY,
    name varchar(255)
);
ALTER TABLE animals
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE animals
DROP COLUMN species;
ALTER TABLE animals
ADD COLUMN species_id integer REFERENCES species(id);
ALTER TABLE animals
ADD COLUMN owner_id integer REFERENCES owners(id);



CREATE TABLE vets (
    id serial PRIMARY KEY,
    name varchar(255),
    age integer,
    date_of_graduation date
);

CREATE TABLE specializations (
    id serial PRIMARY KEY,
    vet_id integer REFERENCES vets(id),
    species_id integer REFERENCES species(id),
    UNIQUE (vet_id, species_id)
);

CREATE TABLE visits (
    id serial PRIMARY KEY,
    vet_id integer REFERENCES vets(id),
    animal_id integer REFERENCES animals(id),
    visit_date date,
    UNIQUE (vet_id, animal_id, visit_date)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);



CREATE INDEX owners_name_asc ON owners(email ASC);
CREATE INDEX visits_animalsid_asc ON visits(animal_id ASC);
CREATE INDEX visits_vetId_asc ON visits(vet_id ASC);
