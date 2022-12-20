CREATE TABLE Accelerators(
	AcceleratorId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL
)

CREATE TABLE Projects(
	ProjectId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL
)

CREATE TABLE AcceleratorsProjects(
	AcceleratorId INT REFERENCES Accelerators(AcceleratorId),
	ProjectId INT REFERENCES Projects(ProjectId),
	PRIMARY KEY(AcceleratorId,ProjectId)
)

CREATE TABLE ScientificWorks(
	ScientificWork SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	DateOfPublication TIMESTAMP,
	NumberOfQuotes INT,
	ProjectId INT REFERENCES Projects(ProjectId)
)

CREATE TABLE Professions(
	ProfessionId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL
)

CREATE TABLE States(
	StateId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	Population INT,
	PPPPerCapita FLOAT
)

CREATE TABLE Cities(
	CityId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	StateId INT REFERENCES States(StateId)
)

CREATE TABLE Hotels(
	HotelId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	CityId INT REFERENCES Cities(CityId)
)

CREATE TABLE Scientists(
	ScientistId SERIAL PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	BirthDate TIMESTAMP,
	Sex VARCHAR(30),
	StateId INT REFERENCES States(StateId),
	ProfessionId INT REFERENCES Professions(ProfessionId),
	HotelId INT REFERENCES Hotels(HotelId)
)

CREATE TABLE ScientistsScientificWork(
	ScientistId INT REFERENCES Scientists(ScientistId),
	ScientificWorkId INT REFERENCES ScientificWorks(ScientificWork),
	PRIMARY KEY(ScientistId,ScientificWorkId)
)

ALTER TABLE Scientists
	ADD CONSTRAINT SexOptions CHECK(Sex IN ('MUŠKO','ŽENSKO','NEPOZNATO','OSTALO'))
	
ALTER TABLE Professions
	ADD CONSTRAINT ProfessionOptions CHECK(Name IN('programer','fizičar','inženjer','znanstvenik materijala'))

ALTER TABLE Professions
	ADD CONSTRAINT UniqueName UNIQUE(Name)
	
ALTER TABLE States
	ADD CONSTRAINT UniqueState UNIQUE(Name)
	
ALTER TABLE Cities
	ADD CONSTRAINT UniqueCity UNIQUE(Name)



--seed

INSERT INTO Accelerators(Name) VALUES
	('Akcelerator1'),
	('Akcelerator2'),
	('Akcelerator3'),
	('Akcelerator4'),
	('Akcelerator5')


INSERT INTO Projects(Name) VALUES
	('Projekt1'),
	('Projekt2'),
	('Projekt3'),
	('Projekt4'),
	('Projekt5'),
	('Projekt6'),
	('Projekt7'),
	('Projekt8'),
	('Projekt9')

INSERT INTO AcceleratorsProjects(AcceleratorId, ProjectId) VALUES
	(1,1),
	(1,2),
	(2,3),
	(2,4),
	(3,5),
	(3,6),
	(4,7),
	(4,8)


INSERT INTO ScientificWorks(Name,DateOfPublication,NumberOfQuotes,ProjectId) VALUES
	('Znanstveni rad 1','2010-01-01',3,1),
	('Znanstveni rad 2','2010-10-01',2,1),
	('Znanstveni rad 3','2016-01-01',5,2),
	('Znanstveni rad 4','2012-05-01',3,1),
	('Znanstveni rad 5','2017-02-01',3,1),
	('Znanstveni rad 6','2015-07-01',2,3),
	('Znanstveni rad 7','2018-10-01',7,4),
	('Znanstveni rad 8','2019-10-01',5,5),
	('Znanstveni rad 9','2013-11-01',3,2),
	('Znanstveni rad 10','2015-09-01',2,3),
	('Znanstveni rad 11','2020-06-01',1,4),
	('Znanstveni rad 12','2020-01-01',6,5),
	('Znanstveni rad 13','2021-07-01',4,1),
	('Znanstveni rad 14','2022-03-01',2,2)

INSERT INTO Professions(Name) VALUES
	('programer'),
	('fizičar'),
	('inženjer'),
	('znanstvenik materijala')

INSERT INTO States(Name,Population,PPPPerCapita) VALUES
	('Švicarska',8698000,70792.7),
	('Hrvatska',3899000,31046.6),
	('Njemačka',83130000,52930.8),
	('Francuska',67500000,45187.4),
	('Italija',59070000,41937.2)


INSERT INTO Cities(Name,StateId) VALUES
	('Ženeva',1),
	('Nyon',1),
	('Montreux',1)

INSERT INTO Hotels(Name,CityId) VALUES
	('Hotel1',1),
	('Hotel2',1),
	('Hotel3',1),
	('Hotel4',2),
	('Hotel5',3)


INSERT INTO Scientists(FirstName,LastName,BirthDate,Sex,StateId,ProfessionId,HotelId) VALUES
	('Mate','Matic','1983-01-02','MUŠKO',2,1,1),
	('Antea','Antic','1984-02-20','ŽENSKO',2,2,2),
	('Hrvoje','Horvat','1990-01-02','NEPOZNATO',3,3,3),
	('Alex','Abadie','1979-01-02','OSTALO',4,4,1),
	('Alex','Moretti','1984-01-02','MUŠKO',5,1,2),
	('Luca','Lang','1975-01-02','MUŠKO',1,2,3),
	('Lia','Leu','1988-03-15','ŽENSKO',1,3,1)


INSERT INTO ScientistsScientificWork(ScientistId,ScientificWorkId) VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(7,8),
	(6,9),
	(5,10),
	(4,11),
	(3,12),
	(2,13),
	(1,14),
	(1,7),
	(2,8),
	(3,9),
	(4,9)
