-- DML : Data Manipulation Language 데이터 조작어
-- SELECT, INSERT, UPDATE, DELETE

-- 테이블 안의 데이터 타입 확인 : DESC (Describe statement)
DESC salary 

-- Insert : 새로운 데이터 값 추가
-- 1. 테이블 전체에 데이터를 추가하는 방법
-- INSERT INTO 테이블명 VALUES (Value_list); -- 컬럼 순서대로 입력
INSERT INTO salary VALUES ('1', 'A', '250', '2020-03-31');

-- 2. 값을 저장할 열 지정하기
-- INSERT INTO 테이블명 (column_list) VALUES (value_list)
INSERT INTO salary (Id, Salary) VALUES ('2', '550');

-- UPDATE : 기존의 값을 수정
-- 1. 컬럼 전체에 데이터 업데이트
--  UPDATE 테이블명 SET 컬럼 = 값; 
UPDATE salary SET salary = salary + 100;

-- 2. 특정 컬럼의 지정 행의 값 갱신하기
-- UPDATE 테이블명 SET 컬럼 = 값 WHERE 조건식;
UPDATE salary SET salary = salary + 100 WHERE id = 2;

UPDATE 테이블명
SET 컬럼명 = CASE 
                WHEN condition1 THEN value_if_condition1_true
                WHEN condition2 THEN value_if_condition2_true
            ELSE value_other_case
(WHERE 조건식);  

-- LeetCode) 627. Swap Salary
UPDATE salary 
SET sex = CASE
            WHEN sex = 'f' THEN 'm'
            WHEN sex = 'm' THEN 'f'
          END

-- 3. DELETE 
-- 1. 테이블 전체에 데이터를 삭제
DELETE FROM 테이블명; -- DELETE 뒤의 FROM은 생략가능
DELETE FROM salary;

-- 2. 지정 행만 삭제
DELETE FROM 테이블명 WHERE 조건식; 
DELETE FROM salary WHERE id = 2;


-- 3. DELECT에 JOIN을 사용해서 관련되는 행을 한번에 삭제
CREATE TABLE t1(
    id  INT PRIMARY KEY
)

CREATE TABLE t2(
    id  VARCHAR(20) NOT NULL
    ,ref INT         NOT NULL
    PRIMARY KEY(id)
)

-- t1.id가 1인 경우에 t1, t2에 해당하는 값을 한번에 삭제해주기 
DELETE t1, t2
FROM t1
INNER JOIN t2 ON t1.id = t2.ref
WHERE t1.id = 1;

DELETE t2 -- t1과 연관있는 t2만 삭제 
FROM t1
INNER JOIN t2 ON t1.id = t2.ref
WHERE t1.id = 1;

-- LeetCode) 196. Delete Duplicate Emails

-- SubQuery를 활용한 답 
DELETE
FROM person
WHERE Id NOT IN (
    -- email단위로 grouping해서 그 email을 갖는 최초의 id와 이메일을 출력
    SELECT sub.min_id
    FROM (
        SELECT Email, MIN(Id) AS min_id
        FROM person
        GROUP BY Email
    ) sub
)

-- DELETE문에 (self)JOIN을 활용한 답
/* 
-- SELF-JOIN
SELECT *
FROM person p1
    INNER JOIN person p2 ON p1.Email = p2.Email
    
p1.Id   p1.Email            p2.Id   p2.Email
1       john@example.com    1       john@exmple.com
1       john@example.com    3       john@exmaple.com
2       bob@exmaple.com     2       bob@example.com
3       john@exmaple.com    1       john@example.com
3       john@example.com    3       john@exmaple.com

*/
DELETE p1
FROM person p1
    INNER JOIN person p2 ON p1.Email = p2.Email
WHERE p1.Id > p2.Id 

/* 
p1과 p2가 JOIN한 테이블에서 WHERE p1.Id > p2.Id로 필터링을 하게 되면 아래 값이 나오고
p1.Id    p1.Email           p2.Id       p2.Email
3        john@example.com   1           john@example.com 

DELETE문은 p1을 기준으로 하고 있기 때문에 person 테이블에서 id가 3인 데이터를 삭제하게 된다.

참고) 
https://www.mysqltutorial.org/mysql-delete-join/
*/

