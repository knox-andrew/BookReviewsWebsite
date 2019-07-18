START TRANSACTION;

DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS book;
DROP SEQUENCE IF EXISTS seq_review_id;

CREATE SEQUENCE seq_review_id;

CREATE TABLE book
(
	book_id INTEGER NOT NULL,
    title VARCHAR(256) NOT NULL,
	author VARCHAR(64) NOT NULL,
    description VARCHAR(1024) NOT NULL,
	img_name VARCHAR(128) NOT NULL,

	CONSTRAINT pk_book_book_id PRIMARY KEY (book_id)
); 

CREATE TABLE review
(
	review_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_review_id'),
	book_id INTEGER NOT NULL,
	username VARCHAR(100) NOT NULL,
	rating INTEGER NOT NULL,
	review_title VARCHAR(200) NOT NULL,
	review_text VARCHAR(1000) NOT NULL,
	review_date TIMESTAMP DEFAULT NOW(),

	CONSTRAINT fk_review_book_id FOREIGN KEY(book_id) REFERENCES book(book_id)
);

INSERT INTO book(book_id, title, author, description, img_name) 
VALUES (
            1, 
            'Squirrel Cigar Parties for Dummies',
            'Craig Castelaz', 
            'Having trouble throwing a killer squirrel cigar party? This book will answer all the questions you have and then some!',
            'forDummies.png'
       );

INSERT INTO book(book_id, title, author, description, img_name) 
VALUES (
            2,
            'Fizz Buzz for Dummies',
            'Mystery Author', 
            'This book solves the mystery of the origin of Fizz and Buzz. What does it mean? I don''t know cause it wasn''t on Wikipedia',
            'fizzBuzz.jpg'
       );

INSERT INTO book(book_id, title, author, description, img_name) 
VALUES (
            3,
            'Making ''For Dummies'' Book Covers For Dummies',
            'Fake Author Name', 
            'Don''t feel like coming up with something clever',
            'dummiesForDummies.jpg'
       );

INSERT INTO review(book_id, username, rating, review_title, review_text) VALUES (1, 'dwintrich', 5, 'Changed my life', 'Before reading this book, my squirrel parties were always lackluster (I never had enough cigars!).  Thanks to Craig''s insightful advice, my squirrel parties are now at the top of everyone''s social calendar!');
INSERT INTO review(book_id, username, rating, review_title, review_text) VALUES (1, 'jtucholski', 4, 'No party complete without it', 'There''s no way to hold a succesful party without first looking at this book!');
INSERT INTO review(book_id, username, rating, review_title, review_text) VALUES (1, 'ccastelaz', 2, 'Slow read', 'I fell asleep a few times because it was a slow read');
INSERT INTO review(book_id, username, rating, review_title, review_text) VALUES (1, 'cborders', 5, 'I knew nothing about squirrel parties', 'After reading this, I am not the master on squirrel parties!');

INSERT INTO review(book_id, username, rating, review_title, review_text) VALUES (2, 'david', 2, 'Not great', 'The cover is a lie');
INSERT INTO review(book_id, username, rating, review_title, review_text) VALUES (2, 'chris', 4, 'Huh, who knew?', 'Getting bored of writing fake reviews');
INSERT INTO review(book_id, username, rating, review_title, review_text) VALUES (2, 'katie', 5, 'Hated it', 'I don''t know how rating systems work');


COMMIT;