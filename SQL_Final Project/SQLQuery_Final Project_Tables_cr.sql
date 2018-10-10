USE Library 

--- Library Tables

CREATE TABLE Library_Branch (
	BranchID int NOT NULL PRIMARY KEY IDENTITY (1,1),
	BranchName varchar(255) NOT NULL,
	Address varchar(255) NOT NULL
);

CREATE TABLE Publisher (
	PublisherName varchar(255) NOT NULL PRIMARY KEY,
	Address varchar(255) NOT NULL,
	Phone varchar(25) NOT NULL
);

CREATE TABLE Books (
	BookID int NOT NULL PRIMARY KEY IDENTITY (100,1),
	Title varchar(255) NOT NULL,
	PublisherName varchar(255) NOT NULL FOREIGN KEY REFERENCES Publisher(PublisherName)
);

CREATE TABLE Book_Authors (
	BookID int NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	AuthorName varchar(255) NOT NULL
);

CREATE TABLE Book_Copies (
	BookID int NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID int NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	Number_Of_Copies int NOT NULL
);

CREATE TABLE Borrower (
	CardNO int NOT NULL PRIMARY KEY IDENTITY (1000,1),
	Name varchar(255) NOT NULL,
	Address varchar(255) NOT NULL,
	Phone varchar(25) NOT NULL
);
CREATE TABLE Book_Loans (
	BookID int NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID int NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	CardNo int NOT NULL FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut date NOT NULL,
	DateDue date NOT NULL
);

--- Library Table Data

INSERT INTO [dbo].[Library_Branch] (BranchName, Address)
	Values
	('Sharpstown', '100 Tack Ave., Madison, WI, 53719'),
	('Central', '200 Average Dr., Madison, WI, 53719'),
	('Northport', '300 Winter Ln., Madison, WI, 53719'),
	('Downtown', '400 Badger Rd., Madison, WI, 53719')
; 
	
INSERT INTO [dbo].[Publisher] (PublisherName, Address, Phone)
	Values
	('Amulet Books', '115 West 18th Street, New York, NY, 10011', '906-932-5511'),
	('Scholastic Inc.', '555 Broadway, New York, NY, 10012', '906-932-5512'),
	('HarperCollins Publishers', '195 Broadway, New York, NY, 10007', '906-932-5513'),
	('Penguin Group Inc.', '375 Hudson Street, New York, NY, 10014', '906-932-5514'),
	('DK Publishing', '345 Hudson Street, New York, NY, 10014', '906-932-5515'),
	('Paramount Publishing', '200 Old Tappan Rd., Old Tappan, NJ, 07675', '906-932-5516'),
	('McGraw-Hill Education', '2 Pennsylvania Plaza, New York, NY, 10001', '906-932-5517'),
	('Little Brown and Company', '100 Victoria Embanment, London, UK, EC4Y 0DY', '44-555-208-5518'),
	('Scribner', '153-157 Fifth Avenue, New York, NY, 10002', '906-932-5519'),
	('Random House', '1745 Broadway, New York, NY, 10019', '906-932-5520')
	('Macmillan Publishers', '75 Varick St., New York, NY, 10013', '906-932-5521')
;


