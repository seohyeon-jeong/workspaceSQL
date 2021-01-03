-- CASE : 조건문 

SELECT CASE
			WHEN categoryid = 1 THEN 'DRINK'
            WHEN categoryid = 2 THEN 'SEASONING'
            ELSE 'etc'
       END AS 'categoryName', *
FROM Products


-- CASE문의 output으로 그룹핑해서 (그에 따른 평균가격을 )보는 방법 : 
--      SELECT문에 반환하는 컬럼명 값에 케이스문 넣고 그걸 명칭화해서 GROUP BY뒤에 할당해주기  
SELECT CASE
			WHEN categoryid = 1 THEN 'DRINK'
            WHEN categoryid = 2 THEN 'SEASONING'
            ELSE 'etc'
       END AS new_category
	, AVG(Price)
FROM Products
GROUP BY new_category


-- HackerRank) Type of Triangle

/*
    Equilateral : 정삼각형은 각 변의 길이가 같게 하면 됨 -> 이 경우는 삼각형의 성립조건을 만족함
    Isoceles : 두변의 길이가 같다 -> 이걸로는 삼각형의 성립조건을 만족하지 못함
                삼각형의 성립조건을 만족하고, 두변의 길이가 같다!
    Scalene : 정삼각형도 아니고, 이등변삼각형도 아니지만 삼각형의 조건만 만족한다. 
*/

SELECT CASE 
            -- WHEN MAX(A,B,C) > SUM(A,B,C)-MAX(A,B,C) THEN 'Not a Triangle'
            -- MAX는 괄호 안의 컬럼에 있는 행값중 최대값을 반환한다, SUM도 마찬가지. 그러니 아래처럼 풀어써줄것
            WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
            WHEN A=B AND A=C THEN 'Equilateral'       
            WHEN A=B OR B=C OR A=C THEN 'Isosceles'
            ELSE 'Scalene'
        END
FROM triangles
