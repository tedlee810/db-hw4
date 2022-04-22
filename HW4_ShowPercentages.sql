-- HW4_ShowPercentages.sql
-- Given a single SID identifier, display a student's average scores for each assignment, and a single weighted course average.

DELIMITER $

DROP PROCEDURE IF EXISTS ShowPercentages $

CREATE PROCEDURE ShowPercentages(IN id VARCHAR(4))
BEGIN
    DROP VIEW IF EXISTS Quizzes;
    DROP VIEW IF EXISTS Exams;

    CREATE VIEW Quizzes AS
    SELECT R.SID, R.AName, ROUND((IFNULL(R.Score, 0) / A.PtsPoss * 100), 2) AS Score
    FROM HW4_Assignment AS A RIGHT OUTER JOIN HW4_RawScore AS R
    ON A.AName = R.AName
    WHERE A.AType = 'QUIZ';

    CREATE VIEW Exams AS
    SELECT R.SID, R.AName, ROUND((IFNULL(R.Score, 0) / A.PtsPoss * 100), 2) AS Score
    FROM HW4_Assignment AS A RIGHT OUTER JOIN HW4_RawScore AS R
    ON A.AName = R.AName
    WHERE A.AType = 'EXAM';

    -- WITH Percentages AS
    --     (SELECT R.SID, R.AName, ROUND((100 * IFNULL(R.Score, 0) / PtsPoss), 2) AS Grade
    --     FROM HW4_RawScore AS R LEFT OUTER JOIN HW4_Assignment AS A
    --     ON R.AName = A.AName)
    WITH Percentages AS
        (SELECT SID, AName, Score
        FROM Quizzes AS Q, Exams AS E
        ON Q.SID = E.SID)
    SELECT S.SID, S.LName, S.FName, S.Sec, R.AName, P.Grade, ROUND(( (SUM(Quizzes.Score) / COUNT(Quizzes.Score)) * 0.4 + (SUM(Exams.Score) / COUNT(Exams.Score)) * 0.6 ), 2) AS CourseAvg
    FROM HW4_Student AS S LEFT OUTER JOIN HW4_RawScore AS R
    ON S.SID = R.SID,
    Percentages AS P, Quizzes AS Q, Exams AS E
    WHERE P.SID = S.SID AND P.AName = R.AName AND Q.SID = S.SID AND E.SID = S.SID AND S.SID = id
    GROUP BY R.AName;

    -- CourseAvg for '3774' should be 80.18

END $
DELIMITER ;