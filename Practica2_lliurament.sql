--Pràctica 2 de Alex Barroso i Efrén Cayuela
DROP TABLE Book_Inventory;

DROP TABLE Books;

DROP TABLE Categories;

DROP TABLE Authors;

CREATE TABLE Authors (
    Author_Id INT CONSTRAINT PK_Authors PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Birth_Date DATE,
    Nationality VARCHAR2(50)
);

CREATE TABLE Categories (
    Category_Id INT CONSTRAINT PK_Categories PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL
);

CREATE TABLE Books (
    Book_Id INT CONSTRAINT PK_Books PRIMARY KEY,
    Title VARCHAR2(200) NOT NULL,
    Publication_Year INT,
    Author_Id INT NOT NULL,
    Category_Id INT NOT NULL,
    CONSTRAINT FK_Authors_Books FOREIGN KEY (Author_Id) REFERENCES Authors(Author_Id),
    CONSTRAINT FK_Categories_Books FOREIGN KEY (Category_Id) REFERENCES Categories(Category_Id)
);

CREATE TABLE Book_Inventory (
    Book_Id INT CONSTRAINT PK_Book_Inventory PRIMARY KEY,
    Stock INT,
    CONSTRAINT FK_Books_Book_Inventory FOREIGN KEY (Book_Id) REFERENCES Books(Book_Id)
);
-- INSERTS  Authors
INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (1, 'Gabriel García Márquez', TO_DATE('1927-03-06','YYYY-MM-DD'), 'Colombia');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (2, 'Haruki Murakami', TO_DATE('1949-01-12','YYYY-MM-DD'), 'Japó');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (3, 'J.K. Rowling', TO_DATE('1965-07-31','YYYY-MM-DD'), 'Regne Unit');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (4, 'Albert Camus', TO_DATE('1913-11-07', 'YYYY-MM-DD'), 'França');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (5, 'Virginia Woolf', TO_DATE('1882-01-25', 'YYYY-MM-DD'), 'Regne Unit');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (6, 'Ernest Hemingway', TO_DATE('1899-07-21', 'YYYY-MM-DD'), 'Estats Units');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (7, 'Franz Kafka', TO_DATE('1883-07-03', 'YYYY-MM-DD'), 'Àustria');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (8, 'Jane Austen', TO_DATE('1775-12-16', 'YYYY-MM-DD'), 'Regne Unit');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (9, 'Fyodor Dostoevsky', TO_DATE('1821-11-11', 'YYYY-MM-DD'), 'Rússia');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (10, 'Leo Tolstoy', TO_DATE('1828-09-09', 'YYYY-MM-DD'), 'Rússia');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (11, 'Mark Twain', TO_DATE('1835-11-30', 'YYYY-MM-DD'), 'Estats Units');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (12, 'Charles Dickens', TO_DATE('1812-02-07', 'YYYY-MM-DD'), 'Regne Unit');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (13, 'Jorge Luis Borges', TO_DATE('1899-08-24', 'YYYY-MM-DD'), 'Argentina');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (14, 'Kazuo Ishiguro', TO_DATE('1954-11-08','YYYY-MM-DD'), 'Japó');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (15, 'Octavia E. Butler', TO_DATE('1947-06-22','YYYY-MM-DD'), 'Estats Units');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (16, 'Chimamanda Ngozi Adichie', TO_DATE('1977-09-15','YYYY-MM-DD'), 'Nigèria');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (17, 'J.R.R. Tolkien', TO_DATE('1892-01-03', 'YYYY-MM-DD'), 'United Kingdom');

INSERT INTO Authors (Author_Id, Name, Birth_Date, Nationality)
VALUES (18, 'George R.R. Martin', TO_DATE('1948-09-20', 'YYYY-MM-DD'), 'United States');


-- INSERTS  Categories
INSERT INTO Categories (Category_Id, Name)
VALUES (1, 'Ficció Contemporània');

INSERT INTO Categories (Category_Id, Name)
VALUES (2, 'Ciència Ficció');

INSERT INTO Categories (Category_Id, Name)
VALUES (3, 'Fantasia');

INSERT INTO Categories (Category_Id, Name)
VALUES (4, 'Història');

