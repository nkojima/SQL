-- 最大値・最小値・平均値を求めるSQL
SELECT
  AVG(altitude) AS 平均値,
  MAX(altitude) AS 最大値,
  MIN(altitude) AS 最小値
FROM
  mountain;