
/* Top Competitors
SELECT (respective hacker_id), (name of hakers achieved full scores for more than one challenge)
FROM 
ORDER BY (total number of challenges in which the hacker earned a full score) DESC
-- If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
*/

SELECT h.hacker_id, h.name
FROM submissions s
    INNER JOIN challenges c ON s.challenge_id = c.challenge_id
    INNER JOIN difficulty d ON c.difficulty_level = d.difficulty_level 
    INNER JOIN hackers h    ON s.hacker_id = h.hacker_id
    -- 해당 레벨 문제에서 FULL Score 얻은 경우 골라내기 
    -- 테이블 상에서 레벨이 동등한 시험의 기록에서 최대점수 = 기록점수인 경우 추출
WHERE s.score = d.score AND c.difficulty_level = d.difficulty_level
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ASC

-- submission_id, hacker_id, challenge_id, score 
-- / challenge_id, hacker_id, difficult_level
-- / difficult_level, score
-- / hacker_id, name
-- 43954 40226 69855 40 / 69855 48984 3 / 3 40 40226 Anna 


/* Ollivander's Inventory
Buy a wand with minimum num of gold, each non evil wand of high power and age

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, 
sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

SELECT id, age, coins_needed, power of wnads
ORDER BY power DESC, age DESC

Wands : id, code, coins_needed, power
Wands_Property : code, age, is_evil

*/

SELECT w.id, p.age, w.coins_needed, w.power
FROM wands as w
    INNER JOIN wands_property as p ON w.code = p.code
WHERE p.is_evil = 0 AND coins_needed = (SELECT MIN(coins_needed) 
                                        FROM wands as w1 
                                            INNER JOIN wands_property p1 ON w1.code = p1.code
                                        WHERE w1.power = w.power AND p1.age = p.age
                                       )
ORDER BY w.power DESC, p.age DESC

