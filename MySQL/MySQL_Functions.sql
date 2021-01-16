
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


-- ## MySQL 집계함수

-- COUNT(* 또는 컬럼명) 
-- 특정 컬럼에 NULL값이 들어가 있을때 NULL값을 제외하고 카운트
-- COUNT(DISTINCT 컬럼명) : 중복값 제외하고 카운트

-- AVG() VS SUM()/COUNT(*)
-- AVG() : NULL값을 제외하고 값이 존재하는 컬럼을 카운트해서 총합을 나눔
-- SUM()/COUNT(*) : NULL값 있는 애도 카운트해서(값을 0으로 취급해서) 나누어줌 

-- MIN(), MAX()

SELECT COUNT(Price), AVG(Price) , SUM(Price), MIN(Price), MAX(Price)
FROM Products


-- ## MySQL 시간 더하기 빼기

-- DATE_ADD(기준날짜, INTERVAL 숫자 기준단위)
-- DATE_SUB(기준날짜, INTERVAL 숫자 기준단위)

