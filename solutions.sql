-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects
-- 2. Find all subjects sorted by location
SELECT * FROM subjects
ORDER BY location;
-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books
WHERE title IN ('Little Women');
-- 4. Find all books containing the word "Python"
SELECT * FROM books
WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects
WHERE location IN ('Main St');
ORDER BY subject;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT title FROM books
WHERE subject_id = 4;
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT s.subject, a.last_name, a.first_name, b.title
FROM authors a
JOIN books b 
ON a.id = b.author_id
JOIN subjects s
ON s.id = b.subject_id;

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
