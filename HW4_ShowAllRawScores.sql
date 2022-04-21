-- HW4_ShowAllRawScores.sql
-- Given any valid password in the HW4_passwords table, display a table showing the raw scores for all students in the course.

DELIMITER $

DROP PROCEDURE IF EXISTS ShowAllRawScores $

CREATE PROCEDURE ShowAllRawScores(IN pass VARCHAR(15))
BEGIN
    -- TODO: fill this section in
    SELECT S.SID, S.LName, S.FName, S.Sec, R.Score
    FROM HW4_Password AS P, HW4_Student AS S LEFT OUTER JOIN HW4_RawScore AS R
    ON S.SID = R.SID
    WHERE P.CurPasswords = pass
    ORDER BY S.Sec ASC, S.LName ASC, S.FName ASC;
END $
DELIMITER ;