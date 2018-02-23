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

INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (1, 'Horror', 3.2);
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (1, 'Drama', 2.1); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (1, 'Adventure', 1.5); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (1, 'Thriller', 4.8); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (2, 'Horror', 4.2); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (2, 'Sci-fi', 4.6); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (2, 'Fantasy', 3.7); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (3, 'Drama', 3.1); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (3, 'Adventure', 3.6); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (4, 'Sci-fi', 2.2); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (4, 'Period', 1.9); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (4, 'Romance', 3.9); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (5, 'Adventure', 2.4); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (6, 'Childrens', 4.1); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (6, 'Sci-fi', 4.5); 
INSERT INTO genres(Authors_authorsID, genre, rating) VALUE (7, 'Drama', 4.8);  

SELECT * FROM authors;
CREATE VIEW lucrative(Author, Earnings) AS SELECT a.name AS Author, e.earnings AS Earnings FROM earnings e JOIN authors a ON a.authorsID = e.Authors_authorsID WHERE e.earnings > 10000 ORDER BY e.earnings DESC LIMIT 3; 

SELECT * FROM lucrative;

CREATE VIEW genreRating(Author, Genre, Rating) AS SELECT a.name as Author, g.genre as Genre, g.rating AS Rating FROM genres g JOIN authors a ON a.authorsID = g.Authors_authorsID WHERE a.name = "Author 3" order by g.rating DESC LIMIT 3;

SELECT * FROM genreRating;
