CREATE SCHEMA IF NOT EXISTS MoviesDB;
USE MoviesDB;

CREATE TABLE MoviesDB.Film (
ID INT PRIMARY KEY,
Title VARCHAR(100) NOT NULL,
Language VARCHAR(50) NOT NULL,
RelaseDate DATE NOT NULL,
Director_ID INT NOT NULL,
Genre_ID INT NOT NULL,
FOREIGN KEY (Director_ID) REFERENCES Director(ID) ON DELETE CASCADE,
FOREIGN KEY (Genre_ID) REFERENCES Genre(ID) ON DELETE CASCADE
);
INSERT INTO film (ID, Title, Language, ReleaseDate, Director_ID, Genre_ID) -- Insert
VALUES
(01, 'Interstellar', 'English', '2014-10-26', 101, 1),
(02, 'The Holdovers', 'English', '2023-10-27', 102, 2),
(03, 'Gone Girl', 'English', '2014-10-3', 103, 3),
(04, 'Home Alone', 'English', '1990-11-10', 104, 4),
(05, 'Donnie Darko', 'English', '2001-10-26', 105, 5),
(06, 'Hacksaw Ridge', 'English', '2016-10-16', 106, 6),
(07, 'Dune', 'English', '2021-9-3', 107, 1),
(08, 'Aftersun', 'English', '2022-10-21', 108, 2),
(09, 'Forgotten', 'English', '2017-11-29', 109, 3),
(10, 'Sherlock Holmes', 'English', '2009-12-25', 110, 5),
(11, 'Black Hawk Down', 'English', '2002-1-18', 111, 6);
DELETE FROM Film -- Delet
WHERE Title = 'Black Hawk Down';
UPDATE Film -- Update
SET Language = 'Korean'
WHERE Title = 'Forgotten';
SELECT Film.Title, Directors.fName, Directors.lName -- Inner join 
FROM Film
INNER JOIN Directors
ON Film.Director_ID = Directors.directorID;

CREATE TABLE Actor (
    ID INT PRIMARY KEY,
    Fname VARCHAR(20) NOT NULL,
    Lname VARCHAR(20) NOT NULL,
    Gender VARCHAR(1) NOT NULL,
    CONSTRAINT Gender_Check CHECK (Gender IN ('M', 'F'))
);

CREATE TABLE Cast (
    ID INT PRIMARY KEY,
    Film_ID INT,
    Actor_ID INT,
    RoleName VARCHAR(20) NOT NULL,
    FOREIGN KEY (Film_ID) REFERENCES Film(Film_ID),
    FOREIGN KEY (Actor_ID) REFERENCES Actor(Actor_ID),
    CHECK (RoleName IN ('Main actor', 'Supporting actor'))
);
CREATE TABLE IF NOT EXISTS Directors (
directorID INT(5) NOT NULL,
fName VARCHAR(50),
lName VARCHAR(50),
gender VARCHAR (1)CHECK (gender IN ('M','F')),
CONSTRAINT PK_directorID PRIMARY KEY (directorID)
);

INSERT INTO Directors (directorID, fName, lName, gender)
VALUES 
(101, 'Christopher', 'Nolan', 'M'),  -- Interstellar
(102, 'Alexander', 'Payne', 'M'),   -- The Holdovers
(103, 'David', 'Fincher', 'M'),     -- Gone Girl
(104, 'Chris', 'Columbus', 'M'),    -- Home Alone
(105, 'Richard', 'Kelly', 'M'),     -- Donnie Darko
(106, 'Mel', 'Gibson', 'M'),       -- Hacksaw Ridge
(107,'Denis', 'Villeneuve', 'M'), -- Dune
(108, 'Charlotte', 'Wells', 'F'),  -- Aftersun
(109, 'Hang-jun', 'Jang', 'M'),    -- Forgotten
(110, 'Guy', 'Ritchie', 'M'),      -- Sherlock Holmes
(111, 'Ridley', 'Scott', 'M');     -- Black Hawk Down

CREATE TABLE IF NOT EXISTS Genres(
genreID INT(2) NOT NULL,
genreName VARCHAR(50) NOT NULL,
CONSTRAINT PK_genreID PRIMARY KEY (genreID)
); 
INSERT INTO Genres (genreID, genreName ) VALUES
    (1,'Science Fiction '), 
    (2,'Drama'),
    (3,'Thriller'),
    (4,'Comedy'),
    (5,'Mystery'),
    (6,'War');

CREATE TABLE Rating (
    ID INT(10) PRIMARY KEY,
    Film_ID INT,
    Ratings DECIMAL (1.1),
    FOREIGN KEY (Film_ID) REFERENCES Film(ID)
);
INSERT INTO Ratings (ID,Ratings) VALUES
(1,9.5),
(2,8),
(3,9),
(4,8.5),
(5,9),
(6,8.5),
(7,8.5),
(8,8.5),
(9,8.5),
(10,8,5),
(11,8);
SELECT * 
FROM Ratings
WHERE Ratings > 8;
