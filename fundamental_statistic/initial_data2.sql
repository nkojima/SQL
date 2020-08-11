-- 八ヶ岳の山データ（initial_data.csv）を高速にINSERTするSQL
-- ※csvファイルは/root以下に保管する。
LOAD DATA LOCAL INFILE '/root/initial_data.csv'
  REPLACE INTO TABLE nkojima.mountain
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\r\n'
  IGNORE 1 lines;