USE library_db;

-- Insert dummy data into Categories
INSERT INTO Categories (category_name, shelf_location) VALUES
('Fiction', 'A1'),
('Science Fiction', 'A2'),
('Mystery', 'B1'),
('Biography', 'B2'),
('History', 'C1'),
('Science', 'C2'),
('Technology', 'D1'),
('Romance', 'D2'),
('Fantasy', 'E1'),
('Self-Help', 'E2');

-- Insert dummy data into Books
INSERT INTO Books (title, author, isbn, category_id, available_copies, publication_year) VALUES
('The Great Adventure', 'John Smith', '978-1234567890', 1, 3, 2010),
('Space Odyssey', 'Alice Johnson', '978-2345678901', 2, 2, 2015),
('Murder at Midnight', 'Robert Brown', '978-3456789012', 3, 1, 2018),
('Einstein: His Life', 'Mary Davis', '978-4567890123', 4, 2, 2005),
('World War II', 'James Wilson', '978-5678901234', 5, 4, 2012),
('Quantum Physics', 'Sarah Miller', '978-6789012345', 6, 1, 2020),
('Python Programming', 'David Lee', '978-7890123456', 7, 3, 2021),
('Love in Paris', 'Emma Taylor', '978-8901234567', 8, 2, 2019),
('The Dragon King', 'Michael Clark', '978-9012345678', 9, 1, 2017),
('Mindfulness 101', 'Laura White', '978-0123456789', 10, 2, 2022),
('The Lost City', 'John Smith', '978-1122334455', 1, 1, 2008),
('Mars Colony', 'Alice Johnson', '978-2233445566', 2, 3, 2020),
('The Silent Witness', 'Robert Brown', '978-3344556677', 3, 2, 2016),
('Marie Curie: Pioneer', 'Mary Davis', '978-4455667788', 4, 1, 2014),
('Ancient Civilizations', 'James Wilson', '978-5566778899', 5, 2, 2011);

-- Insert dummy data into Members
INSERT INTO Members (first_name, last_name, email, join_date, membership_status) VALUES
('John', 'Doe', 'john.doe@email.com', '2018-05-15', 'Active'),
('Jane', 'Smith', 'jane.smith@email.com', '2019-02-20', 'Active'),
('Bob', 'Johnson', 'bob.johnson@email.com', '2020-07-10', 'Active'),
('Alice', 'Williams', 'alice.williams@email.com', '2017-11-05', 'Inactive'),
('Charlie', 'Brown', 'charlie.brown@email.com', '2021-03-25', 'Active'),
('Eva', 'Davis', 'eva.davis@email.com', '2019-09-12', 'Active'),
('Frank', 'Miller', 'frank.miller@email.com', '2020-01-30', 'Inactive'),
('Grace', 'Wilson', 'grace.wilson@email.com', '2018-08-22', 'Active'),
('Henry', 'Taylor', 'henry.taylor@email.com', '2022-04-18', 'Active'),
('Ivy', 'Anderson', 'ivy.anderson@email.com', '2021-06-08', 'Active');

-- Insert dummy data into Loans
INSERT INTO Loans (book_id, member_id, loan_date, due_date, return_date) VALUES
(1, 1, '2023-01-10', '2023-01-24', '2023-01-22'),
(2, 2, '2023-01-15', '2023-01-29', '2023-01-28'),
(3, 3, '2023-02-05', '2023-02-19', '2023-02-18'),
(4, 4, '2023-02-10', '2023-02-24', '2023-02-23'),
(5, 5, '2023-03-01', '2023-03-15', '2023-03-14'),
(6, 6, '2023-03-10', '2023-03-24', NULL),
(7, 7, '2023-04-05', '2023-04-19', '2023-04-17'),
(8, 8, '2023-04-15', '2023-04-29', NULL),
(9, 9, '2023-05-01', '2023-05-15', '2023-05-14'),
(10, 10, '2023-05-10', '2023-05-24', '2023-05-22'),
(11, 1, '2023-06-05', '2023-06-19', '2023-06-18'),
(12, 2, '2023-06-10', '2023-06-24', NULL),
(13, 3, '2023-07-01', '2023-07-15', '2023-07-14'),
(14, 4, '2023-07-10', '2023-07-24', '2023-07-23'),
(15, 5, '2023-08-05', '2023-08-19', NULL),
(1, 6, '2022-01-10', '2022-01-24', '2022-01-22'),
(2, 7, '2022-01-15', '2022-01-29', '2022-01-28'),
(3, 8, '2022-02-05', '2022-02-19', '2022-02-18'),
(4, 9, '2022-02-10', '2022-02-24', '2022-02-23'),
(5, 10, '2022-03-01', '2022-03-15', '2022-03-14'),
(6, 1, '2021-03-10', '2021-03-24', '2021-03-22'),
(7, 2, '2021-04-05', '2021-04-19', '2021-04-17'),
(8, 3, '2021-04-15', '2021-04-29', '2021-04-28'),
(9, 4, '2021-05-01', '2021-05-15', '2021-05-14'),
(10, 5, '2021-05-10', '2021-05-24', '2021-05-22');