INSERT INTO [dbo].[Books] (Title, PublisherName)
	Values
	('Diary of a Wimpy Kid','Amulet Books'),
	('Diary of a Wimpy Kid: Rodrick Rules','Amulet Books'),
	('Diary of a Wimpy Kid: The Last Strain','Amulet Books'),
	('Diary of a Wimpy Kid: Dog Days','Amulet Books'),
	('Diary of a Wimpy Kid: The Ugly Truth','Amulet Books'),
	('Beezus and Ramona', 'Scholastic Inc.'),
	('Ramona the Pest', 'Scholastic Inc.'),
	('Ramona the Brave', 'Scholastic Inc.'),
	('Ramona and her Father', 'Scholastic Inc.'),
	('Ramona and her Mother', 'Scholastic Inc.'),
	('The Legend of Rock, Paper, Scissors', 'HarperCollins Publishers'),
	('The Bad Seed', 'HarperCollins Publishers'),
	('You Go First', 'HarperCollins Publishers'),
	('This Is Not a Good Idea!', 'HarperCollins Publishers'),
	('Extra Yarn', 'HarperCollins Publishers'),
	('Strega Nona''s Harvest', 'Penguin Group Inc.'),
	('Goodnight Goon', 'Penguin Group Inc.'),
	('Small Spaces', 'Penguin Group Inc.'),
	('Holes in the Sky', 'Penguin Group Inc.'),
	('The Phantom Tower', 'Penguin Group Inc.'),
	('Coding Games in Python', 'DK Publishing'),
	('Star Wars Coding Projects', 'DK Publishing'),
	('My First Coding Book', 'DK Publishing'),
	('Coding Projects in Scratch', 'DK Publishing'),
	('The Last Act', 'Paramount Publishing'),
	('Witch', 'Paramount Publishing'),
	('See You Later', 'Paramount Publishing'),
	('Remember Me', 'Paramount Publishing'),
	('The Hollow Skull', 'Paramount Publishing'),
	('Crucial Conversations', 'McGraw-Hill Education'),
	('Financial Accounting', 'McGraw-Hill Education'),
	('Business Statistics', 'McGraw-Hill Education'),
	('Organizational Behavior', 'McGraw-Hill Education'),
	('Principle of Ecology', 'McGraw-Hill Education'),
	('Max Einstein: The Genius Experiment', 'Little Brown and Company'),
	('Middle School: The Worst Years of My Life', 'Little Brown and Company'),
	('How To Train Your Dragon', 'Little Brown and Company'),
	('Outliers', 'Little Brown and Company'),
	('The Everything Store', 'Little Brown and Company'),
	('Elevation', 'Scribner'),
	('The Man in Black', 'Scribner'),
	('Flight or Fright', 'Scribner'),
	('The Great Gatsby', 'Scribner'),
	('This Side of Paradise', 'Scribner'),
	('The Forbidden Door', 'Random House'),
	('The Crooked Staircase', 'Random House'),
	('The Whispering Room', 'Random House'),
	('The Silent Corner', 'Random House'),
	('Odd Apocalypse', 'Random House'),
	('The Lost Tribe', 'Macmillan Publishers'),
	('Be Prepared', 'Macmillan Publishers'),
	('The 91-Story Treehouse', 'Macmillan Publishers'),
	('The Train to Impossible Places', 'Macmillan Publishers'),
	('A Prickly Problem', 'Macmillan Publishers')
;

INSERT INTO [dbo].[Book_Authors] (BookID, AuthorName)
	Values
	('100', 'Jeff Kinney'),
	('101', 'Jeff Kinney'),
	('102', 'Jeff Kinney'),
	('103', 'Jeff Kinney'),
	('104', 'Jeff Kinney'),
	('105', 'Beverly Cleary'),
	('106', 'Beverly Cleary'),
	('107', 'Beverly Cleary'),
	('108', 'Beverly Cleary'),
	('109', 'Beverly Cleary'),
	('110', 'Drew Daywalt'),
	('111', 'Jory John'),
	('112', 'Erin Entrada Kelly'),
	('113', 'Mo Willems'),
	('114', 'Mac Barnett'),
	('115', 'Tomie dePaola'),
	('116', 'Michael Rex'),
	('117', 'Katherine Arden'),
	('118', 'Louis MacNeice'),
	('119', 'Keir Graff'),
	('120', 'DK Children'),
	('121', 'DK Children'),
	('122', 'DK Children'),
	('123', 'DK Children'),
	('124', 'Christopher Pike'),
	('125', 'Christopher Pike'),
	('126', 'Christopher Pike'),
	('127', 'Christopher Pike'),
	('128', 'Christopher Pike'),
	('129', 'Patterson, Grenny, Mcmillan, Switzler'),
	('130', 'Jill Collis'),
	('131', 'Sonia Taylor'),
	('132', 'Mike Maughan'),
	('133', 'Putnam and Wratten'),
	('134', 'James Patterson'),
	('135', 'James Patterson'),
	('136', 'Cressida Cowell'),
	('137', 'Malcolm Gladwell'),
	('138', 'Brad Stone'),
	('139', 'Stephen King'),
	('140', 'Stephen King'),
	('141', 'Stephen King'),
	('142', 'F. Scott Fitzgerald'),
	('143', 'F. Scott Fitzgerald'),
	('144', 'Dean Koontz'),
	('145', 'Dean Koontz'),
	('146', 'Dean Koontz'),
	('147', 'Dean Koontz'),
	('148', 'Dean Koontz'),
	('149', 'Mark Lee'),
	('150', 'Greenberg and Hayden'),
	('151', 'Andy Giffiths'),
	('152', 'P.G. Bell'),
	('153', 'Jacqueline Kelly')
