-- 中央値を求めるSQL

-- 1. データの個数を求める。
SELECT COUNT(*) INTO @row_count FROM mountain;

-- 2. offset値とlimit値を取得する。
-- データの個数が奇数の時：中央値は「昇順に並べた際の順位が中央となる値」とする。
-- データの個数が偶数の時：中央値は「中央の前後のレコードの件数の平均値」とする。
SET @offset = 0;
SET @limit = 0;
SELECT 
  CASE WHEN @row_count % 2 = 0 THEN
    FLOOR( @row_count / 2 ) - 1
  ELSE
    FLOOR( @row_count / 2 )
  END INTO @offset
FROM dual;

SELECT 
  CASE WHEN @row_count % 2 = 0 THEN
    2
  ELSE
    1
  END INTO @limit
FROM dual;

-- 3. PreparedStatementにオフセット値をバインドして実行する。
PREPARE
  pstmt_median
FROM
  'SELECT
     AVG(temp.altitude) AS 中央値
   FROM
     (select altitude from mountain order by altitude asc limit ? offset ?) AS temp';
EXECUTE pstmt_median USING @limit, @offset;