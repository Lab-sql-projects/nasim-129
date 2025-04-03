-- we have these 4 tables:
-- Books: book_id, title, author, isbn, category_id, available_copies, publication_year
-- Members: member_id, first_name, last_name, email, join_date, membership_status
-- Loans: loan_id, book_id, member_id, loan_date, due_date, return_date
-- Categories: category_id, category_name, shelf_location

-- 1. INNER JOIN Query
-- Show all books that are currently on loan with member information
SELECT b.title, b.author, m.first_name, m.last_name, l.loan_date, l.due_date
FROM Loans l
INNER JOIN Books b ON l.book_id = b.book_id
INNER JOIN Members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL
ORDER BY l.due_date;

-- 2. LEFT JOIN Query
-- Show all books and their loan status, including books that have never been loaned
SELECT b.title, b.author, b.isbn, 
       COUNT(l.loan_id) AS times_borrowed,
       MAX(l.loan_date) AS last_borrowed
FROM Books b
LEFT JOIN Loans l ON b.book_id = l.book_id
GROUP BY b.book_id, b.title, b.author, b.isbn
ORDER BY times_borrowed DESC;

-- 3. UPDATE Query
-- Update the status of members who haven't borrowed books in the last year to 'Inactive'
UPDATE Members
SET membership_status = 'Inactive'
WHERE member_id NOT IN (
    SELECT DISTINCT member_id 
    FROM Loans 
    WHERE loan_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
) AND membership_status = 'Active';

-- 4. DELETE Query
-- Delete all loan records for books that have been returned over 5 years ago
DELETE FROM Loans
WHERE return_date IS NOT NULL 
AND return_date < DATE_SUB(CURRENT_DATE, INTERVAL 5 YEAR);

-- 5. Aggregation Query with GROUP BY and HAVING
-- Find categories with more than 5 books where the average publication year is after 2000
SELECT c.category_name, 
       COUNT(b.book_id) AS book_count, 
       AVG(b.publication_year) AS avg_publication_year
FROM Categories c
JOIN Books b ON c.category_id = b.category_id
GROUP BY c.category_id, c.category_name
HAVING COUNT(b.book_id) > 5 AND AVG(b.publication_year) > 2000
ORDER BY book_count DESC;

-- 6. Subquery
-- Find members who have borrowed more books than the average number of books borrowed per member
SELECT m.member_id, m.first_name, m.last_name, COUNT(l.loan_id) AS books_borrowed
FROM Members m
JOIN Loans l ON m.member_id = l.member_id
GROUP BY m.member_id, m.first_name, m.last_name
HAVING COUNT(l.loan_id) > (
    SELECT AVG(loan_count) 
    FROM (
        SELECT COUNT(loan_id) AS loan_count
        FROM Loans
        GROUP BY member_id
    ) AS avg_loans
)
ORDER BY books_borrowed DESC;
