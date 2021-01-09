-- DML : Data Manipulation Language

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
DELETE FROM 테이블명;
DELETE FROM salary;

-- 2. 지정 행만 삭제
DELETE FROM 테이블명 WHERE 조건식; 
DELETE FROM salary WHERE id = 2;

-- LeetCode) 196. Delete Duplicate Emails
DELETE 
FROM person 
where id NOT IN (
    -- email단위로 grouping해서 그 email을 갖는 최초의 id와 이메일을 출력
    SELECT email, MIN(id)
    FROM person
    GROUP BY email
)