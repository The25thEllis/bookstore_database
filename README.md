# bookstore_database
Bookstore database project to practice SQL and relational database design.

This is a simple bookstore database built using PostgreSQL. It contains tables for managing books, customers, and authors.

## 📁 Tables Included
- **books**: Stores information about each book (title, publication year, etc.)
- **customers**: Stores customer details (name, email, phone, membership date)
- **authors**: Stores author details (name, country,etc.)

## 🔧 Tools Used
- PostgreSQL
- DBeaver

## 📌 Features
- Proper use of primary and foreign keys
- Sample data inserted for demonstration
- Basic SQL queries to explore data

## 📊 Example Business Logic Queries

### 1. Number of Customers by Year
```sql
SELECT EXTRACT(YEAR FROM membership_date) AS year_joined, COUNT(*)
FROM customers
GROUP BY year_joined
ORDER BY year_joined;
```

### 2. Average Publication Year
```sql
SELECT AVG(publication_year) FROM books;
```

### 3. Count of Books Per Author
```sql
SELECT a.name, COUNT(b.book_id) AS book_count
FROM authors a
JOIN books b ON a.author_id = b.author_id
GROUP BY a.name
ORDER BY book_count DESC;
```

## 📌 Project Purpose
This project is part of my data engineering learning journey and serves as a simple, clean portfolio piece to demonstrate SQL and database design basics.

