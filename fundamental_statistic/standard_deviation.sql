-- 標準偏差を求めるSQL

-- 1. インラインビューで平均値を求める。
-- 2. 「平均値からの差の2乗」の平均値で分散を求める。
SELECT
  AVG(
    POW(T1.altitude-T2.avg_alt, 2)
  ) AS 分散
INTO
  @variance
FROM
  mountain T1,
  (
    SELECT
      AVG(altitude) AS avg_alt
    FROM
      mountain
  ) AS T2;

-- 3. 分散の平方根を求める。
SELECT SQRT(@variance) AS 標準偏差;