
-- MySQL은 대소문자 구분이 없다.

SELECT * 
FROM Customers
-- WHERE countryName < 'B' -- 문자의 대소문자 구분한다 (대문자 - 소문자 순)
    -- 알파벳 순서에 따라 문자 'B'이전의 데이터들만 검색 (즉 'A'로 시작하는 모든 데이터가 검색됨)

-- WHERE country LIKE '%r%'
-- LIKE 보다는 = 이 더 빠르니 정확한 경우에는 = 써주기 
-- WHERE country LIKE 'B______' -- 특정 문자의 개수를 _로 표기 

-- WHERE discount LIKE '50\%'
-- WHERE discount LIKE '__\%' -- 2자리 퍼센트 찾기 
-- % 자체를 예약어가 아닌 문자로 사용하고 싶은 경우(=escape)에는 \%로 역슬레시 추가

-- WHERE country NOT LIKE 'an%' -- an으로 시작하지 않는~ 

-- WHERE country =  'Germany' OR country = 'France'
-- WHERE country IN ('Germany', 'France')

-- WHERE customerID BETWEEN 3 AND 5
-- WHERE customerID >= 3 AND customerID <=5

-- WHERE customerID IS NULL
-- NULL, NaN (Not a Number)

-- LIMIT은 가장 마지막에서 반환할 값의 개수의 MAX를 지정한다
-- LIMIT 10

-- SELECT DISTINCT ~ -- 중복값 제외 
-- SELECT DISTINCT country FROM Customers

-- WHERE customerID <> 1 -- 특정 값 제외 

-- HackerRank) Weather Observation Station 12
-- Query the list of CITY names from STATION that do not start with vowels 
--       and do not end with vowels. Your result cannot contain duplicates.


SELECT DISTINCT city 
FROM station 
WHERE city NOT LIKE 'a%'
AND city NOT LIKE 'e%'
AND city NOT LIKE 'i%'
AND city NOT LIKE 'o%'
AND city NOT LIKE 'u%'
AND city NOT LIKE '%a'
AND city NOT LIKE '%e'
AND city NOT LIKE '%i'
AND city NOT LIKE '%o'
AND city NOT LIKE '%u'

SELECT DISTINCT city 
FROM station 
WHERE city regexp '^[^aeiou].*[^aeiou]$'

-- WHERE city regexp '^[   ].*[   ]$'

/*
HackerRank) Weather Observation Station 6
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/

SELECT DISTINCT city 
FROM station
WHERE city regexp '^[aeiou].*'

/*
HackerRank) Weather Observation Station 7
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
*/
SELECT DISTINCT city 
FROM station
WHERE city regexp '.*[aeiou]$'


/*
HackerRank) Weather Observation Station 8
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
*/
SELECT DISTINCT city
FROM station
WHERE city regexp '^[aeiou].*[aeiou]$'


/*
HackerRank) Weather Observation Station 9
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
*/

SELECT DISTINCT city 
FROM station
WHERE city regexp '^[^aeiou].*'

/*
HackerRank) Weather Observation Station 10
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/

SELECT DISTINCT city 
FROM station
WHERE city regexp '[^aeiou]$' -- '.*[^aeiou]$'


/*
HackerRank) Weather Observation Station 11
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
*/

SELECT DISTINCT city
FROM station
WHERE city regexp '^[^aeiou]|[^aeiou]$'

-- city RLIKE "^[^aieou]|.*[^aeiou]$"