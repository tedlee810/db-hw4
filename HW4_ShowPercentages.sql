-- HW4_ShowPercentages.sql
-- Given a single SID identifier, display a student's average scores for each assignment, and a single weighted course average.

DELIMITER $

DROP PROCEDURE IF EXISTS ShowPercentages $

CREATE PROCEDURE ShowPercentages(IN id VARCHAR(4))
BEGIN
    -- SELECT IFNULL(columnName, 0) AS colName FROM tableName;
    -- SELECT IFNULL(Score, 0) AS Score2 FROM HW4_RawScore;

    -- TODO: figure out how to weigh grades
    -- make a temporary view?

    DROP VIEW IF EXISTS Quizzes;
    DROP VIEW IF EXISTS Exams;

    CREATE VIEW Quizzes AS
    SELECT R.SID, R.AName, R.Score
    FROM HW4_Assignment AS A LEFT OUTER JOIN HW4_RawScore AS R
    ON A.AName = R.AName
    WHERE A.AType = 'QUIZ';

    CREATE VIEW Exams AS
    SELECT R.SID, R.AName, R.Score
    FROM HW4_Assignment AS A LEFT OUTER JOIN HW4_RawScore AS R
    ON A.AName = R.AName
    WHERE A.AType = 'EXAM';

    WITH Percentages AS
        (SELECT R.SID, R.AName, ROUND((100 * IFNULL(R.Score, 0) / PtsPoss), 2) AS Grade
        FROM HW4_RawScore AS R RIGHT OUTER JOIN HW4_Assignment AS A
        ON R.AName = A.AName)
    SELECT S.SID, S.LName, S.FName, S.Sec, R.AName, P.Grade, ROUND( ((SUM(Quizzes.Score) / COUNT(Quizzes.Score)) * 0.4 + (SUM(Exams.Score) / COUNT(Exams.Score)) * 0.6 ), 2 ) AS CourseAvg
    FROM HW4_Student AS S, HW4_RawScore AS R, Percentages AS P, Quizzes, Exams
    WHERE S.SID = R.SID AND Quizzes.SID = S.SID AND Exams.SID = S.SID AND S.SID = id;

    -- CourseAvg for '3774' should be 80.18

END $
DELIMITER ;