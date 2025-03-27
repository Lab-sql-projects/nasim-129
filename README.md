# Library Management System Database

## Project Overview
This project implements a relational database system for a library, designed to track books, authors, borrowers, and loan transactions. The database supports essential library operations including book inventory management, patron registration, and loan tracking.

## Files Description

### 1. schema.sql
This file contains the database schema definition with four main tables:
- **Authors**: Stores information about book authors including name, birth year, and nationality
- **Books**: Contains book details such as title, ISBN, publication year, and availability
- **Borrowers**: Tracks library patrons with contact information and account status
- **Loans**: Records all book borrowing transactions with checkout and return dates

The schema implements proper data integrity through:
- Primary and foreign key constraints
- Unique constraints on ISBN and email fields
- Check constraints on status fields
- Default values for timestamps and status fields

Additionally, it sets up a security model with three user roles (library_admin, library_staff, library_user) with appropriate access privileges.

### 2. insert.sql
This file populates the database with sample data:
- 4 authors with biographical information
- 5 books with publication details and availability counts
- 4 library borrowers with contact information
- 5 loan transactions with various statuses (returned, checked-out, overdue)

The sample data demonstrates the relationships between tables and provides a foundation for testing queries.

### 3. queries.sql
This file contains example SQL queries demonstrating various database operations:
- Basic SELECT statements to retrieve book information
- JOIN operations to connect books with their authors
- Filtering data with WHERE clauses (e.g., finding available books)
- Sorting results with ORDER BY (e.g., books by publication year)
- Limiting result sets with LIMIT
- Aggregating data with GROUP BY and COUNT
- Complex queries for business operations such as:
  - Finding active borrowers with current loans
  - Identifying overdue books
  - Counting books by author

## Project Features
- Complete relational database design with normalized tables
- Comprehensive data integrity constraints
- Role-based access control for security
- Support for core library operations (inventory, circulation, patron management)
- Demonstration queries for common library tasks

This project demonstrates fundamental database concepts including schema design, data modeling, integrity constraints, and SQL query writing in a practical library management context.
