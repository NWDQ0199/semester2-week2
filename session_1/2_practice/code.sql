-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 library.db
-- 2. Load this script: .read code.sql
-- 3. Exit SQLite: .exit


-- write your sql code here

--(1)
--List all loans
--Show book title, member name, and loan date.
SELECT Books.title, Members.name, Loans.loan_date FROM Loans JOIN Books ON Loans.book_id=Books.id JOIN Members ON Loans.member_id=Members.id;

--(2)
--Books and loans
--List all books and any loans associated with them.
SELECT Books.title, Loans.id FROM Books LEFT JOIN Loans ON Loans.book_id=Books.id;

--(3)
--Branches and books
--List all library branches and the books they hold.
SELECT LibraryBranch.name, Books.title FROM LibraryBranch LEFT JOIN Books ON LibraryBranch.id=Books.branch_id;

--(4)
--Branch book counts
--Show each library branch and the number of books it holds.
SELECT LibraryBranch.name, COUNT(Books.title) FROM LibraryBranch LEFT JOIN Books ON LibraryBranch.id=Books.branch_id GROUP BY LibraryBranch.name;

--(5)
--Branches with more than 7 books
--Show branches that hold more than 7 books.
SELECT LibraryBranch.name FROM LibraryBranch LEFT JOIN Books ON LibraryBranch.id=Books.branch_id GROUP BY LibraryBranch.name HAVING COUNT(Books.title)>7;