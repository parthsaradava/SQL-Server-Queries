CREATE DATABASE BSC_HONS_3A_242

CREATE TABLE CUSTOMER_ALL (
    ORDERID INT PRIMARY KEY,
    CNAME VARCHAR(50) NOT NULL,
    PRODUCT VARCHAR(50) NOT NULL,
    CATEGORY VARCHAR(50) NOT NULL,
    AMOUNT DECIMAL(10, 2) NOT NULL,
    ORDERYEAR INT NOT NULL,
    CITY VARCHAR(50) NOT NULL
);


INSERT INTO CUSTOMER_ALL(ORDERID, CNAME, PRODUCT, CATEGORY, AMOUNT, ORDERYEAR, CITY) 
VALUES
    (101, 'RAHUL', 'LAPTOP', 'ELECTRONICS', 65000, 2024, 'RAJKOT'),
    (102, 'PRIYA', 'MOBILE', 'ELECTRONICS', 25000, 2023, 'SURAT'),
    (103, 'AMIT', 'TABLE', 'FURNITURE', 12000, 2022, 'AHMEDABAD'),
    (104, 'NEHA', 'CHAIR', 'FURNITURE', 8000, 2024, 'BARODA'),
    (105, 'VISHAL', 'TV', 'ELECTRONICS', 45000, 2025, 'MORBI'),
    (106, 'RIYA', 'SOFA', 'FURNITURE', 30000, 2023, 'SURAT'),
    (107, 'MEHUL', 'AC', 'ELECTRONICS', 40000, 2022, 'RAJKOT'),
    (108, 'KRUNAL', 'BED', 'FURNITURE', 40000, 2025, 'JAMNAGAR');


    SELECT * FROM CUSTOMER_ALL



--    Part – A:
--1. Display top 3 highest amount orders.
    
    WITH ORDER_AMOUNT AS
    (
        SELECT * , DENSE_RANK() OVER(ORDER BY AMOUNT DESC) AS HIGH_AMOUNT  FROM CUSTOMER_ALL
    )
    SELECT * FROM ORDER_AMOUNT
    WHERE HIGH_AMOUNT <= 3

--2. Display second highest order amount.

     WITH ORDER_AMOUNT AS
    (
        SELECT * , DENSE_RANK() OVER(ORDER BY AMOUNT DESC) AS HIGH_AMOUNT  FROM CUSTOMER_ALL
    )
    SELECT * FROM ORDER_AMOUNT
    WHERE HIGH_AMOUNT = 2
--3. Display customers whose order amount is greater than category average amount

    WITH CATEGORY_AVG_AMOUNT AS
    (   
        SELECT CATEGORY,AVG(AMOUNT) AS AVG_AMOUNT FROM CUSTOMER_ALL
        GROUP BY CATEGORY
    )
    SELECT C.CNAME , C.PRODUCT , C.AMOUNT 
    FROM CUSTOMER_ALL C
    INNER JOIN CATEGORY_AVG_AMOUNT A
    ON C.CATEGORY = A.CATEGORY
    WHERE C.AMOUNT > A.AVG_AMOUNT


--4. Display categories having average amount greater than 30000.
    
    WITH CATEGORY_WISE_AVG_AMOUNT AS
    (   
        SELECT CATEGORY,AVG(AMOUNT) AS AVG_AMOUNT 
        FROM CUSTOMER_ALL
        GROUP BY CATEGORY
    )
    SELECT * FROM CATEGORY_WISE_AVG_AMOUNT
    WHERE AVG_AMOUNT > 30000
   
--5. Display highest amount order from each category.
    
     WITH HIGEST_AMOUNT AS
    (   
        SELECT * , ROW_NUMBER() OVER(
            PARTITION BY CATEGORY 
            ORDER BY AMOUNT DESC
        ) AS HIGHEST_CATEGORY
        FROM CUSTOMER_ALL
    )
    SELECT * FROM HIGEST_AMOUNT
    WHERE HIGHEST_CATEGORY = 1
   
    
--6. Display lowest amount order from each category.

 WITH HIGEST_AMOUNT AS
    (   
        SELECT * , ROW_NUMBER() OVER(
            PARTITION BY CATEGORY 
            ORDER BY AMOUNT 
        ) AS HIGHEST_CATEGORY
        FROM CUSTOMER_ALL
    )
    SELECT * FROM HIGEST_AMOUNT
    WHERE HIGHEST_CATEGORY = 1
--7. Display categories having more than 3 orders.

    WITH ORDER_YEAR AS
    (   
        SELECT CATEGORY , 
        COUNT(ORDERYEAR) AS ORDER_YEAR_IN
        FROM CUSTOMER_ALL
        GROUP BY CATEGORY
    )
    SELECT * FROM ORDER_YEAR
    WHERE ORDER_YEAR_IN >= 3
--8. Display city-wise total order amount.

     WITH CITY_WISE AS
    (   
        SELECT CITY , 
        SUM(AMOUNT) AS TOTAL_AMOUNT
        FROM CUSTOMER_ALL
        GROUP BY CITY
    )
    SELECT * FROM CITY_WISE
    
--9. Display category having highest average order amount.

    WITH HIGH_AVG AS
    (   
        SELECT TOP 1 CATEGORY , 
        AVG(AMOUNT) AS AVG_HIGH
        FROM CUSTOMER_ALL
        GROUP BY CATEGORY
    )
    SELECT * FROM HIGH_AVG

    
