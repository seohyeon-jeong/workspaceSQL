-- 데이터 정렬하기
SELECT * 
FROM Customers
ORDER BY customerID DESC -- 내림차순 
-- ASC 오름차순(default) : 작은 것부터 -> 높은 것
-- 저장되어 있는 데이터의 순서를 변경하지 않는다. 뷰의 순서만 변경

-- 데이터 정렬하기
SELECT * 
FROM Products
WHERE price >= 20
ORDER BY price DESC

-- 데이터 정렬하기
SELECT * 
FROM Products
ORDER BY price DESC
LIMIT 1 -- 결과를 하나로 제한

SELECT name
FROM employee
WHERE salary > 2000 AND months < 10 
ORDER BY employee_id

-- greater than, higher than : 초과 
-- less than : 미만

/*
HackerRank) Weather Observation Station 5
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
*/


SELECT city, LENGTH(city) 
FROM station
ORDER BY LENGTH(city),city ASC
LIMIT 1;
    
SELECT city, LENGTH(city) 
FROM station
ORDER BY LENGTH(city) DESC
LIMIT 1;
