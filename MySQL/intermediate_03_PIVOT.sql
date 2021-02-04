
-- ## Data PIVOTING

/*
-- output example
categoryId AVG(Price)
1           3.5
2           70.9
3           80

categoryId1_avg categoryId2_avg categoryId3_avg
3.5             70.9            80
*/


SELECT
        AVG(
            CASE 
			          WHEN categoryid = 1 THEN price
                ELSE NULL 
            END
        ) AS category1_avg
        -- categoryid가 1인 경우에만 해당하는 행의 가격을 넣고, 그외엔 null을 넣어준다 

      , AVG(
            CASE 
			          WHEN categoryid = 2 THEN price
                ELSE NULL
            END
        ) AS category2_avg
      , AVG(
            CASE 
			          WHEN categoryid = 3 THEN price
                ELSE NULL
            END
        ) AS category3_avg      
FROM Products 


-- LeetCode) 1179. Reformat Department Table
-- id, id별로 그룹핑한 Revenue를 Jan ~ Dec까지 표기 -> 13개의 컬럼 
SELECT id 
  , SUM(CASE WHEN month = 'Jan' THEN revenue ELSE NULL END) AS Jan_Revenue
  , SUM(CASE WHEN month = 'Feb' THEN revenue ELSE NULL END) AS Feb_Revenue
  , SUM(CASE WHEN month = 'Mar' THEN revenue ELSE NULL END) AS Mar_Revenue
  , SUM(CASE WHEN month = 'Apr' THEN revenue ELSE NULL END) AS Apr_Revenue
  , SUM(CASE WHEN month = 'May' THEN revenue ELSE NULL END) AS May_Revenue
  , SUM(CASE WHEN month = 'Jun' THEN revenue ELSE NULL END) AS Jun_Revenue
  , SUM(CASE WHEN month = 'Jul' THEN revenue ELSE NULL END) AS Jul_Revenue
  , SUM(CASE WHEN month = 'Aug' THEN revenue ELSE NULL END) AS Aug_Revenue
  , SUM(CASE WHEN month = 'Sep' THEN revenue ELSE NULL END) AS Sep_Revenue
  , SUM(CASE WHEN month = 'Oct' THEN revenue ELSE NULL END) AS Oct_Revenue
  , SUM(CASE WHEN month = 'Nov' THEN revenue ELSE NULL END) AS Nov_Revenue
  , SUM(CASE WHEN month = 'Dec' THEN revenue ELSE NULL END) AS Dec_Revenue
FROM department
GROUP BY id
