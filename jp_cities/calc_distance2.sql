-- 指定した地点から距離の近い順に並べるSQL。
SELECT
  CONCAT(st1.name, '-', st2.name) AS 区間,
  ST_Distance(st1.location, st2.location) / 1000 AS '距離(km)'
FROM
  station AS st1,
  station AS st2
WHERE
  st1.name = '東京'
  AND st1.id != st2.id
ORDER BY
  `距離(km)` ASC;