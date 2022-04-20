-- HW4_ShowAllRawScores.sql
-- Given any valid password in the HW4_passwords table, display a table showing the raw scores for all students in the course.

DELIMITER $

DROP FUNCTION IF EXISTS ShowAllRawScores $

CREATE FUNCTION ShowRawScores(CurPasswords VARCHAR(15)) RETURNS VOID
BEGIN
    -- TODO: fill this section in
    -- SELECT S.SID, S.LName, S.FName, S.Sec
    -- FROM HW4_Student AS S, HW4_RawScore, HW4_Assignment
    -- WHERE
    -- ORDER BY ASC S.Sec, S.LName, S.FName;
END $
DELIMITER ;