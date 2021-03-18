select character.name, height, mass, birth_year, g.gender, p.name
from character
         join gender g on g.id_gender = character.id_gender
         join planet p on character.id_planet = p.id_planet;

-- les 10 planètes les plus peuplées
SELECT *
from planet
WHERE population IS NOT null
ORDER BY population DESC
LIMIT 10;

-- Sélectionner les 5 planètes les plus grosses
SELECT *
from planet
ORDER BY diametre DESC
LIMIT 5

-- Compter le nombre de personnages par planète d'origine
SELECT count(id_character) Nombre, p.name from character
join planet p on p.id_planet = character.id_planet
group by p.name;

-- Sélectionner les véhicules les plus chers de chaque catégorie de véhicule
-- Pas terminé... Erreur syntaxe :)
SELECT v.name, v.cost_in_credits, type FROM vehicules v
join type_vehicule tv on v.id_type = tv.id_type
WHERE v.cost_in_credits IS NOT NULL
GROUP BY type;

SELECT max(cost_in_credits) FROM vehicules

--GROUP BY tv.type
--ORDER BY v.cost_in_credits DESC




-- Sélectionner les vaisseaux et afficher le rapport cout / nb_passagers

