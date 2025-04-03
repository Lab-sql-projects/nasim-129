-- 1. View all books with full details
SELECT book_id, title, author, isbn, category_id, available_copies, publication_year 
FROM Books;

-- 2. Show books with category names (instead of author names in original)
SELECT b.book_id, b.title, c.category_name, b.publication_year
FROM Books b
JOIN Categories c ON b.category_id = c.category_id;

-- 3. Available books (more than 0 copies)
SELECT title, author, available_copies 
FROM Books 
WHERE available_copies > 0;

-- 4. Books sorted by publication year (newest first)
SELECT title, author, publication_year 
FROM Books 
ORDER BY publication_year DESC;

-- 5. Top 3 newest books
SELECT title, author, publication_year 
FROM Books 
ORDER BY publication_year DESC
LIMIT 3;

-- 6. Count books by category (instead of by author)
SELECT c.category_name, COUNT(b.book_id) as book_count
FROM Categories c
LEFT JOIN Books b ON c.category_id = b.category_id
GROUP BY c.category_id, c.category_name
ORDER BY book_count DESC;

-- 7. Active members with currently borrowed books
SELECT m.first_name, m.last_name, b.title, l.due_date
FROM Members m
JOIN Loans l ON m.member_id = l.member_id
JOIN Books b ON l.book_id = b.book_id
WHERE l.return_date IS NULL 
AND m.membership_status = 'Active';

-- 8. Overdue books (not returned past due date)
SELECT b.title, m.first_name, m.last_name, l.due_date
FROM Books b
JOIN Loans l ON b.book_id = l.book_id
JOIN Members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL 
AND l.due_date < CURRENT_DATE
ORDER BY l.due_date;