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


/* RETURNS ALL THE ANIMALS AND THEIR NEUTERED STATUS */
SELECT type as Type, name as Name, neutered as Neutered FROM animals a join neuteredanimals na on na.Animals_animalID = a.animalID;


/* RETURNS ALL THE ANIMALS AND THEIR LENGTH OF STAY */
SELECT type as Type, name as Name, los.LengthOfStay as Weeks FROM animals a join lengthofstay los on los.Animals_animalID = a.animalID;