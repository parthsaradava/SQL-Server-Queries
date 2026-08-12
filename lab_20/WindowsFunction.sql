SELECT * FROM STUDENT


--Part – A: 
--1. Display rank of students based on SPI. 

	SELECT *,
	RANK() OVER(ORDER BY SPI) AS SPI_RANK
	FROM STUDENT
--2. Display dense rank of students based on SPI.
	SELECT *,
	DENSE_RANK() OVER(ORDER BY SPI) AS SPI_RANK
	FROM STUDENT

--3. Display sequential number for each student record.
	SELECT *,
	ROW_NUMBER() OVER(ORDER BY SPI) AS SPI_RANK
	FROM STUDENT
	
--4. Display branch-wise rank of students.
	
	SELECT *,
	RANK() OVER(PARTITION BY BRANCH
				ORDER BY SPI) AS SPI_RANK
	FROM STUDENT
	
--5. Display branch-wise dense ranking of students.

	SELECT *,
	DENSE_RANK() OVER(PARTITION BY BRANCH
				ORDER BY SPI) AS SPI_RANK
	FROM STUDENT
--6. Display branch-wise sequential numbering of students.
	
	SELECT *,
	ROW_NUMBER() OVER(PARTITION BY BRANCH
						ORDER BY SPI) AS SPI_RANK
	FROM STUDENT

--7. Display SNAME, Current SPI, Previous SPI and SPI Difference with previous student in ascending order of 
--SPI. 

	SELECT SNAME , SPI , 
	LAG(SPI) OVER(ORDER BY SPI ASC) AS PREVIOUS_SPI , 
	SPI - LAG(SPI) OVER(ORDER BY SPI ASC) AS Difference_SPI
	FROM STUDENT

--8. Display SNAME, Current SPI, Next SPI and SPI Difference with next student in descending order of SPI.  

	SELECT SNAME , SPI , 
	LEAD(SPI) OVER(ORDER BY SPI DESC) AS NEXT_SPI,
	SPI - LEAD(SPI) OVER(ORDER BY SPI DESC) AS Difference_SPI
	FROM STUDENT
--9. Display top 3 students based on SPI. 

	SELECT * 
	FROM (
		SELECT SNAME , SPI , DENSE_RANK() OVER(ORDER BY SPI DESC) AS SPI_RANK
		FROM STUDENT
	)STUDENT
	WHERE SPI_RANK <= 3
--10. Display top 2 students from each branch.
	SELECT * 
	FROM (
		SELECT SNAME , SPI , BRANCH ,DENSE_RANK() OVER( PARTITION BY BRANCH
												ORDER BY SPI DESC) AS SPI_RANK
		FROM STUDENT
	)STUDENT
	WHERE SPI_RANK <= 2
	
 
--Part – B: 
--11. Display 5th highest SPI. 

	SELECT * 
	FROM (
		SELECT SNAME , SPI , BRANCH ,DENSE_RANK() OVER(
												ORDER BY SPI DESC) AS SPI_RANK
		FROM STUDENT
	)STUDENT
	WHERE SPI_RANK = 5
	
--12. Display 6th highest SPI. 
	
	SELECT * 
	FROM (
		SELECT SNAME , SPI , BRANCH ,DENSE_RANK() OVER(
												ORDER BY SPI DESC) AS SPI_RANK
		FROM STUDENT
	)STUDENT
	WHERE SPI_RANK = 6
	
--13. Display students having same ranking.
	
	SELECT SNAME , SPI , SPI_RANK 
	FROM (
		SELECT SNAME , SPI , BRANCH ,DENSE_RANK() OVER(
												ORDER BY SPI) AS SPI_RANK
		FROM STUDENT
	) AS S1 
	WHERE SPI_RANK IN (
		SELECT SPI_RANK FROM
		(
			SELECT DENSE_RANK() OVER(ORDER BY SPI ) AS SPI_RANK FROM STUDENT
		) AS S2
		GROUP BY SPI_RANK 
		HAVING COUNT(*) > 1
	)
	
	
--14. Display SNAME, Previous SPI, Current SPI and Next SPI based on ascending order of SPI.

	SELECT SNAME ,
	SPI,
	LAG(SPI) OVER(ORDER BY SPI) AS PRE_SPI,
	LEAD(SPI) OVER(ORDER BY SPI) AS NEXT_SPI
	FROM STUDENT

--15. Display topper of each branch.

	SELECT * 
	FROM
	(
		SELECT SNAME , SPI , BRANCH, DENSE_RANK() OVER( PARTITION BY BRANCH
														ORDER BY SPI) AS TOP_SPI FROM STUDENT
	)STUDENT
	WHERE TOP_SPI = 1
 
--Part – C: 
--16. Display students whose SPI is greater than the previous student and less than the next student.
		
		
	SELECT SNAME ,
	SPI
	FROM (
		SELECT SNAME , SPI , LAG(SPI) OVER(ORDER BY SPI) AS PRE_SPI , LEAD(SPI) OVER(ORDER BY SPI) AS NEXT_SPI
		FROM STUDENT
	)STUDENT
	WHERE SPI > PRE_SPI AND SPI < NEXT_SPI
	

--17. Display branch-wise second topper students.
	SELECT SNAME ,
	SPI
	FROM (
		SELECT SNAME , SPI , DENSE_RANK() OVER( PARTITION BY BRANCH 
												ORDER BY SPI DESC) AS SECOND_TOPEER
		FROM STUDENT
	)STUDENT
	WHERE SECOND_TOPEER = 2
	

--18. Display students whose rank and dense rank are different.
	SELECT SNAME ,
	SPI
	FROM (
		SELECT SNAME , SPI , DENSE_RANK() OVER(ORDER BY SPI DESC) AS DENSE , 
		RANK() OVER(ORDER BY SPI DESC) AS RN
		FROM STUDENT
	)STUDENT
	WHERE DENSE != RN

--19. Display consecutive students having same branch ordered by SPI.

	SELECT SNAME,SPI,BRANCH
	FROM(
		SELECT SPI , SNAME , BRANCH ,
		LEAD(BRANCH) OVER(ORDER BY SPI ) AS NEXT_BRANCH,
		LAG(BRANCH) OVER(ORDER BY SPI ) AS PRE_BRANCH 
		FROM STUDENT

	)STUDENT
	WHERE BRANCH = NEXT_BRANCH OR BRANCH = PRE_BRANCH

--20. Display students whose SPI difference with previous student is maximum.
	SELECT MAX(SPI - PRE_BRANCH) AS MAX_SPI
	FROM(	
		SELECT SNAME , SPI , LAG(SPI) OVER(ORDER BY SPI ) AS PRE_BRANCH FROM STUDENT
	)
	STUDENT
	

