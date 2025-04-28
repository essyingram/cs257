-- Three SQL Queries
-- Essy Ingram, 27 April 2025

-- Found character display limit SQL code at https://www.quora.com/How-do-I-limit-the-number-of-characters-to-be-displayed-from-a-database

SELECT characters.given_name, characters.surname, characters.gender, characters.occupation
FROM characters
WHERE characters.house LIKE 'G%'
AND characters.surname LIKE '%o%'
ORDER BY characters.surname, characters.given_name;

SELECT spells.informal_name, spells.incantation, spells.type, spells.effect, spells.light
FROM spells
WHERE spells.effect LIKE '%Kill%'
OR spells.effect LIKE '%kill%'
OR spells.informal_name LIKE '%Kill%'
OR spells.informal_name LIKE '%kill%'
ORDER BY spells.informal_name;

SELECT potions.name, potions.known_ingredients, potions.difficulty, potions.effect
FROM potions
WHERE potions.known_ingredients LIKE '%hair%'
OR potions.known_ingredients LIKE '%Hair%'
ORDER BY potions.name DESC;

-- tests (delete later):

SELECT potions.name, potions.known_ingredients
FROM potions
WHERE potions.name LIKE 'S%'
ORDER BY potions.name;

SELECT potions.name, potions.known_ingredients
FROM potions
WHERE potions.name LIKE 'Forget%'
ORDER BY potions.name;

SELECT characters.given_name, characters.surname, LEFT(characters.wand, 35) AS wand, characters.occupation
FROM characters
WHERE characters.house LIKE 'G%'
OR characters.house LIKE 'S%'
AND characters.surname LIKE 'P%'
ORDER BY characters.surname, characters.given_name;