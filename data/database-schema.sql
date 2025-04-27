CREATE TABLE characters (
    id integer NOT NULL,
    surname text,
    given_name text,
    species text,
    gender text,
    hair_color text,
    eye_color text,
    house text,
    occupation text,
    blood_status text,
    wand text,
    patronus text,
    skills text
);

CREATE TABLE spells (
    id integer NOT NULL,
    informal_name text,
    incantation text,
    type text,
    effect text,
    light text
);

CREATE TABLE potions (
    id integer NOT NULL,
    name text,
    known_ingredients text,
    effect text,
    qualitative_traits text,
    difficulty text
);

