-- ## JOIN : 여러 테이블간의 연결을 위해 사용
-- 참고 링크 : https://sql-joins.leopard.in.ua/

-- 1. INNER JOIN : 양쪽 다 데이터가 있을 때만 교집합 출력 

-- Old) 두 테이블의 값을 모두 가져오고나서, WHERE문으로 공통된 부분만 필터링 
    SELECT * 
    FROM Users, Orders
    WHERE Users.Id = Orders.userId

-- New) Inner Join 이용 
    SELECT *
    FROM Users
        INNER JOIN Orders ON Users.Id = Orders.userId
    -- Users 테이블을 기준으로 Orders 테이블을 Inner Join 할건데 기준이 ON 이하의 것!

SELECT * 
FROM orders
	INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
	INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID

-- ERD(: 테이블간의 관계를 도식화한 것) 을 참고하여 연결할 키가 되는 컬럼명을 확인할 것


-- HackerRank) African cities
SELECT city.name -- 두 테이블 모두 name속성 가지고 있으니 어느 테이블의 name을 가져올지 명명해줘야함
FROM city
    INNER JOIN country ON city.countrycode = country.code
WHERE country.continent = 'Africa'


-- HackerRank) Asian Population
SELECT SUM(city.population)
FROM city
    INNER JOIN country ON city.countrycode = country.code
WHERE country.continent = 'Asia'


-- HackerRank) Average Population of Each Continent
/*
Given the CITY and COUNTRY tables, 
query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT country.continent
    , FLOOR(AVG(city.population))
FROM city
    INNER JOIN country ON city.countrycode = country.code
GROUP BY country.continent

-- INNER JOIN은 두 테이블의 교집합 값을 출력하니 FROM 뒤에 어느 테이블이 와도 무관
SELECT country.continent, FLOOR(AVG(city.population))
FROM country 
    INNER JOIN city ON country.code = city.countrycode
GROUP BY country.continent

-- 2. OUTER JOIN : INNER JOIN이 아닌 A, B 또는 A-B, B-A를 출력하는 방법
-- LEFT (OUTER) JOIN
-- RIGHT (OUTER) JOIN : 그냥 두 테이블 선언의 위치만 바꿔주면 됨

SELECT * 
FROM Customers
	-- Orders에 레코드가 하나라도 있는 유저들만 출력
	-- INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
    -- Customers 정보를 가져올때 Orders 정보도 같이 가져온다
    LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE OrderID IS NULL -- 한번도 주문하지 않은 고객 정보만 가져오기 


-- LeetCode ) 183. Customers Who Never Order

SELECT * 
FROM Customers
    LEFT JOIN Orders ON Customers.Id = Orders.customerId

/*
{"headers": 
    ["Id", "Name", "Id", "CustomerId"], 
 "values": [
     [1, "Joe", 2, 1], 
     [2, "Henry", null, null], 
     [3, "Sam", 1, 3], 
     [4, "Max", null, null]
 ]}
*/

SELECT customers.name AS Customers
FROM Customers
    LEFT JOIN Orders ON Customers.Id = Orders.customerId
WHERE orders.id IS NULL



-- 3. SELF JOIN : 

-- LeetCode ) 181. Employees Earning More Than Their Managers
-- 상사가 존재하고, 상사보다 돈을 많이 버는 사람만 출력하는 문제 

-- 일단 employee테이블을 manager 테이블로 하나 명명해서, 
--    셀프 INNER JOIN해주고 그 결과값을 반환해보자
SELECT Employee.Name AS employee_name
     , Employee.Salary AS employee_salary
     , Manager.Name AS manager_name
     , Manager.Salary AS manager_salary
FROM Employee
    INNER JOIN Employee as Manager -- employee 테이블를 매니저테이블로 명명해서 셀프조인할 것
        ON Employee.ManageriId = Manager.Id
WHERE employee_salary > manager_salary

-- Answer
SELECT Employee.Name AS employee_name
     , Employee.Salary AS employee_salary
     , Manager.Name AS manager_name
     , Manager.Salary AS manager_salary
FROM Employee
    INNER JOIN Employee as Manager -- employee 테이블를 매니저테이블로 명명해서 셀프조인할 것
        ON Employee.ManageriId = Manager.Id
WHERE employee_salary > manager_salary


-- LeetCode ) 197. Rising Temperature
SELECT today.id AS id
FROM weather AS today
    INNER JOIN weather AS yesterday ON DATE_ADD(yesterday.recordDate, INTERVAL 1 DAY)  = today.recordDate
WHERE today.temperature > yesterday.temperature


-- ## 3. FULL OUTER JOIN : 합집합 - 교집합 
-- MySQL 에서는 FULL OUTER JOIN이 없기 때문에 아래와 같이 UNION으로 해야한다

SELECT * 
FROM Customers 
    LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT * 
FROM Customers 
    RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID


-- LeetCode) 180. Consecutive Number

-- HackerRnak) The Report