;


--- BranchID 1 books and copies
INSERT INTO [dbo].[Book_Copies] (BookID, BranchID, Number_Of_Copies)
	Values
	('100', '1', '2'),
	('101', '1', '2'),
	('102', '1', '2'),
	('103', '1', '2'),
	('104', '1', '2'),
	('105', '1', '2'),
	('106', '1', '2'),
	('107', '1', '2'),
	('108', '1', '2'),
	('109', '1', '2'),
	('110', '1', '2'),
	('111', '1', '2'),
	('112', '1', '2'),
	('113', '1', '2'),
	('114', '1', '2'),
	('115', '1', '2'),
	('116', '1', '2'),
	('117', '1', '2'),
	('118', '1', '2'),
	('119', '1', '2'),
	('120', '1', '2'),
	('121', '1', '2'),
	('122', '1', '2'),
	('123', '1', '2'),
	('124', '1', '2'),
	('125', '1', '2'),
	('126', '1', '2'),
	('127', '1', '2'),
	('128', '1', '2'),
	('129', '1', '2'),
	('130', '1', '2'),
	('131', '1', '2'),
	('132', '1', '2'),
	('133', '1', '2'),
	('134', '1', '2'),
	('135', '1', '2'),
	('136', '1', '2'),
	('137', '1', '2'),
	('138', '1', '2'),
	('142', '1', '2'),
	('143', '1', '2'),
	('144', '1', '2'),
	('145', '1', '2'),
	('146', '1', '2'),
	('147', '1', '2'),
	('148', '1', '2'),
	('149', '1', '2'),
	('150', '1', '2'),
	('151', '1', '2'),
	('152', '1', '2'),
	('153', '1', '2')
;

--- BranchID2 books and copies
INSERT INTO [dbo].[Book_Copies] (BookID, BranchID, Number_Of_Copies)
	Values
	('100', '2', '2'),
	('101', '2', '2'),
	('102', '2', '2'),
	('103', '2', '2'),
	('104', '2', '2'),
	('105', '2', '2'),
	('106', '2', '2'),
	('107', '2', '2'),
	('108', '2', '2'),
	('109', '2', '2'),
	('110', '2', '2'),
	('111', '2', '2'),
	('112', '2', '2'),
	('113', '2', '2'),
	('114', '2', '2'),
	('115', '2', '2'),
	('116', '2', '2'),
	('117', '2', '2'),
	('118', '2', '2'),
	('119', '2', '2'),
	('120', '2', '2'),
	('121', '2', '2'),
	('122', '2', '2'),
	('123', '2', '2'),
	('124', '2', '2'),
	('125', '2', '2'),
	('126', '2', '2'),
	('127', '2', '2'),
	('128', '2', '2'),
	('129', '2', '2'),
	('130', '2', '2'),
	('131', '2', '2'),
	('132', '2', '2'),
	('133', '2', '2'),
	('134', '2', '2'),
	('135', '2', '2'),
	('136', '2', '2'),
	('137', '2', '2'),
	('138', '2', '2'),
	('139', '2', '2'),
	('140', '2', '2'),
	('141', '2', '2'),
	('142', '2', '2'),
	('143', '2', '2'),
	('144', '2', '2'),
	('145', '2', '2'),
	('146', '2', '2'),
	('147', '2', '2'),
	('148', '2', '2'),
	('150', '2', '2'),
	('151', '2', '2'),
	('152', '2', '2'),
	('153', '2', '2')
;

