-- 政令指定都市テーブルの作成。
CREATE TABLE cities (
  id INT AUTO_INCREMENT comment 'ID',
  name VARCHAR(50) NOT NULL comment '都市名', 
  location geometry NOT NULL comment '市役所の座標',
  note VARCHAR(200) comment '備考',
  PRIMARY KEY (id),
  INDEX name_idx(name),
  INDEX location_idx(location)
)
ENGINE = InnoDB,
default charset=utf8mb4
comment='政令指定都市';