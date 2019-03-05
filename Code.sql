select A.user_id, 
 CASE
 WHEN B.user_id is null THEN
 'False'
 ELSE
 'True'
 END is_home_try_on,
 
 CASE
 WHEN B.number_of_pairs is null THEN
 'NULL'
 WHEN B.number_of_pairs like '%3%' THEN
 '3'
 ELSE
 '5'
 END number_of_pairs,
 CASE
 WHEN C.user_id is null THEN
 'False'
 ELSE
 'True'
 END is_purchase
 from quiz A
left join home_try_on B On (A.user_id = B.user_id)
left join purchase C On (A.user_id = C.user_id)
limit 10;


SELECT question,
   COUNT(DISTINCT user_id)
FROM survey
GROUP BY question;

"common table expression (CTE) and subquery factoring"



with funnel as (
select A.user_id, 
 CASE
 WHEN B.user_id is null THEN
 'False'
 ELSE
 'True'
 END is_home_try_on,
 
 CASE
 WHEN B.number_of_pairs is null THEN
 'NULL'
 WHEN B.number_of_pairs like '%3%' THEN
 '3'
 ELSE
 '5'
 END number_of_pairs,
 CASE
 WHEN C.user_id is null THEN
 'False'
 ELSE
 'True'
 END is_purchase
 from quiz A
left join home_try_on B On (A.user_id = B.user_id)
left join purchase C On (A.user_id = C.user_id)
)
select count(user_id), number_of_pairs, is_purchase
from funnel
group by number_of_pairs, is_purchase
limit 10;