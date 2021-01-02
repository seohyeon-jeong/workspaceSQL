
-- MySQL은 대소문자 구분이 없다.

SELECT * 
FROM Customers
-- WHERE countryName < 'b'

-- WHERE country LIKE '%r%'
-- LIKE 보다는 = 이 더 빠르니 정확한 경우에는 = 써주기 
-- WHERE country LIKE 'B______' -- 특정 문자의 개수를 _로 표기 

-- WHERE discount LIKE '50\%'
-- WHERE discount LIKE '__\%' -- 2자리 퍼센트 찾기 
-- % 자체를 예약어가 아닌 문자로 사용하고 싶은 경우(=escape)에는 \%로 역슬레시 추가

-- WHERE country =  'Germany' OR country = 'France'
-- WHERE country IN ('Germany', 'France')

-- WHERE customerID BETWEEN 3 AND 5
-- WHERE customerID >= 3 AND customerID <=5

-- WHERE customerID IS NULL
-- NULL, NaN (Not a Number)

-- LIMIT은 가장 마지막에서 반환할 값의 개수의 MAX를 지정한다
-- LIMIT 10

-- SELECT DISTINCT ~ -- 중복값 제외 