-- 全地点間の距離（※総当たり）を近い順に取得するSQL。
SELECT
  CONCAT(st1.name, '-', st2.name) AS 区間,
  ST_Distance(st1.location, st2.location) / 1000 AS '距離(km)'
FROM
  station AS st1,
  station AS st2
WHERE
  st1.id != st2.id
ORDER BY
  `距離(km)` ASC;