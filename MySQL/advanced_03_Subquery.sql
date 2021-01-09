
-- FROM 절 Subquery
SELECT daily_stats.week
     , AVG(daily_stats.incidents_only)
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
-- 테이블에서 가지고 있는 최초의 일자의 레코드 조회

SELECT *
FROM crimes
WHERE date IN (SELECT date FROM crimes ORDER BY date DESC LIMIT 5)
-- 최근에 5일동안 발생했던 모.든. 레코드 조회 

