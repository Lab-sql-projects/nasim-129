-- Basic SELECT query to view all books
SELECT * FROM Books;

-- Join Books with Authors to display book details with author names
SELECT b.book_id, b.title, b.publication_year, a.first_name, a.last_name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id;

-- Filter books by availability (WHERE)
SELECT title, available_copies 
FROM Books 
WHERE available_copies > 0;

-- Sort books by publication year (ORDER BY)
SELECT title, publication_year 
FROM Books 
ORDER BY publication_year DESC;

-- Limit results to top 3 most recent books
SELECT title, publication_year 
FROM Books 
ORDER BY publication_year DESC
LIMIT 3;

-- Count books by author
SELECT a.first_name, a.last_name, COUNT(b.book_id) as book_count
FROM Authors a
LEFT JOIN Books b ON a.author_id = b.author_id
GROUP BY a.author_id, a.first_name, a.last_name;

-- Find active borrowers with current loans
SELECT br.first_name, br.last_name, b.title, l.due_date
FROM Borrowers br
JOIN Loans l ON br.borrower_id = l.borrower_id
JOIN Books b ON l.book_id = b.book_id
WHERE l.status = 'checked-out' AND br.status = 'active';

-- Find overdue books
SELECT b.title, br.first_name, br.last_name, l.due_date
FROM Books b
JOIN Loans l ON b.book_id = l.book_id
JOIN Borrowers br ON l.borrower_id = br.borrower_id
WHERE l.status = 'overdue'
ORDER BY l.due_date;
