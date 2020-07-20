DELIMITER //
​
/*
 うるう年であるかを判定する関数。
 https://ja.wikipedia.org/wiki/%E9%96%8F%E5%B9%B4#%E3%82%B0%E3%83%AC%E3%82%B4%E3%83%AA%E3%82%AA%E6%9A%A6
 
 year：4桁の西暦年
 return：うるう年であれば1、それ以外の年は0を返す。
 */
CREATE FUNCTION is_leap_year(year INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
  DECLARE result TINYINT;
  set result = 0;

  IF MOD(year, 4)=0 AND MOD(year, 100)<>0 THEN
    -- 西暦年が4で割り切れる年は(原則として)閏年。
    -- ただし、西暦年が100で割り切れる年は(原則として)平年。
    SET result=1;
  ELSEIF MOD(year, 400)=0 THEN
    -- ただし、西暦年が400で割り切れる年は必ず閏年。
    SET result=1;
  END IF;

  RETURN(result);
END;
//
​
DELIMITER ;