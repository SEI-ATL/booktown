-- ### Order
-- 1. Find all subjects sorted by subject
SELECT *
FROM subjects
ORDER BY subject;
-- 2. Find all subjects sorted by location
booktown=# SELECT *
booktown-# FROM subjects
booktown-# ORDER BY location
-- ### Where
-- 3. Find the book "Little Women"
booktown=# SELECT *
booktown-# FROM books
booktown-# WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"

-- 5. Find all subjects with the location "Main St" sort them by subject
booktown=# SELECT *
booktown-# FROM subjects
booktown-# WHERE location = 'Main St'
booktown-# ORDER BY subject;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
booktown=# SELECT b.title
booktown-# FROM books b
booktown-# LEFT JOIN subjects s
booktown-# ON b.subject_id = s.id
booktown-# WHERE s.subject = 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
booktown=# SELECT b.title, a.first_name, a.last_name, s.subject
booktown-# FROM books b
booktown-# JOIN authors a
booktown-# ON b.author_id = a.id
booktown-# JOIN subjects s
booktown-# ON b.subject_id = s.id;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
booktown=# SELECT b.title, s.retail
booktown-# FROM books b
booktown-# JOIN editions e
booktown-# ON b.id = e.book_id
booktown-# JOIN stock s
booktown-# ON e.isbn = s.isbn
booktown-# WHERE s.stock > 0;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
booktown=# SELECT b.title, e.isbn, p.name, s.retail
booktown-# FROM publishers p
booktown-# JOIN editions e
booktown-# ON p.id = e.publisher_id
booktown-# JOIN stock s
booktown-# ON e.isbn = s.isbn
booktown-# JOIN books b
booktown-# ON e.book_id = b.id
booktown-# WHERE title = 'Dune';
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
