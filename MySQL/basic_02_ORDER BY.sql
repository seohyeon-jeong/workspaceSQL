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


