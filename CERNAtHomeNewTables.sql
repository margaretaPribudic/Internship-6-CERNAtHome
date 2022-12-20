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
	
