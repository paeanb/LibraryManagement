use master 
go
--Create database
IF EXISTS (SELECT * FROM sys.databases WHERE [name] = 'dbLibraryMS')
drop database dbLibraryMS
go 
CREATE DATABASE dbLibraryMS
GO

USE dbLibraryMS
GO

--create the book table
CREATE TABLE Book
(
BookId int PRIMARY KEY NOT NULL,
Title varchar (50) NOT NULL,
PublisherName varchar (50) NOT NULL
)
GO

--create the book authors table
CREATE TABLE Book_Authors
(
BookId int PRIMARY KEY NOT NULL,
AuthorName varchar (50) NOT NULL
)
GO

--create the publisher table
CREATE TABLE Publisher
(
Name varchar (50) PRIMARY KEY NOT NULL,
[Address] varchar (100),
Phone varchar (25) NOT NULL
)
GO

--create the book copies table
CREATE TABLE Book_Copies
(
BookId int NOT NULL,
BranchId int NOT NULL,
No_Of_Copies int NOT NULL
)
GO

--create the book loans table
CREATE TABLE Book_Loans
(
BookId int NOT NULL,
BranchId int NOT NULL,
CardNo int NOT NULL,
DateOut date NOT NULL, --date data type needs to be entered as YYYY-MM-DD.
DueDate date NOT NULL
)
GO

--create the library branch table
CREATE TABLE Library_Branch
(
BranchId int PRIMARY KEY NOT NULL,
BranchName varchar (50) NOT NULL,
[Address] varchar (100)
)
GO

--create the borrower table
CREATE TABLE Borrower
(
CardNo int PRIMARY KEY NOT NULL,
Name varchar (50) NOT NULL,
[Address] varchar (100),
Phone varchar (25) NOT NULL
)
GO


INSERT INTO Book
VALUES (1, 'The Lost Tribe', 'Island Publishers'),
(2, 'My Cat Ate My Homework', 'House of Kitty Literature'),
(3, 'Does a Cat Have Knees?', 'House of Kitty Literature'),
(4, 'Dogs Smell', 'Dogtopia Publishers'),
(5, 'Carrie', 'Doubleday'),
(6, 'Bad Dog', 'Dogtopia Publishers'),
(7, 'Growing Succulents', 'The Plant Studio'),
(8, 'Edible Flowers', 'The Plant Studio'),
(9, 'Propegating Succulents', 'The Plant Studio'),
(10, 'Getting Over It', 'DumbHouse'),
(11, 'Let Them Eat Cake', 'DumbHouse'),
(12, 'Books Rule, Boys Drool', 'Smart Girls'),
(13, 'Its Okay to Listen to Adele', 'Smart Girls'),
(14, 'My Cat is my Best Friend', 'House of Kitty Literature'),
(15, 'How to get Creative with your Book Titles', 'Brain is Mush'),
(16, 'Stop Whining', 'DumbHouse'),
(17, 'How I Became the Best Hula Hoopers in the World', 'Island Publishers'),
(18, 'Gray Socks and Cold Feet', 'Cold Pressed Words'),
(19, 'You are Almost There', 'Just Another Publisher'),
(20, 'Everything is Okay', 'Just Another Publisher')
GO

INSERT INTO Publisher
VALUES ('House of Kitty Listerature', '3334 Waikiki Way, Honolulu, HI 96708', '503-123-5555'),
('Dogtopia Publishers', '303 Hairball Lane, Portland, OR 97211', '503-234-5555'),
('Doubleday', '1745 Broadway, New York, NY 10102', '212-354-555'),
('The Plant Studio', '567 Green Thumb Road, Portland OR 97232', '503-555-5555'),
('DumbHouse', '9912 Silly Street, Sillyland, CA 92403', '818-334-3444'),
('SmartGirls', '6969 Awesome Avenue, Sunnyville, CA 94131', '444-444-3333'),
('Brain is Mush', '555 Bland Way, Graytown, CO 86436', '877-555-555'),
('Cold Pressed Words', '87 Sentence Street, Booksville, TX 58333', '465-343-3433'),
('Just Another Publisher', '1 Of a Million Avenue, Nothing Special, MO 48588', '777-554-5555')

GO

INSERT INTO Book_Authors
VALUES (1, 'Jim Coconut'),
(2, 'Mr. Meow'),
(3, 'Mr. Meow'),
(4, 'Dr. Dog'),
(5, 'Stephen King'),
(6, 'Max Barksalot'),
(7, 'Lisa Waters'),
(8, 'Nick Waters'),
(9, 'Lisa Waters'),
(10, 'Elliot Perkins'),
(11, 'Mary McBride'),
(12, 'Jess Cook'),
(13, 'Jessie McCall'),
(14, 'Nick Smith'),
(15, 'Ima Smartas'),
(16, 'Bob Gross'),
(17, 'Leilani Hanu'),
(18, 'Christian Grey'),
(19, 'Alexandra Aragon'),
(20, 'Alexandra Aragon')
GO

