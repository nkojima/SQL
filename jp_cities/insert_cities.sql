-- 日本の主要都市のデータ（cities.csv）を高速にINSERTするSQL
-- ※csvファイルはDBサーバー内の/root以下に保管する。
LOAD DATA LOCAL INFILE '/root/cities.csv'
  REPLACE INTO TABLE nkojima.cities
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\r\n'
  IGNORE 1 lines
  (@id, @name, @lat, @lon)
  SET
  id = @id,
  name = @name,
  location = ST_GeomFromText(CONCAT('POINT(', @lat, ' ', @lon, ')'), 4326);