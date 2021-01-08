-- ## 집합연산 
-- ## 1. UNION (DISTINT): 중복 허용 X  
-- ## 2. UNION ALL: 중복 허용 

-- 테이블 간 가지고 있는 값을 
-- 더하거나, 빼거나, 교집합만 나타내고 싶을 때 함수들은 MySQL에선 지원하지 않는다.

-- Q1) Product 테이블에서 Price가 5이하 또는 200이상인 상품들만 출력하시오.

-- A1)
SELECT *
FROM Products
WHERE price <= 5 OR Price >= 200

-- A2) 
SELECT *
FROM Products
WHERE price <= 5 
​
UNION
​
SELECT *
FROM Products
WHERE Price >= 200

-- EXCEPT, MINUS : 위의 테이블에서 아래의 테이블 빼기 in Oracle
-- INTERCEPT : 두 테이블의 교집합 값만 구하기


-- HackerRank ) Symmetric Pairs ***

/*
20 20 : X와 Y가 동일한 경우 -> 해당 pair의 값이 두개 이상인 경우 
UNION
20 21 : X와 Y가 동일하지 않는 경우 
22 23 
ORDER BY X
*/

-- X와 Y가 동일한 경우 -> 해당 pair의 값이 두개 이상인 경우  
-- 13 13 (in dataSet)

SELECT X, Y
FROM Functions
WHERE X = Y
GROUP BY X, Y
HAVING COUNT(*) >= 2  -- X,Y로 그룹핑해준 후, X와 Y 같은 경우를 COUNT 
-- UNION 위의 테이블에는 ORDER BY를 적을 수 없다.

UNION

-- X와 Y가 동일하지 않는 경우 
SELECT f1.X, f1.Y -- , f2.X, f2.Y
FROM Functions AS f1
    INNER JOIN Functions AS f2 ON f1.X = f2.Y AND f1.Y = f2.X
WHERE f1.X < f1.Y -- List the rows such that X1 < Y1이며, X와 Y가 동일하지 않는 경우

ORDER BY X
-- UNION을 쓸 경우에는 쿼리문의 가장 아래에 ORDER BY < 하나만 적용