--10. Display cumulative order amount in ascending order of amount.
    
     WITH CUMULATIVE AS
    (   
        SELECT * , 
        SUM(AMOUNT) OVER(
        ORDER BY AMOUNT
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW 
        ) AS CUMULATIVE_AMOUNT
        FROM CUSTOMER_ALL
        
    )
    SELECT * FROM CUMULATIVE



--Part – B:
--11. Display category-wise top 2 highest amount orders.

    WITH TOP_2_AMOUNT AS
    (
        SELECT * , DENSE_RANK() OVER(
        PARTITION BY CATEGORY
        ORDER BY AMOUNT DESC)  AS TOP_2
        FROM CUSTOMER_ALL
    )

    SELECT * FROM TOP_2_AMOUNT
    WHERE TOP_2 <= 2
--12. Display customers whose amount is closest to category average amount.

    WITH CLOSEST AS 
    (
        SELECT CATEGORY,AVG(AMOUNT) AS AVGSPI
        FROM CUSTOMER_ALL
        GROUP BY CATEGORY
    ),
    DIFFDATA AS
    (
        SELECT C.CATEGORY , ABS(C.AMOUNT - S.AVGSPI) AS DIFF_AMOUNT
        FROM CUSTOMER_ALL C
        CROSS JOIN CLOSEST S
        ON C.CATEGORY = S.CATEGORY
        GROPU BY CATEGORY
    )
    SELECT TOP 1 * FROM DIFFDATA
    ORDER BY DIFF_AMOUNT
--13. Display previous, current and next order amount together.

    WITH SAW_AMOUNT AS
    (   
        SELECT * ,
        LAG(AMOUNT) OVER(ORDER BY AMOUNT) AS PREV_AMOOUNT,
        LEAD(AMOUNT) OVER(ORDER BY AMOUNT) AS NEXT_AMOUNT
        FROM CUSTOMER_ALL
    )
    SELECT * FROM SAW_AMOUNT
--14. Display customers whose amount is greater than previous customer's amount.
    WITH CHECK_PREV_AMOUNT AS
    (
         
        SELECT * ,
        LAG(AMOUNT) OVER(ORDER BY AMOUNT) AS PREV_AMOOUNT
        FROM CUSTOMER_ALL 
    )

    SELECT * FROM CHECK_PREV_AMOUNT
    WHERE AMOUNT > PREV_AMOOUNT
--15. Display customers whose rank and dense rank are different.
    WITH RANK_DIFF AS
    (
         
        SELECT * ,
        RANK() OVER(ORDER BY AMOUNT) AS RANK_AMOUNT,
        DENSE_RANK() OVER(ORDER BY AMOUNT) AS DENSE_RANK_AMOUNT
        FROM CUSTOMER_ALL 
    )

    SELECT * FROM RANK_DIFF
    WHERE RANK_AMOUNT <> DENSE_RANK_AMOUNT

--Part – C


--16. Display orders whose amount is neither highest nor lowest in their category.
    WITH NOT_HIGH_LOW AS
    (
         
        SELECT * ,
        DENSE_RANK() OVER(ORDER BY AMOUNT DESC) AS DENSE_RANK_AMOUNT_DESC,
        DENSE_RANK() OVER(ORDER BY AMOUNT) AS DENSE_RANK_AMOUNT_ASC
        FROM CUSTOMER_ALL 
    )

    SELECT * FROM NOT_HIGH_LOW
    WHERE DENSE_RANK_AMOUNT_DESC != 1 AND DENSE_RANK_AMOUNT_ASC != 1
    
        
--17. Display category-wise difference between highest and lowest amount.

     WITH CATE_DIFF AS
    (
         
        SELECT CATEGORY,
        MAX(AMOUNT) AS MAX_ , 
        MIN(AMOUNT) AS MIN_
        FROM CUSTOMER_ALL 
        GROUP BY CATEGORY
     
    )

    SELECT * , ABS(MAX_-MIN_) FROM CATE_DIFF

--18. Display customers whose amount is greater than all FURNITURE category orders.

    WITH CTE AS
(
    SELECT MAX(AMOUNT) AS MAX_FURNITURE
    FROM CUSTOMER_ALL
    WHERE CATEGORY = 'FURNITURE'
)
SELECT *
FROM CUSTOMER_ALL
WHERE AMOUNT > (SELECT MAX_FURNITURE FROM CTE);
--19. Display categories where all orders are above 10000.
       WITH CTE AS
    (
        SELECT CATEGORY , MIN(AMOUNT) AS MIN_AMOUNT FROM CUSTOMER_ALL
        GROUP BY CATEGORY
    )
    SELECT *
        FROM CTE
        WHERE MIN_AMOUNT > 10000
   

--20. Display customers whose amount difference from category topper is minimum
WITH CTE AS
(
    SELECT *,
           MAX(AMOUNT) OVER(PARTITION BY CATEGORY) AS TOPPER
    FROM CUSTOMER_ALL
)
SELECT *
FROM CTE
WHERE TOPPER - AMOUNT =
(
    SELECT MIN(TOPPER - AMOUNT)
    FROM CTE C
    WHERE C.CATEGORY = CTE.CATEGORY
);
