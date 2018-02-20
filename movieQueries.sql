show tables;

select * from genres_movies limit 10;

select genre_id, count(genre_id) as cnt from genres_movies group by genre_id;

select g.name, count(m.genre_id) as cnt from genres_movies m join genres g on (m.genre_id = g.id) group by genre_id order by cnt desc limit 1;

/*7*/
select * from genres;

/*FINDS ALL THE OCCUPTATIONS ASSOCIATED WITH HORROR*/
select * from ratings r join genres_movies g on r.movie_id = g.movie_id join users u on r.user_id = u.id where g.id = 11 limit 10;

/*FINDS AND ORDERS BY COUNT THE MOST COMMON OCCUPATION FOR HORROR MOVIES*/
select o.name, count(u.occupation_id) as cnt from ratings r join genres_movies g on r.movie_id = g.movie_id join users u on r.user_id = u.id join occupations o on u.occupation_id = o.id where g.id = 11 group by u.occupation_id order by cnt desc;

/*8*/
/*RETURNS THE AMOUNT OF RATINGS GIVEN BY EACH OCCUPATION (WE CAN SEE THAT STUDENTS LEAVE BY FAR, MORE RATINGS THAN ANY OTHER OCCUPATION)*/
select o.name, count(r.rating) as cnt from ratings r join users u on r.user_id = u.id join occupations o on u.occupation_id = o.id group by u.occupation_id order by cnt desc;

/*RETURN THE OCCUPATIONS WITH THE HIGHEST AVERAGE RATINGS OF MOVIES (WE FIND THAT EXECUTIVES, SALESMEN AND NONE/OTHER ARE THE HIGHEST RATERS)*/
select o.name, avg(r.rating) as cnt from ratings r join genres_movies g on r.movie_id = g.movie_id join users u on r.user_id=u.id join occupations o on u.occupation_id = o.id where g.id = 11 group by u.occupation_id order by cnt desc;
 
 
 /*RETURNS THE SAME AS ABOVE WITH ADDITIONAL CONDITIONAL THAT CHECKS IF THE NUMBER OF REVIEWS IS ABOVE OR EQUAL TO 3*/
select o.name, count(r.rating) as ratings, avg(r.rating) as cnt from ratings r join genres_movies g on r.movie_id = g.movie_id join users u on r.user_id=u.id join occupations o on u.occupation_id = o.id where g.id = 11 group by u.occupation_id having count(r.rating) >= 3 order by cnt desc;

/*Does the same but with conditional at the beginning*/
select o.name, count(r.rating) >= 3 as ratings, avg(r.rating) as cnt from ratings r join genres_movies g on r.movie_id = g.movie_id join users u on r.user_id=u.id join occupations o on u.occupation_id = o.id where g.id = 11 group by u.occupation_id order by cnt desc;



select * from genres;
select o.name, count(r.rating) as ratings, avg(r.rating) as cnt, g.genre_id from ratings r  join genres_movies g on r.movie_id = g.movie_id join users u on r.user_id=u.id join occupations o on u.occupation_id = o.id group by u.occupation_id order by cnt desc;

/*FINDS THE MOST RATED MOVIES*/
select g.movie_id, count(r.rating) as numberOfReviews from ratings r join genres_movies g on r.movie_id = g.movie_id group by g.movie_id order by numberOfReviews desc limit 10;

/*FINDS THE HIGHEST RATED MOVIE WITH MORE THAN TEN REVIEWS*/
select g.movie_id, count(r.rating) as numberOfReviews, avg(r.rating) as rating from ratings r join genres_movies g on r.movie_id = g.movie_id group by g.movie_id having count(r.rating) >= 10 order by rating desc limit 10;

/*FINDS THE LOWEST RATED MOVIE WITH MORE THAN TEN REVIEWS*/
select g.movie_id, count(r.rating) as numberOfReviews, avg(r.rating) as rating from ratings r join genres_movies g on r.movie_id = g.movie_id group by g.movie_id having count(r.rating) >= 10 order by rating desc limit 10;


