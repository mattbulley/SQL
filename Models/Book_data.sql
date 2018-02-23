insert into authors(name) values ('Author 1');
insert into authors(name) values ('Author 2');
insert into authors(name) values ('Author 3');
insert into authors(name) values ('Author 4');
insert into authors(name) values ('Author 5');
insert into authors(name) values ('Author 6');
insert into authors(name) values ('Author 7');
insert into authors(name) values ('Author 8');
insert into authors(name) values ('Author 9');
insert into authors(name) values ('Author 10');

insert into earnings(Authors_authorsID, earnings) value (1, 11000);
insert into earnings(Authors_authorsID, earnings) value (2, 22000);
insert into earnings(Authors_authorsID, earnings) value (3, 6000);
insert into earnings(Authors_authorsID, earnings) value (4, 40000);
insert into earnings(Authors_authorsID, earnings) value (5, 3500);
insert into earnings(Authors_authorsID, earnings) value (6, 8000);
insert into earnings(Authors_authorsID, earnings) value (7, 60000);

SELECT * FROM authors;
CREATE VIEW lucrative(Author, Earnings) AS SELECT a.name AS Author, e.earnings AS Earnings FROM earnings e JOIN authors a ON a.authorsID = e.Authors_authorsID WHERE e.earnings > 10000 ORDER BY e.earnings DESC LIMIT 3; 

SELECT * FROM lucrative;