INSERT INTO Library_Branch
VALUES (101, 'North Portland Library', '123 N. Killingsworth Street'),
(102, 'East Portland Library', '403 E. Burnside Street'),
(103, 'South Portland Library', '1202 S. Powell Street'),
(104, 'West Portland Library', '83387 W. 23rd Avenure'),
(105, 'Sharpstown Library', '8938 Edge Road'),
(106, 'Central Library', '33 Main Street')

GO


INSERT INTO Book_Copies
VALUES (1, 101, 3),
(1, 102, 5),
(1, 103, 2),
(1, 105, 2),
(1, 106, 2),
(2, 101, 3),
(2, 103, 2),
(2, 105, 4),
(2, 106, 2),
(3, 102, 2),
(3, 103, 5),
(3, 104, 2),
(3, 105, 4),
(3, 106, 3),
(4, 101, 2),
(4, 102, 5),
(4, 104, 2),
(5, 101, 6),
(5, 102, 2),
(5, 106, 4),
(6, 101, 2),
(6, 102, 2),
(6, 103, 2),
(6, 104, 2),
(6, 105, 2),
(6, 106, 2),
(7, 101, 3),
(7, 101, 3),
(7, 102, 2),
(7, 103, 2),
(7, 104, 3),
(7, 105, 2),
(7, 106, 2),
(8, 102, 3),
(8, 104, 2),
(8, 106, 2),
(9, 101, 3),
(9, 103, 5),
(9, 105, 7),
(10, 101, 2),
(11, 104, 2),
(11, 106, 2),
(12, 102, 2),
(12, 103, 2),
(12, 104, 2),
(12, 105, 2),
(13, 101, 3),
(13, 102, 3),
(13, 103, 2),
(14, 104, 3),
(14, 105, 2),
(14, 106, 2),
(15, 101, 2),
(15, 102, 2),
(15, 103, 2),
(16, 101, 6),
(16, 102, 4),
(16, 103, 7),
(16, 104, 8),
(16, 105, 2),
(16, 106, 3),
(17, 102, 4),
(17, 103, 5),
(17, 104, 2),
(17, 105, 6),
(17, 106, 2),
(18, 104, 4),
(18, 105, 3),
(18, 106, 2),
(19, 101, 6),
(19, 103, 2),
(19, 106, 4),
(20, 101, 3),
(20, 104, 2),
(20, 105, 4)
GO

INSERT INTO Borrower
VALUES (2201, 'Rachel Woods', '11 1st Street', '503-321-5555'),
(2202, 'Lisa Nash', '12st Street', '503-432-5555'),
(2203, 'Ben Nelson', '343 2nd Street', '503-667-5555'),
(2204, 'Erin Shotwell', '222 2nd Street', '503-987-5555'),
(2205, 'Kent Brown', '383 2nd Street', '503-888-5555'),
(2206, 'Paul Cordero', '123 3rd Street', '503-777-5555'),
(2207, 'Maddy Aragon', '342 4th Street', '503-444-5555'),
(2208, 'Ana Bolling', '655 4th Street', '503-333-5555'),
(2209, 'Rhea Phillips', '655 4th Street', '503-222-5555'),
(2010, 'Sarah Phillips', '655 4th Street', '503-999-5555'),
(2211, 'Caitlin Woody', '484 Alberta Street', '503-333-2111'),
(2212, 'Nancy Lake', '324 Roselawn Street', '503-112-1222'),
(2213, 'Drew Lake', '324 Roselawn Street', '503-888-2344'),
(2214, 'Bella Sanchez', '823 Grand Avenue', '503-234-3333'),
(2215, 'Erica Bawl', '9299 Grand Avenue', '503-343-4334'),
(2216, 'Hans Schwartz', '93574 East Burnside', '503-343-3434'),
(2217, 'Kai Smart', '3838 Lake Drive', '503-244-3333')
GO

