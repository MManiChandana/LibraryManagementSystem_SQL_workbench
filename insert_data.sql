-- Insertion of values into the customers table
INSERT INTO Customers VALUES (1,'Alice','Hyderabad','alice@mail.com');
INSERT INTO Customers VALUES (2,'Bob','Bangalore','bob@mail.com');
INSERT INTO Customers VALUES (3,'Charlie','Chennai','charlie@mail.com');
INSERT INTO Customers VALUES (4,'Daina','Mumbai','diana@mail.com');
select * from Customers;
-- Insertion of values into the Authors table
INSERT INTO Authors VALUES (101,'J.K. Rowling', 'UK');
INSERT INTO Authors VALUES (102,'George Orwell', 'UK');
INSERT INTO Authors VALUES (103,'Chetan Bhagat', 'India');
select * from Authors;
-- Insertion of values into the Books table
INSERT INTO Books VALUE(1001, 'Harry Potter', 101, 500, 20);
INSERT INTO Books VALUE(1002, '1987', 103, 300, 15);
INSERT INTO Books VALUE(1003, 'Five Point Someone', 103, 200, 20);
INSERT INTO Books VALUE(1004, 'Half Girlfriend', 103, 250, 30);
select * from Books;
-- Insertion of the values into Orders table
INSERT INTO Orders VALUES (1,1,1001,2,1000,'2024-03-01');
INSERT INTO Orders VALUES (2,2,1002,1,300,'2024-03-02');
INSERT INTO Orders VALUES (3,1,1003,3,600,'2024-03-03');
INSERT INTO Orders VALUES (4,3,1001,1,500,'2024-03-04');
INSERT INTO Orders VALUES (5,4,1004,2,500,'2024-03-05');
INSERT INTO Orders VALUES (6,2,1003,2,400,'2024-03-06');
INSERT INTO Orders VALUES (7,1,1004,1,250,'2024-03-07');
INSERT INTO Orders VALUES (8,3,1002,2,600,'2024-03-08');
select * from Orders;
