USE Library

--- Procedure 1: Copies of "The Lost Tribe" in Sharpstown branch

GO
CREATE PROCEDURE GetSharpstownCopies 
	AS
	BEGIN
		SELECT Library_Branch.BranchName, Books.Title, Book_Copies.Number_Of_Copies
			FROM Book_Copies
			INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID
			INNER JOIN Books ON Book_Copies.BookID = Books.BookID
			WHERE Library_Branch.BranchName = 'Sharpstown' AND Books.Title = 'The Lost Tribe'
	END 
GO

EXECUTE GetSharpstownCopies



--- Procedure 2: Copies of "The Lost Tribe" at each branch

GO
CREATE PROCEDURE GetBranchCopies 
	AS
	BEGIN
		SELECT Library_Branch.BranchName, Books.Title, Book_Copies.Number_Of_Copies
			FROM Book_Copies
			INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID
			INNER JOIN Books ON Book_Copies.BookID = Books.BookID
			WHERE Books.Title = 'The Lost Tribe';
	END
GO

EXECUTE GetBranchCopies


--- Procedure 3: Borrowers with no books checked out

GO
CREATE PROCEDURE GetBorrowersNull  
	AS
	BEGIN
		SELECT Borrower.Name
		FROM Borrower
		WHERE NOT EXISTS (SELECT * FROM Book_Loans WHERE Borrower.CardNO = Book_Loans.CardNO)
	END
GO

EXECUTE GetBorrowersNull


--- Procedure 4: Sharpstown Due Date

GO
CREATE PROCEDURE GetSharpstownDateDue  
	AS
	BEGIN
		SELECT Books.Title, Borrower.Name, Borrower.Address 
			FROM Book_Loans
			INNER JOIN Library_Branch ON Book_Loans.BranchID = Library_Branch.BranchID
			INNER JOIN Books ON Book_Loans.BookID = Books.BookID
			INNER JOIN Borrower ON Book_Loans.CardNO = Borrower.CardNO
		WHERE Library_Branch.BranchName = 'Sharpstown' AND Book_Loans.DateDue = CAST(GETDATE() AS date)
	END
GO

EXECUTE GetSharpstownDateDue  


--- Procedure 5: Retrieve branch name and total number of books on loan

GO
CREATE PROCEDURE GetBranchLoans  
	AS
	BEGIN
		SELECT Library_Branch.BranchName, COUNT(*) AS 'Total Number of Books'
			FROM Book_Copies
			INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID
			WHERE Book_Copies.BranchID = Library_Branch.BranchID GROUP BY Library_Branch.BranchName
	END
GO

EXECUTE GetBranchLoans 
--- Procedure 6: Retrieve borrower info and total books loaned from branch 

GO
CREATE PROCEDURE GetBorrowerLoans  
	AS
	BEGIN
		SELECT Borrower.CardNO, Borrower.Name, Borrower.Address, COUNT (*) AS 'Total Number of Books'
			FROM Borrower
			INNER JOIN Book_Loans ON Borrower.CardNO = Book_Loans.CardNO 
			WHERE Borrower.CardNO = Book_Loans.CardNO GROUP BY Borrower.CardNO, Borrower.Name, Borrower.Address HAVING COUNT(*) > 5
	END
GO

EXECUTE GetBorrowerLoans


--- Procedure 7: Retrieve Stephen King Book Info from Central branch

GO
CREATE PROCEDURE GetCentralStephenKing  
	AS
	BEGIN
		SELECT Books.Title, Book_Copies.Number_Of_Copies
			FROM Books
			INNER JOIN Book_Copies ON Books.BookID = Book_Copies.BookID 
			INNER JOIN Book_Authors ON Book_Copies.BookID = Book_Authors.BookID
			INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID
			WHERE Book_Authors.AuthorName = 'Stephen King' AND Library_Branch.BranchName = 'Central'
	END
GO

EXECUTE GetCentralStephenKing
