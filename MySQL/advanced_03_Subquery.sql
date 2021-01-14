
-- SELECT 절 Subquery : 누적합을 다룰 때 주로 사용

-- FROM 절 Subquery : 가상의 테이블을 하나 더 만드는 경우 
SELECT daily_stats.week
     , AVG(daily_stats.incidents_only) 
     -- date가 없는 경우가 있으면 주의해야한다 나누는 값이 값이 있는 일자의 수가 되기 때문
FROM (
      SELECT week
            , date
            , COUNT(incident_id) AS incidents_daily
      FROM crimes
      GROUP BY week, date
    ) daily_stats -- crime 테이블에 SELECT 문을 이용해 subquery를 만들고 이름을 daily_stats로 명명
GROUP BY daily_stats.week

-- WHERE 절 Subquery
SELECT * 
FROM crimes
WHERE date = (SELECT MIN(date) FROM crimes) 
      -- WHERE x = a : a에 넣어줄 값은 반드시 단일 값이어야한다. 
-- 테이블에서 가지고 있는 최초의 일자의 레코드 조회

SELECT *
FROM crimes
WHERE date IN (SELECT date FROM crimes ORDER BY date DESC LIMIT 5)
-- 최근에 5일동안 발생했던 모.든. 레코드 조회 


-- HackerRank) TOP Earners
SELECT months * salary AS earnings, count(*)
FROM employee
WHERE months * salary = (SELECT MAX(months*salary) FROM employee)
-- WHERE문에는 SELECT에서 쓴 Alias 사용 불가
GROUP BY earnings

SELECT salary * months AS earnings, count(*)
FROM employee
GROUP BY earnings
ORDER BY earnings DESC 
LIMIT 1 

SELECT months * salary AS earnings, COUNT(*)
FROM employee
GROUP BY earnings
-- GROUP BY 한 결과에 대한 조건 추가 :  
HAVING earnings = (SELECT MAX(months*salary) FROM employee) 

-- LeetCode) 184. Department Highest Salary
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM employee AS e
    INNER JOIN (
        SELECT departmentId, MAX(salary) AS max_salary
        FROM employee
        GROUP BY departmentId        
    ) AS dh ON e.departmentId = dh.departmentId
            AND e.salary = dh.max_salary
    INNER JOIN department AS d ON e.departmentId = d.Id
-- ORDER BY d.name