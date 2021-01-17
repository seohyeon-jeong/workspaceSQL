
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


-- HackerRank) Challenges
-- SELECT hacker_id, name, Count(challenges created by each id)
-- sort by count(challenges) DESC
-- IF 같은 숫자의 문제 만든 학생들이 둘이상일 때 만든 문제 개수가 
      --> max(challenges)라면 -> sort by id
      --> max(challenges)보다 적은 수라면 --> exclude those students

SELECT h.hacker_id, h.name, count(*) as challenges_created
FROM challenges as c -- the table we are gonna handle the data mainly
    INNER JOIN hackers as h ON c.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
-- Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column -- 'run_4yogq2qfpob.h.name' which is not functionally dependent on columns in GROUP BY clause

-- group by한 값에 대한 조건식 -> having
-- 조건 1) IF 같은 숫자의 문제 만든 학생들이 둘이상일 때 만든 문제 개수 =  max(challenges)라면 -> sort by id
HAVING challenges_created = (SELECT MAX(challenges_created)
                             FROM (SELECT hacker_id, COUNT(*) AS challenges_created
                                   FROM challenges
                                   GROUP BY hacker_id
                                  ) sub
                             ) 
-- 조건 2) IF 같은 숫자의 문제 만든 학생들이 둘이상일 때 만든 문제 개수 < max(challenges) -> exclude those students
OR challenges_created IN (SELECT challenges_created
                          FROM (SELECT hacker_id, COUNT(*) AS challenges_created
                                FROM challenges
                                GROUP BY hacker_id
                                ) sub
                          GROUP BY challenges_created
                          HAVING COUNT(*) = 1 
                        )
ORDER BY challenges_created DESC, hacker_id ASC

-- MS SQL Server 에서 가능한 쿼리를 저장해서 테이블처럼 활용하는 WITH문
WITH counter AS (
      SELECT hackers.hacker_id
           , hackers.names
           , COUNT(*) AS challenges_created
      FROM challenges
            INNER JOIN hackers ON challenges.hacker_id = hackers.hacker_id
      GROUP BY hackers.hacker_id, hackers.name
)

SELECT counter.hacker_id
     , counter.name
     , counter.challenges_created
FROM counter
WHERE challenges_created = (SELECT MAX(challenges_created)
                            FROM counter)
OR challenges_created IN (SELECT challenges_created
                          FROM counter
                          GROUP BY challenges_created
                          HAVING COUNT(*) = 1)
ORDER BY counter.challenges_created DESC, counter.hacker_id ASC
