-- 指定した地点間の距離を求めるSQL。
SELECT
  CONCAT(T1.name, '-', T2.name) AS 区間,
  ST_Distance(T1.location, T2.location) / 1000 AS '距離(km)'
FROM
  cities AS T1,
  cities AS T2
WHERE
  T1.name = '仙台'
  AND T2.name = '名古屋';