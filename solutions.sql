-- ### Order
-- 1. Find all subjects sorted by subject
-- SELECT subject FROM subjects ORDER BY subject ASC;

-- 2. Find all subjects sorted by location
    --SELECT subject FROM subjects ORDER BY location ASC;
-- ### Where
-- 3. Find the book "Little Women"
-- SELECT * FROM books WHERE title = 'Little Women'
-- 4. Find all books containing the word "Python"
-- SELECT * FROM books WHERE title LIKE '%Python';
-- 5. Find all subjects with the location "Main St" sort them by subject
-- SELECT subject FROM subjects WHERE location = 'Main St';



-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
-- SELECT title,subject_id FROM books
--INNER JOIN subjects ON books.subject_id = subjects.id
-- WHERE subject = 'Computers';

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

-- 8. Find all books that are listed in the stock table
--SELECT books.title, stock.retail FROM books
--JOIN editions ON books.id = editions.book_id
--JOIN stock ON editions.isbn = stock.isbn
--ORDER BY retail DESC;
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
--SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books
JOIN editions ON books.id = editions.book_id
JOIN stock ON editions.isbn = stock.isbn
JOIN publishers ON publishers.id = editions.publisher_id
WHERE books.title ='Dune'
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
--SELECT customers.first_name, customers.last_name, shipments.ship_date, books.tsitle FROM books
JOIN editions ON editions.book_id = books.id
JOIN shipments ON editions.isbn = shipments.isbn
JOIN customers ON shipments.customer_id = customers.id
ORDER BY ship_date ASC;
-- ### Grouping and Counting

-- 11. Get the COUNT of all books
--SELECT COUNT(*) FROM books;
-- 12. Get the COUNT of all Locations
--SELECT COUNT(locations) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
