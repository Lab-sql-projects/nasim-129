-- Query 1: Currently loaned books with member info
SELECT b.title, b.author, m.first_name, m.last_name, l.loan_date, l.due_date
FROM Loans l
INNER JOIN Books b ON l.book_id = b.book_id
INNER JOIN Members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL
ORDER BY l.due_date;

-- Query 2: All books with loan status
SELECT b.title, b.author, b.isbn, 
       COUNT(l.loan_id) AS times_borrowed,
       MAX(l.loan_date) AS last_borrowed
FROM Books b
LEFT JOIN Loans l ON b.book_id = l.book_id
GROUP BY b.book_id, b.title, b.author, b.isbn
ORDER BY times_borrowed DESC;

-- Query 3: Update inactive members
SET SQL_SAFE_UPDATES = 0;
UPDATE Members
SET membership_status = 'Inactive'
WHERE member_id NOT IN (
    SELECT DISTINCT member_id 
    FROM Loans 
    WHERE loan_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
) AND membership_status = 'Active';
SET SQL_SAFE_UPDATES = 1;

-- Query 4: Delete old loan records
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Loans
WHERE return_date IS NOT NULL 
AND return_date < DATE_SUB(CURRENT_DATE, INTERVAL 5 YEAR);
SET SQL_SAFE_UPDATES = 1;

-- Query 5: Popular modern categories
SELECT c.category_name, 
       COUNT(b.book_id) AS book_count, 
       AVG(b.publication_year) AS avg_publication_year
FROM Categories c
JOIN Books b ON c.category_id = b.category_id
GROUP BY c.category_id, c.category_name
HAVING COUNT(b.book_id) > 5 AND AVG(b.publication_year) > 2000
ORDER BY book_count DESC;

-- Check book count per category
SELECT c.category_name, COUNT(b.book_id) AS book_count
FROM Categories c
LEFT JOIN Books b ON c.category_id = b.category_id
GROUP BY c.category_id, c.category_name
ORDER BY book_count DESC;

-- Check average publication year per category
SELECT c.category_name, 
       AVG(b.publication_year) AS avg_year,
       COUNT(b.book_id) AS book_count
FROM Categories c
JOIN Books b ON c.category_id = b.category_id
GROUP BY c.category_id, c.category_name
ORDER BY avg_year DESC;

-- Query 6: Heavy borrowers
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