INSERT INTO Categories (Category_Id, Name)
VALUES (5, 'Poesia');

INSERT INTO Categories (Category_Id, Name)
VALUES (6, 'Biografia');

INSERT INTO Categories (Category_Id, Name)
VALUES (7, 'Autobiografia');

INSERT INTO Categories (Category_Id, Name)
VALUES (8, 'Filosofia');

INSERT INTO Categories (Category_Id, Name)
VALUES (9, 'Teatre');

INSERT INTO Categories (Category_Id, Name)
VALUES (10, 'Religió');

INSERT INTO Categories (Category_Id, Name)
VALUES (11, 'Crim');

INSERT INTO Categories (Category_Id, Name)
VALUES (12, 'Misteri');

INSERT INTO Categories (Category_Id, Name)
VALUES (13, 'Romàntic');


-- INSERTS  Books
INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (1, 'Cent anys de solitud', 1967, 1, 1);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (2, '1Q84', 2009, 2, 1);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (3, 'Harry Potter i la pedra filosofal', 1997, 3, 3);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (4, 'L''Estranger', 1942, 4, 1);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (5, 'Mrs. Dalloway', 1925, 5, 1);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (6, 'For Whom the Bell Tolls', 1940, 6, 1);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (7, 'Die Verwandlung', 1915, 7, 1);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (8, 'Pride and Prejudice', 1813, 8, 13);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (9, 'Crime and Punishment', 1866, 9, 11);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (10, 'War and Peace', 1869, 10, 4);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (11, 'The Adventures of Huckleberry Finn', 1884, 11, 1);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (12, 'Great Expectations', 1861, 12, 1);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (13, 'Ficcions', 1944, 13, 1);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (14, 'El Senyor dels Anells: La Comunitat de l''Anell', 1954, 17, 3);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (15, 'Joc de Trons', 1996, 18, 3);

INSERT INTO Books (Book_Id, Title, Publication_Year, Author_Id, Category_Id)
VALUES (16, 'El amor en los tiempos del cólera', 1985, 1, 1);


-- INSERTS  Book_Inventory
INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (1, 10);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (2, 5);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (3, 8);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (4, 15);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (5, 20);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (6, 8);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (7, 12);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (8, 30);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (9, 10);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (10, 5);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (11, 18);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (12, 25);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (13, 10);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (14, 15);

INSERT INTO Book_Inventory (Book_Id, Stock)
VALUES (15, 20);

commit;

/*COMPROVACIÓ DE LES TAULES */
select * from Authors ORDER BY 4;

select * from Books;

select * from Book_Inventory;

select * from categories;

--PREGUNTES --

--1.Calcula el nombre total de llibres per nacionalitat de l'autor. Mostrant la nacionalitat i el total de llibres
select a.nationality as nacionalitat, count(b.book_id) as total_de_llibres
from authors a inner join books b on a.author_id=b.author_id
group by a.nationality;
--2.Mostra una llista de llibres amb el seu títol, any de publicacio, i una etiqueta que indiqui si el llibre va ser publicat abans de 2000 "Antic" o després de 2000 "Modern".
SELECT title, publication_year,
       CASE
           WHEN publication_year < 2000 THEN 'Antic'
           ELSE 'Modern'
       END AS periode
