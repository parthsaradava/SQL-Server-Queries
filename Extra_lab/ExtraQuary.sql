CREATE TABLE MovieDetails
(
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(100),
    Director VARCHAR(100),
    ReleaseYear INT
);

INSERT INTO MovieDetails
(MovieID, Title, Genre, Director, ReleaseYear)
VALUES
(1, 'The Dark Knight', 'Action', 'Christopher Nolan', 2008),

(2, 'Inception', 'Sci-Fi', 'Christopher Nolan', 2010),

(3, 'Avengers:Endgame', 'Drama', 'Anthony Russo', 2019),

(4, 'The Avengers', 'Action', 'Joss Whedon', 2012),

(5, 'Titanic', 'Romance', 'James Cameron', 1997),

(6, 'Interstellar', 'Sci-Fi', 'Christopher Nolan', 2014),

(7, 'The Godfather', 'Crime', 'Francis Ford Coppola', 1972),

(8, 'Avengers:Infinity War', 'Action', 'Anthony Russo', 2018),

(9, 'The Batman', 'Crime', 'Matt Reeves', 2022),

(10, 'Jurassic Park', 'Adventure', 'Steven Spielberg', 1993);

select * from MovieDetails



------------------------------------------------MovieFinancials-----------------------------


CREATE TABLE MovieFinancials
(
    FinancialID INT PRIMARY KEY,
    BudgetUSD DECIMAL(12,2),
    BoxOfficeUSD DECIMAL(12,2),
    MovieID INT,
    
    FOREIGN KEY (MovieID)
        REFERENCES MovieDetails(MovieID)
);

INSERT INTO MovieFinancials
(FinancialID, BudgetUSD, BoxOfficeUSD, MovieID)
VALUES
(1, 185000000.00, 1005000000.00, 1),

(2, 160000000.00, 839000000.00, 2),

(3, 356000000.00, 2798000000.00, 3),

(4, 220000000.00, 1518000000.00, 4),

(5, 200000000.00, 2264000000.00, 5),

(6, 165000000.00, 731000000.00, 6),

(7, 6000000.00, 250000000.00, 7),

(8, 321000000.00, 2050000000.00, 8),

(9, 200000000.00, 772000000.00, 9),

(10, 63000000.00, 1046000000.00, 10);


select * from MovieFinancials



------------------------------------------MovieRatingsDuration------------------------


CREATE TABLE MovieRatingsDuration
(
    RatingID INT PRIMARY KEY,
    DurationMin INT,
    Rating DECIMAL(12,2),
    Language VARCHAR(100),
    Country VARCHAR(100),
    MovieID INT,

    FOREIGN KEY (MovieID)
        REFERENCES MovieDetails(MovieID)
);




INSERT INTO MovieRatingsDuration
(RatingID, DurationMin, Rating, Language, Country, MovieID)
VALUES
(1, 152, 9.0, 'English', 'USA', 1),

(2, 148, 8.8, 'English', 'USA', 2),

(3, 181, 8.4, 'English', 'USA', 3),

(4, 143, 8.0, 'English', 'USA', 4),

(5, 195, 7.9, 'English', 'USA', 5),

(6, 169, 8.6, 'English', 'USA', 6),

(7, 175, 9.2, 'English', 'USA', 7),

(8, 149, 8.4, 'English', 'USA', 8),

(9, 176, 7.8, 'English', 'USA', 9),

(10, 127, 8.1, 'English', 'USA', 10);

select * from MovieRatingsDuration





--1. Retrive first five distinct movies along with their title from MovieDetails table.

  SELECT TOP 5 Title FROM MovieDetails
--2. Display the total of the BudgetUSD and BoxOfficeUSD assign the name TotalUSD from MovieFinancials.

    SELECT SUM(BudgetUSD + BoxOfficeUSD) AS TOTALUSD FROM MovieFinancials
--3. Insert the new row with this data (11,The Incredible Hulk, Action, Louis Leterrier,2008) in MovieDetails
--table.
   INSERT INTO MovieDetails
    (MovieID, Title, Genre, Director, ReleaseYear)
    VALUES
    (11, 'The Incredible Hulk', 'Action', 'Louis LeterrierLouis Leterrier', 2008)
    
    SELECT * FROM MovieDetails
