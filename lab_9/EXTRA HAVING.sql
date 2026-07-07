CREATE TABLE Project_Assignments ( 
Assignment_ID INT PRIMARY KEY, 
Employee_Name VARCHAR (50), 
Department VARCHAR (30), 
Hours_Worked INT 
); 

INSERT INTO Project_Assignments VALUES 
(101,'Ayaan','AI',38), 
(102,'Kiara','Cloud',45), 
(103,'Neel','AI',42), 
(104,'Meera','Security',31), 
(105,'Rohan','Cloud',50), 
(106,'Ishita','AI',29), 
(107,'Dev','Security',47), 
(108,'Sana','Cloud',36), 
(109,'Arjun','Security',41), 
(110,'Tara','AI',42) 

--1) Display each department and the total hours worked. 

SELECT * FROM Project_Assignments

SELECT Department , SUM(Hours_Worked) AS HOURS_WORKED 
FROM Project_Assignments
GROUP BY Department
--2) Show departments where the total hours worked are greater than 
--120. 

SELECT Department , SUM(Hours_Worked) AS HOURS_WORKED 
FROM Project_Assignments
GROUP BY Department
HAVING SUM(Hours_Worked) > 120
--3) Find the average hours worked in each department and display 
--them from highest to lowest average.

SELECT Department , AVG(Hours_Worked) AS Hours_Worked 
FROM Project_Assignments
GROUP BY Department
ORDER BY AVG(Hours_Worked) DESC
--4) Display departments having more than 3 employees.

SELECT Department , COUNT(Assignment_ID) AS Assignment_ID  
FROM Project_Assignments
GROUP BY Department
HAVING COUNT(Assignment_ID) > 3
--5) Show departments whose maximum hours worked exceed 45.

SELECT Department , MAX(Hours_Worked) AS Hours_Worked 
FROM Project_Assignments
GROUP BY Department
HAVING MAX(Hours_Worked) > 45
--6) Find departments where the minimum hours worked is less than 30 
--and sort by minimum hours. 

SELECT Department , MIN(Hours_Worked) AS Hours_Worked 
FROM Project_Assignments
GROUP BY Department
HAVING MIN(Hours_Worked) < 30
ORDER BY MIN(Hours_Worked) 
--7) Display each department with employee count and total hours. 
--Show only departments having an average greater than 40.

SELECT Department , COUNT(Assignment_ID)AS Assignment_ID , SUM(Hours_Worked) AS SUM_
FROM Project_Assignments
GROUP BY Department
HAVING AVG(Hours_Worked) > 40
--8) Find departments where total hours are between 100 and 170. 
--Display them in descending order of total hours. 

SELECT Department , SUM(Hours_Worked) AS SUM_
FROM Project_Assignments
GROUP BY Department
HAVING SUM(Hours_Worked) BETWEEN 100 AND 170
ORDER BY SUM(Hours_Worked) DESC
--9) Display departments having at least 3 employees. Sort first by 
--employee count (descending), then by department name 
--(ascending). 

SELECT Department , COUNT(Assignment_ID) AS ID
FROM Project_Assignments
GROUP BY Department
HAVING COUNT(Assignment_ID) >= 3
ORDER BY COUNT(Assignment_ID) DESC , Department
--10) Display each department with: 
--• Number of employees  
--• Total hours worked  
--• Average hours worked  
--Show only departments where: 
--• Total hours are greater than 110  
--• Average hours are greater than 38  
--Sort by average hours (descending) and then department name.

SELECT Department , COUNT(Assignment_ID) AS Assignment_ID , SUM(Hours_Worked) AS SUM_ , AVG(Hours_Worked) AS HOURS
FROM Project_Assignments
GROUP BY Department
HAVING SUM(Hours_Worked) > 110 AND AVG(Hours_Worked) > 38
ORDER BY AVG(Hours_Worked) DESC , Department



