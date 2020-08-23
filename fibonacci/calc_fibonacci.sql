/*
 * 再帰を使わずにフィボナッチ数を求める関数。
 * ※MySQLではストアドファンクションで再帰処理を実行できない。
 *
 * n: フィボナッチ数の式の中の添え字「n」。
 *   F(0) = 0,
 *   F(1) = 1,
 *   F(n+2) = F(n) + F(n+1) (※nが0以上の時）
 * return: フィボナッチ数。
 */
DELIMITER //
CREATE FUNCTION calc_fibonacci(n INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE result INT;
  DECLARE next INT;
  DECLARE temp INT;
  DECLARE i INT;
  
  SET result = 0;
  SET next = 1;
  SET temp = 0;
  SET i = 0;

  WHILE i < n DO
    SET temp = result;
    SET result = next;
    SET next = temp + next;
    
    SET i = i + 1;
  END WHILE;

  RETURN(result);
END;
//
​
DELIMITER ;