
--==========================================
--Part – A: 
--==========================================

--1. Display the result of 5 multiply by 30.

SELECT 5 * 30 AS RESULT

--2. Find out the absolute value of -25, 25, -50 and 50.

SELECT ABS(-25) AS ABS_OF_25
SELECT ABS(25) AS ABS_25
SELECT ABS(-50) AS ABS_50
SELECT ABS(50) AS ABS_50
--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2. 

SELECT CEILING(25.2) AS FIRST_COLUMN , CEILING(25.7) AS SECOND_COLUMN , CEILING(-25.2) AS THIRD_COLUMN
--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2. 

SELECT FLOOR(25.2) AS FIRST_COLUMN , FLOOR(25.7) AS SECOND_COLUMN , FLOOR(-25.2) AS THIRD_COLUMN
--5. Find out remainder of 5 divided 2 and 5 divided by 3. 

SELECT 5 % 2 AS REMINDER , 5 % 3 AS REMINDER

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.

SELECT POWER(3,2) AS ANS , POWER(4,3) AS ANS
--7. Find out the square root of 25, 30 and 50. 

SELECT SQRT(25) AS SQRT_25 , SQRT(30) AS SQRT_30 , SQRT(50) AS SQRT_50

--8. Find out the square of 5, 15, and 25. 

SELECT SQUARE(5) AS SQU_5 , SQUARE(15) AS SQU_15 , SQUARE(25) AS SQU_25
--9. Find out the value of PI. 

SELECT PI()
--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
SELECT ROUND(157.732 , 2) AS ROUND1 , ROUND(157.732 , 0) AS ROUND2 , ROUND(157.732 , -2)

--11. Find out exponential value of 2 and 3. 

SELECT EXP(2) AS FIRST_ , EXP(3) AS SECOND_
--12. Find out logarithm having base e of 10 and 2.

SELECT LOG(10) AS LOG_E , LOG(2) AS LOG_E
--13. Find logarithm base 10 of 5 and 100 

SELECT LOG10(5) AS LOG_10 , LOG10(100) AS LOG_10
--14. Find sine, cosine and tangent of 3.1415. 

SELECT SIN(3.1415) AS ANS_SIN , COS(3.1415) AS ANS_COS , TAN(3.1415) AS ANS_TAN
--15. Find sign of -25, 0 and 25. 

SELECT SIGN(-25) AS SING_1 , SIGN(0) AS SIGN_2 , SIGN(25) AS SIGN_3
--16. Generate random number using function. 

SELECT RAND()




--==================================================
--String functions 
--Part – A: 
--====================================================
--1. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 

SELECT LEN(NULL) AS LENGTH_1 , LEN('HELLO') AS LENGTH_2 , LEN('BLANK') AS LENGTH_3
--2. Display your name in lower & upper case. 

SELECT LOWER('PARTH') AS NAME_LOWER , UPPER('PARTH') AS NAME_UPPER
--3. Display first three characters of your name. 

SELECT LEFT('PARTH' , 3)
--4. Display 3rd to 10th character of your name.

SELECT SUBSTRING('PARTHSARADAVA' , 3  , 10)
--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE. 

SELECT REPLACE('ABC123EFG' , '123' , 'XYZ') AS REPLACE_1 , REPLACE('abcabcabc' , 'C' , '5') AS REPLACE_2
--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 

SELECT ASCII('a') ASCII_a , ASCII('A') ASCII_A , ASCII('z') ASCII_z , ASCII('Z') ASCII_Z , ASCII('0') ASCII_0, ASCII('9') ASCII_9
--7. Write a query to display character based on number 97, 65,122,90,48,57. 

SELECT CHAR(97) , CHAR(65) , CHAR(122) , CHAR(90) , CHAR(48) , CHAR(57)
--8. Write a query to remove spaces from left of a given string ‘ hello world  ‘.

SELECT LTRIM(' HELLO WORLD')
--9. Write a query to remove spaces from right of a given string ‘ hello world  ‘. 
SELECT RTRIM(' HELLO WORLD ')
--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’.

SELECT LEFT('SQL Server' , 4) , RIGHT('SQL Server' , 5)
--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function). 

SELECT CAST('1234.56' AS decimal)
SELECT CONVERT(DECIMAL , '1234.56')
--12. Write a query to convert a float 10.58 to integer (Use cast and convert function). 

SELECT CAST(10.58 AS int)
SELECT CONVERT(INT , 10.58)
--13. Put 10 space before your name using function.

SELECT SPACE(10) + 'PARTH'
--14. Combine two strings using + sign as well as CONCAT (). 

SELECT CONCAT('USING' , 'SIGN US')
--15. Find reverse of “Darshan”.

SELECT REVERSE('Darshan')
--16. Repeat your name 3 times.

SELECT REPLICATE('PARTH' , 3)


--=========================================================
--Part – B: Perform following queries on EMPLOYEE table.
--===========================================================


--17. Display FIRSTNAME and LASTNAME in lowercase and uppercase. 

SELECT LOWER(FIRSTNAME) , UPPER(LASTNAME) FROM EMPLOYEE
--18. Display full name by combining FIRSTNAME and LASTNAME.

SELECT CONCAT(FIRSTNAME , LASTNAME) FROM EMPLOYEE
--19. Display FIRSTNAME with first 3 characters only. 

SELECT LEFT(FIRSTNAME , 3) FROM EMPLOYEE
--20. Display LASTNAME with last 2 characters only. 

SELECT RIGHT(LASTNAME , 2) FROM EMPLOYEE
--21. Display length of each employee’s FIRSTNAME.

SELECT LEN(FIRSTNAME) FROM EMPLOYEE
--22. Display FIRSTNAME after replacing ‘A’ with ‘@’. 

SELECT REPLACE(FIRSTNAME , 'A' , '@') FROM EMPLOYEE

--23. Display FIRSTNAME and LASTNAME with - between them using CONCAT.

SELECT CONCAT(FIRSTNAME ,'-', LASTNAME) FROM EMPLOYEE


--=======================================================
--Part – C: Perform following queries on EMPLOYEE table. 
--=======================================================

--24. Display FIRSTNAME without first and last character.

SELECT SUBSTRING(FIRSTNAME , 2 , LEN(FIRSTNAME) - 2)  FROM EMPLOYEE

--25. Display FIRSTNAME after replacing vowels with '*'. 
SELECT REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
FIRSTNAME,
'A',
'*'
),
'E',
'*'
),
'I',
'*'
),
'O',
'*'
),
'U',
'*'
)
FROM EMPLOYEE

--26. Display employees where combined length of FIRSTNAME and LASTNAME is greater than 10.

SELECT FIRSTNAME , LASTNAME
FROM EMPLOYEE
WHERE LEN(CONCAT(FIRSTNAME , LASTNAME))  > 10
--27. Display FIRSTNAME and its reverse.

SELECT FIRSTNAME , REVERSE(FIRSTNAME) FROM EMPLOYEE
--28. Display employees whose FIRSTNAME and LASTNAME start with same character using LEFT() 

SELECT * FROM EMPLOYEE
WHERE LEFT(FIRSTNAME , 1) = LEFT(LASTNAME , 1)