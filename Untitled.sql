-- CREATE TABLE "eleves" (
--   "id" integer PRIMARY KEY SERIAL,
--   "nom" varchar,
--   "prenom" varchar
-- );

-- CREATE TABLE "notes" (
--   "id" integer PRIMARY KEY SERIAL,
--   "note" integer,
--   "eleves_id" integer
-- );
-- quand j'ai crée les 1eres tables mais sans une incrémentation auto des id.

-- ALTER TABLE "notes" ADD FOREIGN KEY ("eleves_id") REFERENCES "eleves" ("id");

CREATE TABLE "eleves" (
  "id" SERIAL PRIMARY KEY,
  "nom" varchar,
  "prenom" varchar
);

CREATE TABLE "notes" (
  "id" SERIAL PRIMARY KEY,
  "note" integer,
  "eleves_id" integer
);

ALTER TABLE "notes" ADD FOREIGN KEY ("eleves_id") REFERENCES "eleves" ("id");



INSERT INTO eleves (nom,prenom)
VALUES ('Test','alec'), ('Essai','fabien');

INSERT INTO notes (note,eleves_id)
VALUES (12,1), (15,2);

INSERT INTO eleves (nom,prenom)
VALUES ('Toto','toto2'), ('Tata','Tata2');

INSERT INTO notes (note,eleves_id)
VALUES (8,3), (10,4);

SElect *
from eleves, notes
where eleves.id=notes.eleves_id

-- Ecrire une requête SQL qui retourne le nombre d'élèves de la classe.
SElect 
count (*)
from eleves

-- Ecrire une requête SQL qui retourne le nombre d'élèves qui ont plus de 10.
SElect *
from eleves, notes
where eleves.id=notes.eleves_id
and note >10

-- Ecrire une requête SQL qui retourne le nombre d'élèves qui ont une note différente de 10.
SElect *
from eleves, notes
where eleves.id=notes.eleves_id
and note <> 10

-- Ecrire une requête SQL qui retourne la moyenne de la classe.
SElect avg (note)
from notes

-- Ecrire une requête SQL qui retourne la moyenne des élèves qui s'appellent "Amandine".
INSERT INTO eleves (nom,prenom)
VALUES ('Dupont','amandine'), ('Durand','amandine');

Select avg (note)
from eleves, notes
where eleves.id=notes.eleves_id
and eleves.prenom = 'amandine'

-- Ecrire une requête SQL qui retourne la note maximale de la classe.
Select max (note)
from notes

-- Ecrire une requête SQL qui retourne le prénom le plus présent.
Select prenom
from eleves
group by prenom
HAVING count (*) = (
	Select count (*) as frequency
	from eleves
	group by prenom
	order by frequency desc
	limit 1
)
-- de cette façon s'il y a plusieurs prénoms avec la même fréquence la requête va tous les retourner

-- Ecrire une requête SQL qui retourne le prénom le moins présent.
SELECT prenom, COUNT(*) AS count
FROM eleves
GROUP BY prenom
HAVING COUNT(*) = (
    SELECT COUNT(*) AS min_count
    FROM eleves
    GROUP BY prenom
    ORDER BY min_count ASC
    LIMIT 1
	)
-- idem cette méthode permet d'indiquer tous les prénoms qui ont la même fréquence (dans ce cas tous les uniques)

-- Ecrire une requête SQL qui retourne les prénoms et les notes des élèves qui ont une note supérieure à la moyenne de la classe (en une seule requête)
SELECT e.prenom, n.note
FROM eleves e
JOIN notes n ON e.id = n.eleves_id
WHERE n.note > (
    SELECT AVG(note)
    FROM notes
);

-- Ecrire une requête SQL qui ajoute un élève dans la table `eleves` avec le prénom "Thomas" et la note 20. C'est un super élève !
INSERT INTO eleves (nom, prenom)
VALUES ('Super', 'Thomas')

INSERT INTO notes (note,eleves_id)
VALUES (20,9);

-- Supprimez les élèves qui s'appellent "Fabien" de la table `eleves`.
DELETE FROM eleves
WHERE prenom = 'fabien';

-- Changez la note et le prénom de l'élève avec la plus mauvaise note par votre prénom à vous et la note de 19.
