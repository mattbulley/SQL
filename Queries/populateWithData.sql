insert into consultants(consultantID, name) values (1, 'Matt Bulley');
insert into consultants(consultantID, name) values (2, 'John Doe');
insert into consultants(consultantID, name) values (3, 'Nathan Taylor');
insert into consultants(consultantID, name) values (4, 'Jimmy Mosley');
insert into consultants(consultantID, name) values (5, 'Neil Weinstein');
insert into consultants(consultantID, name) values (6, 'Alice Jewson');
insert into consultants(consultantID, name) values (7, 'Fenton Finch');
insert into consultants(consultantID, name) values (8, 'Raskolnikov Pavlovich');
insert into consultants(consultantID, name) values (9, 'Sara Saheed');




/* CREATE COURSES */
insert into courses(name, start, end) values ('Agile', "2018-01-29 09:00:00", "2018-02-02 16:00:00");
insert into courses(name, start, end) values ('Java week 1', "2018-02-05 09:00:00", "2018-02-09 16:00:00");
insert into courses(name, start, end) values ('Java week 2', "2018-02-12 09:00:00", "2018-02-16 16:00:00");
insert into courses(name, start, end) values ('Databases', "2018-02-19 09:00:00", "2018-02-23 16:00:00");
insert into courses(name, start, end, Rooms_roomID) values ('Databases', "2018-02-19 09:00:00", "2018-02-23 16:00:00", 5);

insert into completedCourses(Consultants_consultantID, courseName) values(1, 'Agile');
insert into completedCourses(Consultants_consultantID, courseName) values(1, 'Java week 1');
insert into completedCourses(Consultants_consultantID, courseName) values(1, 'Java week 2');
insert into completedCourses(Consultants_consultantID, courseName) values(1, 'Databases');
insert into completedCourses(Consultants_consultantID, courseName) values(2, 'Agile');


insert into enrolls(Consultants_consultantID, courseName) values(1, 'Databases');
insert into enrolls(Consultants_consultantID, courseName) values(2, 'Java week 1');
insert into enrolls(Consultants_consultantID, courseName) values(3, 'Databases');
insert into enrolls(Consultants_consultantID, courseName) values(4, 'Agile');
insert into enrolls(Consultants_consultantID, courseName) values(5, 'Java week 1');
insert into enrolls(Consultants_consultantID, courseName) values(6, 'Agile');
insert into enrolls(Consultants_consultantID, courseName) values(7, 'Databases');


/* CREATES AN EMPTY ROOM */
insert into rooms() values ();
insert into rooms() values ();
insert into rooms() values ();
insert into rooms() values ();
insert into rooms() values ();
insert into rooms() values ();


UPDATE rooms r
SET vacant = false
WHERE r.roomID = 5;

UPDATE rooms r
SET vacant = false
WHERE r.roomID = 3;



CREATE OR REPLACE VIEW coursesCompleted(Name, Course) AS select name as Name, courseName as Course from consultants c join completedcourses cc on cc.Consultants_consultantID = c.consultantID;
CREATE OR REPLACE VIEW seeEnrolls(Name, Course) AS select name as Name, courseName as Course from consultants c join enrolls e on e.Consultants_consultantID = c.consultantID;



insert into trainerscourses(Courses_courseID, trainerID) values(1, 1);
insert into trainerscourses(Courses_courseID, trainerID) values(2, 2);
insert into trainerscourses(Courses_courseID, trainerID) values(3, 3);
insert into trainerscourses(Courses_courseID, trainerID) values(4, 2);

insert into trainers(name) values('Dev');
insert into trainers(name) values('Tadas');
insert into trainers(name) values('Shafeeq');
insert into trainers(name) values('Eliot');


CREATE OR REPLACE VIEW seeTrainers(ID, Name, CourseID, Course) AS select t.trainerID as ID, t.name,  Courses_courseID as Course, c.name from courses c join trainerscourses tc on tc.Courses_courseID = c.courseID join trainers t on t.trainerID = tc.trainerID ;





insert into clients(Consultants_consultantID, client) values(1, 'TalkTalk');
insert into clients(Consultants_consultantID, client) values(2, 'Pega');
insert into clients(Consultants_consultantID, client) values(3, 'Disney');
insert into clients(Consultants_consultantID, client) values(4, 'TalkTalk');
insert into clients(Consultants_consultantID, client) values(5, 'Acenture');
insert into clients(Consultants_consultantID, client) values(6, 'TalkTalk');
 
CREATE OR REPLACE VIEW seeClients(Name, Client) AS select c.name as Name, cl.client as client from clients cl join consultants c on cl.Consultants_consultantID = c.consultantID;
/*
select * from consultants;
select * from clients;
select * from courses;*/



/* LOOK UP ROOMS AVAILABLITY */
select * from rooms;

/* LOOK UP CONSULTANTS CURRENT TRAINGING */
select * from seeEnrolls;

/* LOOK UP TRAINERS COURSES */
select * from seeTrainers;

/* LOOK UP CONSULTANTS PASSED COURSES */
select * from coursesCompleted;

/* LOOK UP CONSULTANTS PLACEMENT (CLIENTS) */
select * from seeClients;