--- BranchID3 books and copies
INSERT INTO [dbo].[Book_Copies] (BookID, BranchID, Number_Of_Copies)
	Values
	('100', '3', '2'),
	('101', '3', '2'),
	('102', '3', '2'),
	('103', '3', '2'),
	('104', '3', '2'),
	('105', '3', '2'),
	('106', '3', '2'),
	('107', '3', '2'),
	('108', '3', '2'),
	('109', '3', '2'),
	('110', '3', '2'),
	('111', '3', '2'),
	('112', '3', '2'),
	('113', '3', '2'),
	('114', '3', '2'),
	('115', '3', '2'),
	('116', '3', '2'),
	('117', '3', '2'),
	('118', '3', '2'),
	('119', '3', '2'),
	('120', '3', '2'),
	('121', '3', '2'),
	('122', '3', '2'),
	('123', '3', '2'),
	('124', '3', '2'),
	('125', '3', '2'),
	('126', '3', '2'),
	('127', '3', '2'),
	('128', '3', '2'),
	('129', '3', '2'),
	('130', '3', '2'),
	('131', '3', '2'),
	('132', '3', '2'),
	('133', '3', '2'),
	('134', '3', '2'),
	('135', '3', '2'),
	('136', '3', '2'),
	('137', '3', '2'),
	('138', '3', '2'),
	('142', '3', '2'),
	('143', '3', '2'),
	('144', '3', '2'),
	('145', '3', '2'),
	('146', '3', '2'),
	('147', '3', '2'),
	('148', '3', '2'),
	('150', '3', '2'),
	('151', '3', '2'),
	('152', '3', '2'),
	('153', '3', '2')
;

--- BranchID4 books and copies
INSERT INTO [dbo].[Book_Copies] (BookID, BranchID, Number_Of_Copies)
	Values
	('100', '4', '2'),
	('101', '4', '2'),
	('102', '4', '2'),
	('103', '4', '2'),
	('104', '4', '2'),
	('105', '4', '2'),
	('106', '4', '2'),
	('107', '4', '2'),
	('108', '4', '2'),
	('109', '4', '2'),
	('110', '4', '2'),
	('111', '4', '2'),
	('112', '4', '2'),
	('113', '4', '2'),
	('114', '4', '2'),
	('115', '4', '2'),
	('116', '4', '2'),
	('117', '4', '2'),
	('118', '4', '2'),
	('119', '4', '2'),
	('120', '4', '2'),
	('121', '4', '2'),
	('122', '4', '2'),
	('123', '4', '2'),
	('124', '4', '2'),
	('125', '4', '2'),
	('126', '4', '2'),
	('127', '4', '2'),
	('128', '4', '2'),
	('129', '4', '2'),
	('130', '4', '2'),
	('131', '4', '2'),
	('132', '4', '2'),
	('133', '4', '2'),
	('134', '4', '2'),
	('135', '4', '2'),
	('136', '4', '2'),
	('137', '4', '2'),
	('138', '4', '2'),
	('142', '4', '2'),
	('143', '4', '2'),
	('144', '4', '2'),
	('145', '4', '2'),
	('146', '4', '2'),
	('147', '4', '2'),
	('148', '4', '2'),
	('149', '4', '2'),
	('150', '4', '2'),
	('151', '4', '2'),
	('152', '4', '2'),
	('153', '4', '2')
;


--- INSERT Borrower
INSERT INTO [dbo].[Borrower] (Name, Address, Phone)
	Values
	('Homer Simpson', '742 Evergreen Terrace, Springfield, OR, 97403', '906-932-4000'),
	('Marge Simpson', '742 Evergreen Terrace, Springfield, OR, 97403', '906-932-4000'),
	('Bart Simpson', '742 Evergreen Terrace, Springfield, OR, 97403', '906-932-4000'),
	('Lisa Simpson', '742 Evergreen Terrace, Springfield, OR, 97403', '906-932-4000'),
	('Jacqueline Bouvier', '655 Motherly Way, Springfield, OR, 97403', '906-932-4001'),
	('Patty Bouvier', '501 Marlboro Dr., Springfield, OR, 97403', '906-932-4002'),
	('Selma Bouvier', '501 Marlboro Dr., Springfield, OR, 97403', '906-932-4002'),
	('Ned Flanders', '744 Evergreen Terrace., Springfield, OR, 97403', '906-932-4003'),
	('Kent Brockman', '311 Newcaster Ln., Springfield, OR, 97403', '906-932-4004'),
	('Carl Carlson', '123 Friendship Dr., Springfield, OR, 97403', '906-932-4005'),
	('Lenny Leonard', '125 Friendship Dr., Springfield, OR, 97403', '906-932-4006'),
	('Reverand Timothy Lovejoy', '223 Blessed Ave., Springfield, OR, 97403', '906-932-4007'),
	('Montgomery Burns', '1 Releasethehounds Rd., Springfield, OR, 97403', '906-932-4008'),
	('Apu Nahasapeemapetilon', '460 Quikemart Rd., Springfield, OR, 97403', '906-932-4009'),
	('Seymore Skinner', '244 Principle Ct., Springfield, OR, 97403', '906-932-4010'),
	('Waylon Smithers', '687 Assistant Dr., Springfield, OR, 97403', '906-932-4011'),
	('Roy Snyder', '12 People'' Ct., Springfield, OR, 97403', '906-932-4012'),
	('Cletus Spuckler', '103 Yokel Rd., Springfield, OR, 97403', '906-932-4013'),
	('Milhouse Van Houten', '23 Eyebrow Ln., Springfield, OR, 97403', '906-932-4014')
