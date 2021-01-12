-- ## GROUP BY, HAVING

-- 공급자아이디별로 평균가격 출력 
SELECT SupplierID, AVG(Price)
FROM Products
GROUP BY SupplierID

SELECT SupplierID
	, Categoryid
    , AVG(Price)
FROM Products
GROUP BY SupplierID, Categoryid
ORDER BY AVG(Price) DESC

-- MySQL은 Group by에 숫자도 지원한다. (권장X)
-- GROUP BY 1, 2 -- SELECT문에 있는 첫번째, 두번째 컬럼을 기준으로 GROUP BY를 해라는 의미 


SELECT SupplierID
	, Categoryid
    , AVG(Price) AS avg_price
FROM Products
-- WHERE Price >= 100  
-- WHERE문은 GROUP BY 이전에 적용된다. 
GROUP BY SupplierID, Categoryid
-- GROUP BY 한 결과에서 추출조건을 걸고싶으면 HAVING
HAVING avg_price >= 100 


-- Query the difference between the maximum and minimum populations in CITY.
SELECT MAX(population)-MIN(population)
FROM city

-- Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT FLOOR(AVG(population))
FROM city

-- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT count(city)- count(DISTINCT city)
FROM station


-- HackerRank) TOP Earners
/* 
We define an employee's total earnings to be their monthly salaryXmonths worked, 
and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings.
Then print these values as 2 space-separated integers.*/
SELECT MAX(salary*months) ,count(employee_id)
FROM Employee

/*
1. salary * month = earnings
2. 각 earning 별로 몇 명이 그만큼 벌었는지 계산. GROUP BY
3. earning 중에 가장 큰 값을 가져온다. ORDER BY, LIMIT
*/

SELECT salary * months AS earnings, count(*)
FROM employee
GROUP BY earnings
ORDER BY earnings DESC 
LIMIT 1 

