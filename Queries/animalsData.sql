insert into animals(type, name) values ('DOG', 'MAX');
insert into animals(type, name) values ('DOG', 'SPOT');
insert into animals(type, name) values ('DOG', 'PATRICK');
insert into animals(type, name) values ('CAT', 'SOME CAT NAME');
insert into animals(type, name) values ('CAT', 'TIDDLES');
insert into animals(type, name) values ('DOG', 'MAX');
insert into animals(type, name) values ('DOG', 'SPOT');
insert into animals(type, name) values ('DOG', 'PATRICK');
insert into animals(type, name) values ('CAT', 'SOME CAT NAME');
insert into animals(type, name) values ('CAT', 'TIDDLES');

insert into neuteredanimals() values ();
insert into neuteredanimals() values ();
insert into neuteredanimals() values ();
insert into neuteredanimals() values ();
insert into neuteredanimals() values ();

insert into lengthofstay(Animals_animalID, LengthOfStay) values (1, 3);
insert into lengthofstay(Animals_animalID, LengthOfStay) values (2, 7);
insert into lengthofstay(Animals_animalID, LengthOfStay) values (3, 5);
insert into lengthofstay(Animals_animalID, LengthOfStay) values (4, 1);
insert into lengthofstay(Animals_animalID, LengthOfStay) values (5, 2);

insert into criteria(Animals_animalID, species, breed, age, colour, gender) values (1, 'Dog', 'German Shepherd', 4, 'Brown', 'Male');
insert into criteria(Animals_animalID, species, breed, age, colour, gender) values (2, 'Dog', 'Labrador', 1, 'Brown', 'Female');
insert into criteria(Animals_animalID, species, breed, age, colour, gender) values (3, 'Cat', 'British Shorthair', 2, 'Brown', 'Male');
insert into criteria(Animals_animalID, species, breed, age, colour, gender) values (4, 'Dog', 'German Shepherd', 5, 'White', 'Female');
insert into criteria(Animals_animalID, species, breed, age, colour, gender) values (5, 'Cat', 'American Bobtail', 7, 'Ginger', 'Male');
insert into criteria(Animals_animalID, species, breed, age, colour, gender) values (6, 'Dog', 'German Shepherd', 2, 'Brown', 'Male');
insert into criteria(Animals_animalID, species, breed, age, colour, gender) values (7, 'Cat', 'Bengal', 4, 'Brown', 'Male');
insert into criteria(Animals_animalID, species, breed, age, colour, gender) values (8, 'Dog', 'Beagle', 3, 'Black', 'Female');

/* RETURNS ALL THE ANIMALS AND THEIR NEUTERED STATUS */
SELECT type as Type, name as Name, neutered as Neutered FROM animals a join neuteredanimals na on na.Animals_animalID = a.animalID;


/* RETURNS ALL THE ANIMALS AND THEIR LENGTH OF STAY */
SELECT type as Type, name as Name, los.LengthOfStay as Weeks FROM animals a join lengthofstay los on los.Animals_animalID = a.animalID;

/* RETURNS ALL THE ANIMALS THAT MATCH SPECIFIC CRITERIA */
SELECT * FROM criteria c WHERE c.species = 'Dog';

CREATE VIEW getDogs(ID, Species, Breed, Age, Colour, Gender) AS SELECT * FROM criteria c WHERE c.species = 'Dog';
CREATE VIEW getCats(ID, Species, Breed, Age, Colour, Gender) AS SELECT * FROM criteria c WHERE c.species = 'Cat';
CREATE VIEW getBrown(ID, Species, Breed, Age, Colour, Gender) AS SELECT * FROM criteria c WHERE c.colour = 'Brown';
CREATE VIEW getBlack(ID, Species, Breed, Age, Colour, Gender) AS SELECT * FROM criteria c WHERE c.colour = 'Black';
CREATE VIEW getWhite(ID, Species, Breed, Age, Colour, Gender) AS SELECT * FROM criteria c WHERE c.colour = 'White';
CREATE VIEW getAge3(ID, Species, Breed, Age, Colour, Gender) AS SELECT * FROM criteria c WHERE c.age = 3;
CREATE VIEW getAge4(ID, Species, Breed, Age, Colour, Gender) AS SELECT * FROM criteria c WHERE c.age = 4;
CREATE VIEW getAge5(ID, Species, Breed, Age, Colour, Gender) AS SELECT * FROM criteria c WHERE c.age = 5;
CREATE VIEW getAge6(ID, Species, Breed, Age, Colour, Gender) AS SELECT * FROM criteria c WHERE c.age >= 6;



SELECT * FROM getDogs;
SELECT * FROM getCats;
SELECT * FROM getBrown;
SELECT * FROM getBlack;
SELECT * FROM getWhite;
SELECT * FROM getAge3;
SELECT * FROM getAge4;
SELECT * FROM getAge5;
SELECT * FROM getAge6;

