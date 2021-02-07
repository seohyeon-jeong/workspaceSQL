
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