--4. Set the value of the genre to ‘Action’ of ‘Avengers:Endgame’ movie from MovieDetails table.

    UPDATE MovieDetails
    SET Genre = 'Action'
    WHERE Title = 'Avengers:Endgame'
    SELECT * FROM MovieDetails
--5. Delete the records with duration of 181 minutes from MovieRatingsDuration table.
    
    DELETE FROM MovieRatingsDuration
    WHERE DurationMin = 181

    SELECT * FROM MovieRatingsDuration
--6. Add a new column ‘Producer’ into the MovieDetails table.

    ALTER TABLE MOVIEDETAILS
    ADD PRODUCER VARCHAR(30)

    SELECT * FROM MovieDetails
--7. Delete records of MovieFinancials table without removing its table structure.

    TRUNCATE TABLE MovieFinancials

    SELECT * FROM MovieFinancials
--8. Retrive all the movies from MovieDetails table with title starting with ‘The’.

    SELECT * FROM MovieDetails
    WHERE Title LIKE 'THE%'
--9. Retrive name of directors includes ‘son’ from MovieDetails table.
    
    SELECT * FROM MovieDetails
    WHERE Director LIKE '%SON%'
    
--10. Convert and display title of all movies in uppercase.

    select UPPER(title) from MovieDetails
--11. Display the highest rating from the MovieRatingsDuration table.

    SELECT MAX(Rating) AS HIGESTRATING FROM MovieRatingsDuration
--12. Calculate the years between current year and movies release year.
    
    SELECT (YEAR(GETDATE()) - ReleaseYear) AS DIFF FROM MovieDetails
--13. Find the languages in which movies have an average rating of greater than 8.0. Display the language
--and the average rating.

    SELECT Language,AVG(Rating) 
    FROM MovieRatingsDuration
    GROUP BY Language
    HAVING AVG(Rating) > 8
--14. Retrieve the minimum, maximum, and average movie duration for each language in the
--MovieRatingsDuration table, but display only those languages where the average rating is greater than
--7.5.

    SELECT Language,AVG(DurationMin)  AS AVG_RATING , MAX(DurationMin) AS MAX_RATING , MIN(DurationMin) AS MIN_RATING
    FROM MovieRatingsDuration
    GROUP BY Language
    HAVING AVG(Rating) > 7.5
--15. Find the titles of movies whose budget is higher than the average budget of all movies.(Do not use
--JOINS)

   SELECT * FROM MovieDetails
   WHERE MovieID IN(
    SELECT MovieID FROM MovieFinancials
    WHERE BudgetUSD > (
        SELECT AVG(BudgetUSD) FROM MovieFinancials
    )
    )
--16. Find the titles of movies that have a box office revenue greater than the average box office revenue of
--all movies.

 SELECT * FROM MovieDetails
   WHERE MovieID IN(
    SELECT MovieID FROM MovieFinancials
    WHERE BoxOfficeUSD > (
        SELECT AVG(BoxOfficeUSD) FROM MovieFinancials
    )
    )
--17. Create a view with Rating, Language and Country columns with no data and named it MovieReview.
    
    CREATE VIEW MovieReview AS
    SELECT RATING , Language , Country FROM MovieRatingsDuration
    WHERE 1 = 0

    SELECT * FROM MovieReview

--18. List all movies that have the same director but different genres, displaying the director’s name, both
--movie titles, and their respective genres.

    SELECT M1.Genre , M1.Director ,M1.Title , M2.Genre FROM MovieDetails M1
    JOIN MovieDetails M2
    ON M1.Director = M2.Director
    AND M1.MovieID > M2.MovieID
    WHERE M1.Genre <> M2.Genre

--19. Retrieve the title, director, and box office earnings for all movies that were released after 2010, along
--with their ratings.
    SELECT M1.Title , M1.Director , M2.BoxOfficeUSD FROM  MovieDetails M1
    JOIN   MovieFinancials M2
    ON M1.MovieID = M2.MovieID
    JOIN MovieRatingsDuration M3
    ON M1.MovieID = M3.MovieID
    WHERE ReleaseYear > 2010

--20. List all directors and the number of movies they have directed, but only include directors who have
--directed more than 1 movie.

    SELECT Director , COUNT(MovieID) AS COUNT_MOVIE FROM MovieDetails
    GROUP BY Director
    HAVING COUNT(MovieID) > 1