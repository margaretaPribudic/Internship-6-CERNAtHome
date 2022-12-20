SELECT sw.Name AS Naziv, sw.DateOfPublication AS DatumObjave,
(SELECT STRING_AGG(s.LastName||', '||LEFT(s.FirstName,1)||'.', '; ') FROM Scientists s WHERE
	(SELECT Count(*) FROM ScientistsScientificWork ssw WHERE ssw.ScientistId = s.ScientistId AND ssw.ScientificWorkId = sw.ScientificWork) > 0)
AS Scientists
FROM ScientificWorks sw

SELECT s.FirstName, s.LastName, s.Sex, st.Name, st.PPPPerCapita FROM Scientists s
JOIN States st ON st.StateId=s.StateId

SELECT a.Name AS Accelerator, p.Name AS Project FROM Accelerators a
JOIN AcceleratorsProjects ap ON ap.AcceleratorId=a.AcceleratorId
LEFT JOIN Projects p ON ap.ProjectId=p.ProjectId

SELECT DISTINCT p.Name as Project FROM Projects p
JOIN ScientificWorks sw ON sw.ProjectId=p.ProjectId
WHERE DATE_PART('year',sw.DateOfPublication) BETWEEN 2015 AND 2017