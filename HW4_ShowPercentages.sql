-- HW4_ShowPercentages.sql
-- Given a single SID identifier, display a student's average scores for each assignment, and a single weighted course average.

DELIMITER $

DROP PROCEDURE IF EXISTS ShowPercentages $

CREATE PROCEDURE ShowPercentages(IN id VARCHAR(4))
BEGIN
    -- SELECT IFNULL(columnName, 0) AS colName FROM tableName;
    -- SELECT IFNULL(Score, 0) AS Score2 FROM HW4_RawScore;

    -- TODO: figure out how to weigh grades
    -- SELECT S.SID, S.LName, S.FName, S.Sec, R.AName, (Score2 / A.PtsPoss) AS Percentage, () AS CourseAvg
    -- FROM HW4_Student AS S, HW4_RawScore AS R, HW4_Assignment AS A
    -- WHERE S.SID = R.RID AND R.SID = A.SID;
END $
DELIMITER ;