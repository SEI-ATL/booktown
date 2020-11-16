-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects 
ORDER BY subject;

-- 2. Find all subjects sorted by location
SELECT subject FROM subjects 
ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books
WHERE title = 'Little Women';

-- 4. Find all books containing the word "Python"
SELECT * FROM books
WHERE title LIKE '%Python%';

-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT subject FROM subjects
WHERE location = 'Main St'
ORDER BY subject;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT title FROM books 
JOIN subjects ON (subjects.id=subject_id)
WHERE subject= 'Computers';

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

SELECT title, subject, last_name, first_name FROM books
JOIN subjects ON (subjects.id=subject_id)
JOIN authors ON (authors.id=author_id);

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT title, cost FROM stock 
JOIN editions ON (editions.isbn=stock.isbn)
JOIN books ON (editions.book_id=books.id)
ORDER BY cost;

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price

SELECT title, stock.isbn, publishers.name, stock.cost FROM books
JOIN editions ON (books.id=editions.book_id)
JOIN stock ON (stock.isbn=editions.isbn)
JOIN publishers ON (editions.publisher_id=publishers.id)
WHERE title='Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

SELECT books.title, customers.first_name, customers.last_name, ship_date 
FROM shipments JOIN customers ON (customers.id=customer_id)
JOIN editions ON (editions.isbn=shipments.isbn)
JOIN books ON (editions.book_id = books.id)
ORDER BY ship_date;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(title) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects
WHERE location IS NOT NULL
GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT book_id, title, COUNT(book_id) FROM books 
JOIN editions ON (book_id=books.id)
GROUP BY book_id, title;