;

--- INSERT Book_Loans *** Updates have been made to account for DateDue proc

INSERT INTO [dbo].[Book_Loans] (BookID, BranchID, CardNo, DateOut, DateDue)
	Values
	('110', '1', '1000', '10-05-2018', '10-10-2018'),
	('109', '1', '1001', '09-27-2018', '11-30-2018'),
	('111', '1', '1002', '10-01-2018', '10-10-2018'),
	('120', '1', '1003', '09-01-2018', '02-28-2019'),
	('121', '1', '1003', '09-01-2018', '02-28-2019'),
	('122', '1', '1003', '09-01-2018', '02-28-2019'),
	('123', '1', '1003', '08-24-2018', '01-31-2019'),
	('129', '1', '1003', '08-24-2018', '01-31-2019'),
	('130', '1', '1003', '10-01-2018', '03-31-2019'),
	('131', '1', '1003', '10-01-2018', '03-31-2019'),
	('132', '1', '1003', '10-01-2018', '03-31-2019'),
	('133', '1', '1003', '10-06-2018', '03-31-2019'),
	('109', '2', '1004', '08-30-2018', '10-31-2018'),
	('105', '2', '1004', '08-30-2018', '10-31-2018'),
	('106', '2', '1005', '08-30-2018', '10-31-2018'),
	('153', '1', '1006', '10-01-2018', '10-11-2018'),
	('101', '1', '1007', '10-01-2018', '11-30-2018'),
	('102', '1', '1007', '10-01-2018', '11-30-2018'),
	('136', '3', '1008', '07-01-2018', '10-10-2018'),
	('134', '3', '1009', '07-07-2018', '10-31-2018'),
	('136', '4', '1010', '06-05-2018', '12-31-2018'),
	('111', '4', '1011', '06-03-2018', '12-31-2018'),
	('113', '4', '1011', '06-03-2018', '12-31-2018'),
	('119', '4', '1011', '07-11-2018', '01-31-2019'),
	('140', '4', '1011', '07-11-2018', '01-31-2019'),
	('143', '4', '1011', '07-11-2018', '01-31-2019'),
	('148', '4', '1011', '07-11-2018', '01-31-2019'),
	('100', '3', '1012', '09-16-2018', '10-10-2018'),
	('101', '3', '1012', '09-16-2018', '10-10-2018'),
	('102', '3', '1012', '09-16-2018', '10-10-2018'),
	('103', '3', '1012', '09-16-2018', '10-10-2018'),
	('104', '3', '1012', '09-16-2018', '10-10-2018'),
	('126', '2', '1013', '10-03-2018', '11-03-2018'),
	('137', '1', '1014', '08-28-2018', '10-31-2018'),
	('115', '4', '1015', '09-02-2018', '10-11-2018'),
	('127', '4', '1015', '09-02-2018', '10-11-2018'),
	('108', '4', '1015', '09-02-2018', '10-11-2018'),
	('114', '3', '1016', '10-02-2018', '12-31-2018'),
	('117', '3', '1016', '10-02-2018', '12-31-2018'),
	('128', '3', '1016', '10-02-2018', '12-31-2018'),
	('110', '2', '1017', '08-24-2018', '10-31-2018'),
	('116', '2', '1017', '08-24-2018', '10-31-2018'),
	('134', '2', '1017', '08-24-2018', '10-31-2018'),
	('144', '1', '1018', '09-03-2018', '12-31-2018'),
	('145', '1', '1018', '09-03-2018', '12-31-2018'),
	('146', '1', '1018', '09-03-2018', '12-31-2018'),
	('147', '1', '1018', '09-03-2018', '12-31-2018'),
	('149', '1', '1018', '09-05-2018', '12-31-2018'), 
	('151', '1', '1018', '10-06-2018', '12-31-2018'),
	('112', '3', '1016', '10-05-2018', '11-30-2018'),
	('151', '4', '1008', '09-26-2018', '10-10-2018')
;