INSERT INTO Book_Loans
VALUES (1, 101, 2201, '2016-02-01', '2016-03-01'),
(2, 101, 2201, '2016-02-01', '2016-03-01'),
(4, 101, 2202, '2016-02-01', '2016-03-01'),
(5, 101, 2202, '2016-02-01', '2016-03-01'),
(6, 101, 2202, '2016-02-01', '2016-03-01'),
(7, 101, 2202, '2016-02-01', '2016-03-01'),
(9, 101, 2202, '2016-02-01', '2016-03-01'),
(10, 101, 2202, '2016-02-01', '2016-03-01'),
(13, 101, 2203, '2016-02-01', '2016-03-01'),
(15, 101, 2203, '2016-02-02', '2016-03-02'),
(16, 101, 2204, '2016-02-02', '2016-03-02'),
(19, 101, 2206, '2016-02-02', '2016-03-02'),
(20, 101, 2207, '2016-02-02', '2016-03-02'),
(1, 102, 2208, '2016-02-02', '2016-03-02'),
(3, 102, 2209, '2016-02-02', '2016-03-02'),
(4, 102, 2209, '2016-02-02', '2016-03-02'),
(5, 102, 2209, '2016-02-02', '2016-03-02'),
(6, 102, 2209, '2016-02-02', '2016-03-02'),
(7, 102, 2209, '2016-02-03', '2016-03-03'),
(8, 102, 2209, '2016-02-03', '2016-03-03'),
(12, 102, 2211, '2016-02-07', '2016-03-07'),
(13, 102, 2212, '2016-02-07', '2016-03-07'),
(15, 102, 2212, '2016-02-07', '2016-03-07'),
(16, 102, 2212, '2016-02-07', '2016-03-07'),
(1, 103, 2213, '2016-02-07', '2016-03-07'),
(3, 103, 2213, '2016-02-07', '2016-03-07'),
(6, 103, 2214, '2016-02-07', '2016-03-07'),
(7, 103, 2215, '2016-02-07', '2016-03-07'),
(9, 103, 2215, '2016-02-08', '2016-03-08'),
(12, 103, 2215, '2016-02-08', '2016-03-08'),
(13, 103, 2215, '2016-02-08', '2016-03-08'),
(15, 103, 2215, '2016-02-08', '2016-03-08'),
(16, 103, 2215, '2016-02-08', '2016-03-08'),
(17, 103, 2216, '2016-02-08', '2016-03-08'),
(11, 104, 2217, '2016-02-09', '2016-03-09'),
(14, 104, 2217, '2016-02-09', '2016-03-09'),
(12, 104, 2217, '2016-02-09', '2016-03-09'),
(8, 104, 2217, '2016-02-09', '2016-03-09'),
(2, 105, 2210, '2016-02-09', '2016-03-09'),
(3, 105, 2210, '2016-02-10', '2016-03-10'),
(7, 105, 2210, '2016-02-10', '2016-03-10'),
(9, 105, 2210, '2016-02-10', '2016-03-10'),
(8, 105, 2205, '2016-02-11', '2016-03-11'),
(1, 105, 2205, '2016-02-11', '2016-03-11'),
(9, 105, 2205, '2016-02-11', '2016-03-11'),
(18, 105, 2205, '2016-02-11', '2016-03-11'),
(20, 105, 2205, '2016-02-11', '2016-03-11'),
(3, 106, 2203, '2016-02-11', '2016-03-11'),
(3, 106, 2204, '2016-02-11', '2016-03-11'),
(11, 106,2204, '2016-02-11', '2016-03-11'),
(14, 106, 2204, '2016-02-11', '2016-03-11'),
(2, 101, 2201, '2016-02-11', '2016-03-11')
GO


--1) How many copies of the book titled The Lost Tribe are owned by the library branch
--whose name is "Sharpstown"?

select b.Title, lb.BranchName, bc.No_Of_Copies 
from Book as b 
inner join Book_Copies as bc
on b.BookId = bc.BookId 
inner join library_branch as lb
on bc.BranchID = lb.branchid
where b.Title = 'The Lost Tribe'
and lb.BranchName = 'Sharpstown Library'
GO

--2) How many copies of the book titled 'The Lost Tribe' are owned by each library branch?
select b.Title, lb.BranchName, bc.No_Of_Copies 
from Book as b 
inner join Book_Copies as bc
on b.BookId = bc.BookId 
inner join library_branch as lb
on bc.BranchID = lb.branchid
where b.Title = 'The Lost Tribe'
go

--3) Retrieve the names of all borrowers who do not have any books checked out.
select bo.Name, bl.BookId, bo.CardNO 
from Borrower as bo
left outer join Book_Loans as bl
on bo.CardNo = bl.CardNO 
go

--4) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
--Retrieve the book title, the borrower's name, and the borrower's address.

select bo.Name, bo.Address, bl.duedate, b.Title, lb.BranchName
from Borrower as bo
inner join Book_Loans as bl
on bo.CardNo = bl.CardNO 
inner join Book as b
on b.BookId = bl.BookId 
inner join Library_Branch as lb
on bl.BranchId = lb.BranchID  
where bl.duedate = '2016-03-11'
and lb.BranchName = 'Sharpstown Library'
GO

--5) For each library branch, retrieve the branch name and the total number of books loaned out
--from that branch.
select BranchName, COUNT(*) as 'Books out per Branch'
from Library_Branch as lb
inner join Book_Loans as bl
on lb.BranchID = bl.BranchId 
group by BranchName
GO

--6) Retrieve the names, addresses, and number of books checked out for all borrowers who have more
--than five books checked out.
select bo.Name, bo.[address], COUNT(*) as 'BookAmount'
from Borrower as bo
inner join Book_Loans as bl 
on bo.CardNo = bl.CardNO 
group by bo.Name, bo.[address]
having COUNT('Bookamount') > 5
GO

--7) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number
--of copies owned by the library branch whose name is "Central".

select ba.authorname, b.title, bc.no_of_copies, lb.branchname
from Book as b
inner join Book_Authors as ba
on b.BookId = ba.BookId
inner join  Book_Copies as bc
on bc.BookId = ba.BookId 
inner join Library_Branch as lb
on bc.BranchID = lb.BranchID 
where ba.AuthorName = 'Stephen King'
and lb.BranchName = 'Central Library'

