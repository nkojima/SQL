-- 山情報テーブルの作成。
CREATE TABLE mountain (
  id INT AUTO_INCREMENT comment '山ID',
  name VARCHAR(50) NOT NULL comment '山名', 
  altitude double NOT NULL comment '標高',
  note VARCHAR(200) comment '備考',
  PRIMARY KEY (id),
  INDEX name_idx(name)
)
ENGINE = InnoDB,
default charset=utf8mb4
comment='山情報';