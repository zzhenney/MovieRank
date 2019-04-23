
#5A. INSERT STATEMENTS

#Seed Director
INSERT INTO Director (did, name)
VALUES (default, 'Josh Whedon');

INSERT INTO Director (did, name)
VALUES (default, 'Kenneth Branagh');

INSERT INTO Director (did, name)
VALUES (default, 'J.J. Abrams');


#Seed Movie
INSERT INTO Movie (mid, name, release_date, mpaa_rating, runtime, description, thumbnail_url, did) 
VALUES(default, "Avengers", "04-23-2019","PG-13", TIME("02:38:33"), "Earth''s mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.", 
"https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg", 1);

INSERT INTO Movie (mid, name, release_date, mpaa_rating, runtime, description, thumbnail_url, did) 
VALUES(default, "Thor", "05-06-2011","PG-13", TIME("01:55:00"), "The powerful, but arrogant god Thor, is cast out of Asgard to live amongst humans in Midgard (Earth), where he soon becomes one of their finest defenders.", 
"https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg", 2);

INSERT INTO Movie (mid, name, release_date, mpaa_rating, runtime, description, thumbnail_url, did) 
VALUES(default, "Star Trek", "05-08-2009","PG-13", TIME("02:07:00"), "The brash James T. Kirk tries to live up to his father's legacy with Mr. Spock keeping him in check as a vengeful Romulan from the future creates black holes to destroy the Federation one planet at a time.", 
"https://m.media-amazon.com/images/M/MV5BMjE5NDQ5OTE4Ml5BMl5BanBnXkFtZTcwOTE3NDIzMw@@._V1_SX300.jpg", 3);

INSERT INTO Movie (mid, name, release_date, mpaa_rating, runtime, description, thumbnail_url, did) 
VALUES(default, "Star Trek Into Darkness", "05-16-2013","PG-13", TIME("02:12:00"), "After the crew of the Enterprise find an unstoppable force of terror from within their own organization, Captain Kirk leads a manhunt to a war-zone world to capture a one-man weapon of mass destruction.", 
"https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", 3);


#Seed Genre
INSERT INTO Genre (gid, name)
VALUES (default, 'Action');

INSERT INTO Genre (gid, name)
VALUES (default, 'Adventure');

INSERT INTO Genre (gid, name)
VALUES (default, 'Sci-Fi');


#Seed Actor
INSERT INTO Actor (aid, name, dob, thumbnail_url)
VALUES (default, 'Chris Evans', '1981-06-13', 'https://m.media-amazon.com/images/M/MV5BMTU2NTg1OTQzMF5BMl5BanBnXkFtZTcwNjIyMjkyMg@@._V1_UY317_CR6,0,214,317_AL_.jpg');

INSERT INTO Actor (aid, name, dob, thumbnail_url)
VALUES (default, 'Robert Downey Jr', '1965-04-04', 'https://m.media-amazon.com/images/M/MV5BNzg1MTUyNDYxOF5BMl5BanBnXkFtZTgwNTQ4MTE2MjE@._V1_UX214_CR0,0,214,317_AL_.jpg');

INSERT INTO Actor (aid, name, dob, thumbnail_url)
VALUES (default, 'Chris Hemsworth', '1983-08-11', 'https://m.media-amazon.com/images/M/MV5BOTU2MTI0NTIyNV5BMl5BanBnXkFtZTcwMTA4Nzc3OA@@._V1_UX214_CR0,0,214,317_AL_.jpg');

INSERT INTO Actor (aid, name, dob, thumbnail_url)
VALUES (default, 'Chris Pine', '1980-08-26', 'https://m.media-amazon.com/images/M/MV5BMTM4OTQ4NTU3NV5BMl5BanBnXkFtZTcwNjEwNDU0OQ@@._V1_UX214_CR0,0,214,317_AL_.jpg');


#Seed MovieActor
INSERT INTO MovieActor VALUES(1, 1);
INSERT INTO MovieActor VALUES(2, 1);
INSERT INTO MovieActor VALUES(3, 2);
INSERT INTO MovieActor VALUES(4, 3);
INSERT INTO MovieActor VALUES(4, 4);


#Seed MovieGenre
INSERT INTO MovieGenre VALUE (1, 1);
INSERT INTO MovieGenre VALUE (1, 2);
INSERT INTO MovieGenre VALUE (1, 3);

INSERT INTO MovieGenre VALUE (2, 1);
INSERT INTO MovieGenre VALUE (2, 2);
INSERT INTO MovieGenre VALUE (2, 3);

INSERT INTO MovieGenre VALUE (3, 1);
INSERT INTO MovieGenre VALUE (3, 2);
INSERT INTO MovieGenre VALUE (3, 3);

INSERT INTO MovieGenre VALUE (4, 1);
INSERT INTO MovieGenre VALUE (4, 2);
INSERT INTO MovieGenre VALUE (4, 3);


#Seed User
INSERT INTO User VALUE(default, 'user 1', 'password', 'https://i.kym-cdn.com/entries/icons/mobile/000/027/475/Screen_Shot_2018-10-25_at_11.02.15_AM.jpg');
INSERT INTO User VALUE(default, 'user 2', 'password', 'https://i.kym-cdn.com/entries/icons/mobile/000/027/475/Screen_Shot_2018-10-25_at_11.02.15_AM.jpg');
INSERT INTO User VALUE(default, 'user 3', 'password', 'https://i.kym-cdn.com/entries/icons/mobile/000/027/475/Screen_Shot_2018-10-25_at_11.02.15_AM.jpg');


#Seed Ratings/MovieRating
INSERT INTO Rating values(default, 8, 1);
INSERT INTO MovieRating values(1, last_insert_id());

INSERT INTO Rating values(default, 7, 2);
INSERT INTO MovieRating values(2, last_insert_id());

INSERT INTO Rating values(default, 6, 3);
INSERT INTO MovieRating values(3, last_insert_id());


#5B. DELETE STATEMENTS
#Actor
DELETE FROM actor WHERE aid=1;

#Director
DELETE FROM director WHERE did=1;

#Genre
DELETE FROM genre WHERE gid=1;

#Movie
DELETE FROM movie WHERE mid=1;

#Rating
DELETE FROM rating WHERE rid=1;

#User
DELETE FROM user WHERE uid=1;


#5C. SELECTS STATEMENTS
#M:M
SELECT Actor.name
FROM Actor actor, MovieActor movieActor, Movie movie 
WHERE actor.aid = movieActor.aid AND movie.mid = movieActor.mid AND movie.mid = 1;

SELECT Genre.name, Movie.name
FROM Genre genre, MovieGenre movieGenre, Movie movie 
WHERE genre.gid = movieGenre.gid AND movie.mid = movieGenre.mid AND movie.mid = 1;

#M:1
SELECT Movie.name
FROM Movie movie, Director director
WHERE movie.did = director.did AND director.name = "J.J. Abrams";

#1:M - Return directors who direct more than one movie
SELECT Director.name 
FROM Movie movie, Director director
WHERE movie.did = director.did
GROUP BY director.name
HAVING count(*) > 1

