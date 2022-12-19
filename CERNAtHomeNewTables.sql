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

CREATE TABLE Cities(
	CityId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL
)

CREATE TABLE States(
	StateId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	Population INT,
	PPPPerCapita FLOAT
)

CREATE TABLE StatesCities(
	StateCityId SERIAL PRIMARY KEY,
	StateId INT REFERENCES States(StateId),
	CityId INT REFERENCES Cities(CityId)
)

CREATE TABLE Hotels(
	HotelId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	StateCityId INT REFERENCES StatesCities(StateCityId)
)

CREATE TABLE Scientists(
	ScientistId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
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