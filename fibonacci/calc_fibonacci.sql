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
  DECLARE current INT; -- 現在の項のフィボナッチ数。
  DECLARE next INT;    -- 次の項のフィボナッチ数。
  DECLARE buff INT;    -- 「現在の項のフィボナッチ数」を一時退避させるためのバッファ。
  DECLARE i INT;       -- ループのカウンタ変数。
  
  SET current = 0;
  SET next = 1;
  SET buff = 0;
  SET i = 0;

  WHILE i < n DO
    SET buff = current;
    SET current = next;
    SET next = buff + next;
    
    SET i = i + 1;
  END WHILE;

  RETURN(current);
END;
//
​
DELIMITER ;