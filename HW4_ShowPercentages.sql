-- HW4_ShowPercentages.sql
-- Given a single SID identifier, display a student's average scores for each assignment, and a single weighted course average.

DELIMITER $

DROP PROCEDURE IF EXISTS ShowPercentages $

CREATE PROCEDURE ShowPercentages(IN id VARCHAR(4))
BEGIN
    -- TODO: do this section
    -- SELECT S.SID, S.LName, S.FName, S.Sec, R.AName
    -- FROM HW4_Student AS S, HW4_RawScore
    -- WHERE S.SID = R.RID;
END $
DELIMITER ;