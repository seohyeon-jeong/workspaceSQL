-- 데이터 정렬하기
SELECT * 
FROM Customers
WHERE 
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

-- ## MySQL 문자열 자르기 
-- LEFT(컬럼명 또는 문자열, 문자열의 길이)
-- RIGHT(컬럼명 또는 문자열, 문자열의 길이)
-- SUBSTR(컬럼명 또는 문자열, 시작 위치, 길이)
SUBSTR("20140323", 1, 4) -- 2014
SUBSTR("20140323", 5) -- 5 : 길이 안쓰면 해당 위치부터 끝까지 출력

-- ## MySQL 소수점 처리 
-- CEIL() 올림
-- FLOOR() 내림
-- ROUND(숫자, 표현해줄 자리수 n번째) 반올림

/* Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.*/

SELECT ROUND(long_w, 4) -- long_w 소수점 네자리까지만 반올림된 값
FROM station 
WHERE lat_n < 137.2345 
ORDER BY lat_n DESC -- lat_n을 큰순으로 나열해서 
LIMIT 1 -- 반환값을 하나로 제한 -> largest number 추출
