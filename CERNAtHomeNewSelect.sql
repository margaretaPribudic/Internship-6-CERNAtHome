--1
SELECT sw.Name AS Naziv, sw.DateOfPublication AS DatumObjave,
(SELECT STRING_AGG(s.LastName||', '||LEFT(s.FirstName,1)||'.', '; ') FROM Scientists s WHERE
	(SELECT Count(*) FROM ScientistsScientificWork ssw WHERE ssw.ScientistId = s.ScientistId AND ssw.ScientificWorkId = sw.ScientificWork) > 0)
AS Scientists
FROM ScientificWorks sw

--2
SELECT s.FirstName, s.LastName, s.Sex, st.Name, st.PPPPerCapita FROM Scientists s
JOIN States st ON st.StateId=s.StateId

--3
SELECT p.Name as NazivProjekta, 
	COALESCE((SELECT a.Name FROM Accelerators a
	JOIN AcceleratorsProjects ap ON ap.AcceleratorId=a.AcceleratorId
	WHERE ap.ProjectId=p.ProjectId),'NEMA IH') as Akcelerator
FROM Projects p

--4
SELECT DISTINCT p.Name as Project FROM Projects p
JOIN ScientificWorks sw ON sw.ProjectId=p.ProjectId
WHERE DATE_PART('year',sw.DateOfPublication) BETWEEN 2015 AND 2017

--5
SELECT DISTINCT ON(st.Name) st.Name, COUNT(*) as BrojRadova, 
MAX(sw.NumberOfQuotes) NajpopularnijiRadBrCitata
FROM ScientificWorks sw
JOIN ScientistsScientificWork ssw ON ssw.ScientificWorkId=sw.ScientificWork
JOIN Scientists s ON s.ScientistId=ssw.ScientistId
JOIN States st ON st.StateId=s.StateId
group by st.Name
order by st.Name,NajpopularnijiRadBrCitata desc

--6
SELECT DISTINCT ON (s.StateId) s.Name, sw.Name, sw.DateOfPublication FROM States s
JOIN Scientists sc ON sc.StateId=s.StateId
JOIN ScientistsScientificWork ssw ON ssw.ScientistId=sc.ScientistId
JOIN ScientificWorks sw ON sw.ScientificWork=ssw.ScientificWorkId
ORDER BY s.StateId,sw.DateOfPublication

--7
SELECT c.Name,
	(SELECT COUNT(*) FROM Scientists s WHERE
	(SELECT h.HotelId FROM Hotels h WHERE s.HotelId=h.HotelId
 	AND h.CityId=c.CityId ) >0)
	AS Broj
FROM Cities c

--8
SELECT DISTINCT a.Name, ROUND(AVG(sw.NumberOfQuotes),2) as ProsjecanBrojCitata
FROM ScientificWorks sw
JOIN Projects p ON sw.ProjectId=p.ProjectId
JOIN AcceleratorsProjects ap ON ap.ProjectId=p.ProjectId
JOIN Accelerators a ON a.AcceleratorId=ap.AcceleratorId
GROUP BY a.Name
Order by ProsjecanBrojCitata desc

--9
SELECT DISTINCT ON(p.Name, DATE_PART('decade',s.BirthDate), s.Sex) p.Name,DATE_PART('decade',s.BirthDate) AS Desetljece,s.Sex, 
COUNT(*) BrojZnanstvenika
FROM Scientists s
JOIN Professions p ON s.ProfessionId=p.ProfessionId
GROUP BY p.Name,DATE_PART('decade',s.BirthDate), s.Sex
ORDER BY Desetljece