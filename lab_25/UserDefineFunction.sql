--Part – A:  
--1. Implement scalar function to return "Welcome to DBMS Lab". 

CREATE OR ALTER FUNCTION FN_DISPLAY()
RETURNS VARCHAR(100)
AS
BEGIN
	RETURN 'Welcome to DBMS Lab'
END;

SELECT dbo.FN_DISPLAY()
--2. Implement scalar function to calculate simple interest. 
CREATE OR ALTER FUNCTION FN_SIMPLE_INTEREST(
	@P FLOAT ,
	@R FLOAT , 
	@T FLOAT
)
RETURNS FLOAT
AS
BEGIN
	RETURN (@P * @R * @T)/100;
END;

SELECT dbo.FN_SIMPLE_INTEREST(10.0 , 10.0 , 10.0)



--3. Implement scalar function to find difference in days between two dates.
CREATE OR ALTER FUNCTION DIFF_DAY(
	@DATE1 DATE,
	@DATE2 DATE
)
RETURNS INT
AS
BEGIN
	RETURN DATEDIFF(DAY , @DATE2 , @DATE1)
END;

SELECT dbo.DIFF_DAY(GETDATE() , '2026-09-08')



--4. Implement scalar function to check whether number is odd or even.

CREATE FUNCTION FN_ODD_EVEN_CHECK(
	@NUM INT
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @RESULT VARCHAR(100)

	IF @NUM % 2 = 0
		SET @RESULT = 'EVEN'
	ELSE
		SET @RESULT = 'ODD'
	RETURN @RESULT
END

SELECT dbo.FN_ODD_EVEN_CHECK(242)
--5. Implement scalar function to print numbers from 1 to N.

CREATE OR ALTER FUNCTION FN_PRINT_1_TO_N(
	@NUM INT
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @I INT = 1
	DECLARE @RESULT VARCHAR(100) = '';

	WHILE @I <= @NUM
	BEGIN
		SET @RESULT = CONCAT(@RESULT , @I)
		SET @I = @I + 1
	END
	RETURN @RESULT
END

SELECT dbo.FN_PRINT_1_TO_N(5)
 
--Part – B:  
--6. Implement scalar function to calculate factorial of given number. 

CREATE OR ALTER FUNCTION FN_FACT(
	@NUM INT
)
RETURNS INT
AS
BEGIN
	DECLARE @I INT = 1
	DECLARE @FACT INT = 1
	WHILE @I <= @NUM
	BEGIN
		SET @FACT = @FACT * @I
		SET @I = @I + 1
	END
	RETURN @FACT
END

SELECT dbo.FN_FACT(5)
--7. Implement scalar function to check palindrome number.
CREATE FUNCTION FN_PALINDROM(
	@NUM INT
)
RETURNS VARCHAR(100)
BEGIN
	DECLARE @REM INT = 0
	DECLARE @REV INT = 0
	DECLARE @TEMP INT

	SET @TEMP = @NUM

	WHILE @NUM != 0
		SET @REM = @NUM % 10
		SET @REV = 


END


--8. Implement scalar function to find maximum of three numbers. 
--9. Implement scalar function to calculate square and cube of a number. 
 
--From the table EMPLOYEE perform the following queries:  
--Part – C:  
--10. Implement scalar function to return employee full details using EID.
CREATE OR ALTER FUNCTION FN_EMP_DETAILS(
	@EID INT
)
RETURNS TABLE
AS
	RETURN SELECT * FROM EMPLOYEE
	WHERE EID = @EID


SELECT * FROM FN_EMP_DETAILS(101)

--11. Implement scalar function to return highest salary from a given department.

CREATE OR ALTER FUNCTION FN_HIGH_SALARY(
	@DEPA VARCHAR(100)
)
RETURNS DECIMAL(8,2)
AS
BEGIN
	DECLARE @MAX_SALARY DECIMAL(8,2)
	SELECT @MAX_SALARY = MAX(SALARY)   FROM EMPLOYEE
	WHERE DEPARTMENT = @DEPA
	RETURN @MAX_SALARY
END

SELECT dbo.FN_HIGH_SALARY('IT')



--12. Implement scalar function to count total employees in EMPLOYEE table.

CREATE OR ALTER FUNCTION FN_TOTAL_EMP()
RETURNS INT
AS
BEGIN
	DECLARE @TOTAL_EMP INT
	SELECT @TOTAL_EMP = COUNT(EID)   FROM EMPLOYEE
	RETURN @TOTAL_EMP
END

SELECT dbo.FN_TOTAL_EMP()
--13. Implement scalar function to find total experience of employee using JoiningYear.
CREATE OR ALTER FUNCTION FN_EXP()
RETURNS TABLE
AS
	
	RETURN SELECT * , DATEPART(YEAR , GETDATE()) - (JOININGYEAR) AS EXP_ FROM EMPLOYEE

SELECT * FROM FN_EXP()

--14. Implement scalar function to return total number of employees in a given department. 

CREATE OR ALTER FUNCTION FN_TOTAL_EMP_DEPA(
	@DEPA VARCHAR(100)
)
RETURNS INT
AS
BEGIN
	DECLARE @TOTAL_EMP INT
	SELECT @TOTAL_EMP = COUNT(EID)   FROM EMPLOYEE
	WHERE DEPARTMENT = @DEPA
	RETURN @TOTAL_EMP
END

SELECT dbo.FN_TOTAL_EMP_DEPA('IT')
--15. Implement scalar function to count total employees from a given city. 

CREATE OR ALTER FUNCTION FN_TOTAL_EMP_DEPA(
	@CITY VARCHAR(100)
)
RETURNS INT
AS
BEGIN
	DECLARE @TOTAL_EMP INT
	SELECT @TOTAL_EMP = COUNT(EID)   FROM EMPLOYEE
	WHERE CITY = @CITY
	RETURN @TOTAL_EMP
END

SELECT dbo.FN_TOTAL_EMP_DEPA('MORBI')

