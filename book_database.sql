--create authors table
create table authors (
author_id serial primary key,
name varchar (255) not null,
country varchar(100)
);
--create books table
create table books (
book_id serial primary key,
title varchar (255) not null,
author_id int,
genre varchar (100),
publication_year int,
isbn varchar(20) unique,
available_copies int default 1, 

foreign key (author_id) references authors(author_id) on
delete
	set
	null
);
--create customers table

create table customers (
customer_id serial primary key,
name varchar(255) not null,
email varchar (255) unique not null,
phone varchar (20),
membership_date date default current_date 
);
--inserting values into tables

insert
	into
	authors (name,
	country)
values 
('Wole Soyinka',
'Nigeria'),
('Chimamanda Ngozi Adichie',
'Nigeria'),
('J.K Rowling',
'United Kingdom'),
('Danielle Steel',
'United States Of America'),
('Stephen Fry',
' United States Of America'),
('Chinua Achebe',
'Nigeria');

select
	*
from
	authors;

insert
	into
	books (title,
	author_id,
	genre,
	publication_year,
	isbn,
	available_copies)
values
('Death and the Kings Horseman',
1,
'Fiction',
1975,
'9780413333506',
4
),
('Half of a Yello Sun', 2, 'Fiction', 2006, '9781400095209', 6 ),
('Harry Potter and the Philosophers stone', 3, 'Fantasy', 1997, '9780747532699', 12),
('Kaleidoscope', 4, 'Romance', 1987, '9788650516058', 8),
('Mythos', 5, 'Non-Fiction', 2017, '9780718188726', 5),
('Things Fall Apart', 6, 'Fiction', 1958, '9780385474542', 9);


-- Total books in the library
select SUM(available_copies) as available_books from books;

-- Inserting values into the customers table 

INSERT INTO customers (name, email, phone, membership_date) VALUES
('Alice Johnson', 'alice.johnson@example.com', '555-1234', '2023-01-15'),
('Bob Smith', 'bob.smith@example.com', '555-5678', '2022-11-23'),
('Clara Lee', 'clara.lee@example.com', '555-8765', '2021-06-30'),
('David Kim', 'david.kim@example.com', '555-4321', '2022-03-12'),
('Emma Brown', 'emma.brown@example.com', '555-2468', '2020-09-01'),
('Frank Green', 'frank.green@example.com', '555-1357', '2023-04-05'),
('Grace Park', 'grace.park@example.com', '555-8642', '2019-12-19'),
('Henry Adams', 'henry.adams@example.com', '555-9753', '2021-08-08'),
('Ivy Turner', 'ivy.turner@example.com', '555-1029', '2022-02-27'),
('Jack Wilson', 'jack.wilson@example.com', '555-3344', '2023-07-11');

select * from customers;

--Count of Books Per Author
SELECT a.name, COUNT(b.book_id) AS book_count
FROM authors a
JOIN books b ON a.author_id = b.author_id
GROUP BY a.name
ORDER BY book_count DESC;

-- Number of Customers by Year
SELECT EXTRACT(YEAR FROM membership_date) AS year_joined, COUNT(*)
FROM customers
GROUP BY year_joined
ORDER BY year_joined;
















