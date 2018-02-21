insert into consultants(consultantID, name) values (1, 'Matt Bulley');
insert into consultants(consultantID, name) values (2, 'John Doe');
insert into consultants(consultantID, name) values (3, 'Nathan Taylor');
insert into consultants(consultantID, name) values (4, 'Jimmy Mosley');
insert into consultants(consultantID, name) values (5, 'Neil Weinstein');
insert into consultants(consultantID, name) values (6, 'Alice Jewson');
insert into consultants(consultantID, name) values (7, 'Fenton Finch');
insert into consultants(consultantID, name) values (8, 'Raskolnikov Pavlovich');
insert into consultants(consultantID, name) values (9, 'Sara Saheed');

select * from consultants;
select * from clients;


/* CREATE COURSES */
insert into courses(name, start, end) values ('agile', "2018-01-29 09:00:00", "2018-02-02 16:00:00");
insert into courses(name, start, end) values ('java week 1', "2018-02-05 09:00:00", "2018-02-09 16:00:00");
insert into courses(name, start, end) values ('java week 2', "2018-02-12 09:00:00", "2018-02-16 16:00:00");
insert into courses(name, start, end) values ('databases', "2018-02-19 09:00:00", "2018-02-23 16:00:00");
insert into courses(name, start, end, Rooms_roomID) values ('databases', "2018-02-19 09:00:00", "2018-02-23 16:00:00", 5);

insert into completedCourses(Consultants_consultantID, courseName) values(1, 'agile');
insert into completedCourses(Consultants_consultantID, courseName) values(1, 'java week 1');
insert into completedCourses(Consultants_consultantID, courseName) values(1, 'java week 2');
insert into completedCourses(Consultants_consultantID, courseName) values(1, 'databases');
insert into completedCourses(Consultants_consultantID, courseName) values(2, 'agile');

/* CREATES AN EMPTY ROOM */
insert into rooms() values ();


UPDATE rooms r
SET vacant = false
WHERE r.roomID = 5;

UPDATE rooms r
SET vacant = false
WHERE r.roomID = 3;

select * from courses;

select * from rooms;

select * from consultants c join completedcourses cc on cc.Consultants_consultantID = c.consultantID;


select * from consultants;
