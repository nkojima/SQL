DELIMITER //
​
/*
 うるう年であるかを判定する関数。
 year：4桁の西暦年
 return：うるう年であれば1、それ以外の年は0を返す。
 */
CREATE FUNCTION is_leap_year(year INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
  DECLARE result TINYINT;
  set result = 0;

  IF MOD(year, 4)=0 AND MOD(year, 100)<>0 THEN
    SET result=1;
  ELSEIF MOD(year, 400)=0 THEN
    SET result=1;
  END IF;

  RETURN(result);
END;
//
​
DELIMITER ;