FROM books
ORDER BY book_id;
--3.Mostra el nombre de llibres per any de publicació, ordenat per any.
select publication_year, count(book_id)
from books
group by books.publication_year
order by books.publication_year;
--4.Mostra el nombre total de llibres de cada autor amb el nom de l'autor.
SELECT a.name autor, COUNT(b.book_id) llibres
from authors a
inner join books b on a.author_id = b.author_id
GROUP BY a.name;
--5.Calcula la mitjana d'anys des de la publicació fins a l'actualitat dels llibres escrits per l'autor "Haruki Murakami".
SELECT AVG(EXTRACT(YEAR FROM SYSDATE) - publication_year) Mitjana
from books
where author_id IN(select author_id  from authors where name like 'Haruki Murakami');
--6.Mostra el nombre total de llibres per categoria.
SELECT c.name categoria, count(b.book_id) llibres
FROM categories c
INNER JOIN books b on c.category_id=b.category_id
group by name;
--7. Mostra les categories de llibres que tenen almenys 2 llibres.
SELECT c.name categoria, count(b.book_id) llibres
FROM categories c
INNER JOIN books b on c.category_id=b.category_id
group by name
HAVING count(b.book_id)>=2;
--8.Obtenir una llista dels títols de llibres i el nombre d'exemplars en estoc de cadascun, on el nombre d'exemplars estigui representat com una cadena de caràcters amb el següent format: "Exemplars en estoc: <quantitat>".
SELECT b.title titol, 'Exemplars en estoc: ' || i.stock estoc
FROM BOOKS b
INNER JOIN book_inventory i on b.book_id = i.book_id;
--9. Mostra el títol dels llibres, el nombre d'exemplars en estoc i l'any de publicació de cada llibre amb més de 5 exemplars en estoc.
SELECT b.title titol, bi.stock estoc, b.publication_year as "ANY"
FROM books b
INNER JOIN book_inventory bi ON b.book_id = bi.book_id
WHERE bi.stock > 5;

--10. Mostra la data de publicació, i el nom dels autors dels llibres que tenen almenys un llibre amb una data de publicació anterior a l'any 1990.
SELECT b.publication_year, a.name
FROM books b
INNER JOIN authors a ON b.author_id = a.author_id
WHERE b.publication_year < 1990;

--11.Mostra si hi ha algun autor que no té cap llibre publicat.
select a.name
from authors a
left join books b on b.author_id = a.author_id
where b.book_id is null;

--12. Obtenir els primers 3 autors els noms dels quals comencin amb la lletra "J".
select name
from authors
where name like 'J%' and ROWNUM<=3
order by name;

--13.Troba tots els autors que tenen almenys un llibre amb una data de publicació anterior al 1900/05/25, el titol i la data de publicacio.
SELECT a.name, b.title, b.publication_year
FROM authors a
INNER JOIN books b ON a.author_id = b.author_id
WHERE b.publication_year < 1900; --els llibres només tenen la data de publicacio en any, o sigui que només podem comprobar que sigui anterior a 1900, sense concretar el dia i tampoc el mes

--14. Troba tots els llibres que tenen almenys un exemplar en estoc i una categoria que continguin la paraula "Ficció".
SELECT b.title
FROM books b
INNER JOIN book_inventory bi ON b.book_id = bi.book_id
INNER JOIN categories c ON b.category_id = c.category_id
WHERE bi.stock > 0 AND c.name LIKE '%Ficció%';


--15.Troba tots els autors que tenen almenys un llibre publicat en la mateixa categoria que el llibre amb títol "Harry Potter i la pedra filosofal".
SELECT DISTINCT a.name
FROM authors a
INNER JOIN books b ON a.author_id = b.author_id
WHERE b.category_id in (SELECT category_id FROM books WHERE title = 'Harry Potter i la pedra filosofal');

--16.Mostra una llista combinada de tots els autors i totes les categories sense repeticions.
Select name from authors
UNION
select name from categories;

--17. Troba els llibres que tenen el mateix autor i mostra el títol de tots dos llibres, juntament amb el nom de l'autor.
SELECT b1.title AS book1, b2.title AS book2, a.name
FROM books b1
INNER JOIN books b2 ON b1.author_id = b2.author_id
INNER JOIN authors a ON b1.author_id = a.author_id
WHERE b1.book_id <> b2.book_id;

--18.Troba tots els autors que no tenen cap llibre publicat a la taula Books.
select a.name
from authors a
where author_id not in (select author_id from books);

--19. Mostra tots els llibres de la taula Books, inclòs aquells que no tenen inventari associat a la taula Book_Inventory(RIGHT OUTER)
select b.title
from book_inventory bi
right outer join books b on b.book_id=bi.book_id;

--20.Mostra els autors que han escrit llibres publicats abans de 1950 i que tenen un estoc de llibres en inventari superior a 10

SELECT DISTINCT a.name
FROM authors a
INNER JOIN books b ON a.author_id = b.author_id
INNER JOIN book_inventory bi ON b.book_id = bi.book_id
WHERE b.publication_year < 1950 AND bi.stock > 10;

