-- Insert data into Authors table
INSERT INTO Authors (author_id, first_name, last_name, birth_year, nationality)
VALUES 
    (1, 'Jane', 'Austen', 1775, 'British'),
    (2, 'George', 'Orwell', 1903, 'British'),
    (3, 'Gabriel', 'García Márquez', 1927, 'Colombian'),
    (4, 'Toni', 'Morrison', 1931, 'American');

-- Insert data into Books table
INSERT INTO Books (book_id, title, isbn, publication_year, publisher, available_copies, author_id)
VALUES
    (1, 'Pride and Prejudice', '9780141439518', 1813, 'Penguin Classics', 5, 1),
    (2, '1984', '9780451524935', 1949, 'Signet Classic', 3, 2),
    (3, 'One Hundred Years of Solitude', '9780060883287', 1967, 'Harper Perennial', 2, 3),
    (4, 'Beloved', '9781400033416', 1987, 'Vintage', 4, 4),
    (5, 'Sense and Sensibility', '9780141439662', 1811, 'Penguin Classics', 2, 1);

-- Insert data into Borrowers table
INSERT INTO Borrowers (borrower_id, first_name, last_name, email, phone, registration_date, status)
VALUES
    (1, 'John', 'Smith', 'john.smith@email.com', '555-1234', '2023-01-15', 'active'),
    (2, 'Emma', 'Johnson', 'emma.j@email.com', '555-5678', '2023-02-20', 'active'),
    (3, 'Michael', 'Brown', 'michael.b@email.com', '555-9012', '2023-03-10', 'inactive'),
    (4, 'Sarah', 'Davis', 'sarah.d@email.com', '555-3456', '2023-04-05', 'active');

-- Insert data into Loans table
INSERT INTO Loans (loan_id, book_id, borrower_id, checkout_date, due_date, return_date, status)
VALUES
    (1, 1, 1, '2023-06-01', '2023-06-15', '2023-06-14', 'returned'),
    (2, 2, 2, '2023-06-05', '2023-06-19', NULL, 'checked-out'),
    (3, 3, 1, '2023-06-10', '2023-06-24', NULL, 'checked-out'),
    (4, 4, 4, '2023-05-20', '2023-06-03', '2023-06-10', 'returned'),
    (5, 5, 2, '2023-05-25', '2023-06-08', NULL, 'overdue');
