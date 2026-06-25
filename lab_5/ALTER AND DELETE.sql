USE BSC_HONS_3A_242
GO

										--ALTER--

--1. Add column state varchar(20).  

	ALTER TABLE DEPOSIT
	ADD STATE VARCHAR(20)

	SELECT * FROM DEPOSIT_DETAIL
--2. Add two more columns city varchar(20) and pincode int. 

	ALTER TABLE DEPOSIT
	ADD CITY VARCHAR(20) , PINCODE INT

--3. Change the size of cname column from varchar(50) to varchar(35). 

	ALTER TABLE DEPOSIT
	ALTER COLUMN CNAME VARCHAR(35)

--4. Change the data type of amount from decimal to int. 

	ALTER TABLE DEPOSIT
	ALTER COLUMN AMOUNT INT

--5. Delete column city from the DEPOSIT table. 
	
	ALTER TABLE DEPOSIT
	DROP COLUMN CITY

--6. Rename column actno to ano.  
	
	SP_RENAME 'DEPOSIT.ACTNO','ANO'

--7. Rename column bname to branch_name.  

	SP_RENAME 'DEPOSIT.BNAME' , 'BRANCH_NAME'

--8. Rename table DEPOSIT to DEPOSIT_DETAIL.

	SP_RENAME 'DEPOSIT' , 'DEPOSIT_DETAIL'

	SELECT * FROM DEPOSIT_DETAIL
--9. Add column ifsc_code varchar(15).
	
	ALTER TABLE DEPOSIT_DETAIL
	ADD IFSC_CODE VARCHAR(15)

--10. Change the size of bname column from varchar(50) to varchar(30). 
	
	ALTER TABLE DEPOSIT_DETAIL
	ALTER COLUMN BRANCH_NAME VARCHAR(30) 



								--DELETE--

--1. Delete all the records having amount less than or equal to 3000.

	DELETE FROM DEPOSIT_DETAIL
	WHERE AMOUNT <= 3000

	SELECT * FROM DEPOSIT_DETAIL
--2. Delete all the accounts of ‘BEDI’ branch customer.

	DELETE FROM DEPOSIT_DETAIL
	WHERE BRANCH_NAME = 'BEDI'
--3. Delete all the accounts having account number greater than 102 and less than 109. 
	
	DELETE FROM DEPOSIT_DETAIL
	WHERE ANO > 102 AND ANO < 109
--4. Delete all the accounts whose branch is ‘BEDI’ or ‘MADHAPAR’.

	DELETE FROM DEPOSIT_DETAIL		
	WHERE BRANCH_NAME = 'BEDI' OR BRANCH_NAME = 'MADHAPAR'
--5. Delete all the accounts details where amount is 8000 and account open after 1-1-2025; 
	
	DELETE FROM DEPOSIT_DETAIL
	WHERE AMOUNT = 8000 AND ADATE > '1-1-2025'


--6. Delete all the accounts whose account branch is NULL.

	DELETE FROM DEPOSIT_DETAIL
	WHERE BRANCH_NAME IS NULL
	SELECT * FROM DEPOSIT_DETAIL
--7. Delete all the accounts details where amount is 7000 and name is CHARMI and branch is SHITAL PARK. 
	
	DELETE FROM DEPOSIT_DETAIL
	WHERE AMOUNT = 7000 AND CNAME = 'CHARMI' AND BRANCH_NAME = 'SHITAL PARK'
--8. Delete all the remaining records using DELETE command.  
	
	DELETE FROM DEPOSIT_DETAIL

--9. Delete all the records of DEPOSIT table. (Use TRUNCATE)  

	TRUNCATE TABLE DEPOSIT_DETAIL

--10. Remove DEPOSIT table. (Use DROP) 

	DROP TABLE DEPOSIT_DETAIL







--Part – B:  DEPOSIT
--11. Rename column adate to aopendate. 

	SP_RENAME 'DEPOSIT.ADATE' , 'AOPENDATE'

	SELECT * FROM DEPOSIT
--12. Delete column aopendate from DEPOSIT_DETAIL table.
	
	ALTER TABLE DEPOSIT
	DROP COLUMN AOPENDATE

--13. Rename column cname to customer_name. 

	SP_RENAME 'DEPOSIT.CNAME' , 'CUSTOMER_NAME'
--14. Add column country varchar(20).
	
	ALTER TABLE DEPOSIT
	ADD COUNTRY VARCHAR(20)

--15. Add column account_type varchar(15). 

	ALTER TABLE DEPOSIT
	ADD ACCOUNT_TYPE VARCHAR(15)

	SELECT * FROM DEPOSIT

--Part – C:  DEPOSIT

--16. Change data type of pincode from int to bigint. 
	
	ALTER TABLE DEPOSIT
	ADD PINCODE INT

	ALTER TABLE DEPOSIT
	ALTER COLUMN PINCODE BIGINT

--17. Delete column account_type.
	ALTER TABLE DEPOSIT
	DROP COLUMN ACCOUNT_TYPE
--18. Rename column amount to balance. 
	ALTER TABLE DEPOSIT
	SP_RENAME 'DEPOSIT.AMOUNT' , 'BALANCE'
--19. Add column status varchar(10). 
	
	ALTER TABLE DEPOSIT
	ADD STATUS VARCHAR(10)

--20. Change table name deposit_detail to bank_deposit. 

	SP_RENAME 'DEPOSIT' , 'BANK_DEPOSIT'

	SELECT * FROM BANK_DEPOSIT



--Part – B: 

	SELECT * FROM STUDENT

--11. Delete all the students whose stdid is greater than 105. 
	
	DELETE FROM STUDENT
	WHERE STDID > 105


	
--12. Delete the records whose branch is NULL and sname is not NULL.

	DELETE FROM STUDENT
	WHERE BRANCH IS NULL AND SNAME IS NOT NULL
--13. Delete the records whose SPI is less than 9 and city is RAJKOT.
	
	DELETE FROM STUDENT
	WHERE SPI < 9 AND CITY = 'RAJKOT'
--14. Delete the records whose branch name is not empty.  

	DELETE FROM STUDENT
	WHERE BRANCH IS NOT NULL
--15. Delete all the records of STUDENT table. (Use TRUNCATE) 

	TRUNCATE TABLE STUDENT