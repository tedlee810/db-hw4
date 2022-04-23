-- HW4_ShowAllCourseAverages.sql
-- Given any valid password in the HW4_passwords table, display a full table of summary data for all students in the course.

DELIMITER $

DROP PROCEDURE IF EXISTS ShowAllCourseAverages $

CREATE PROCEDURE ShowAllCourseAverages(IN pw VARCHAR(15))
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

    WITH Percentages AS
        (SELECT R.SID, R.AName, ROUND((100 * IFNULL(R.Score, 0) / PtsPoss), 2) AS Grade
        FROM HW4_RawScore AS R LEFT OUTER JOIN HW4_Assignment AS A
        ON R.AName = A.AName)
    SELECT S.SID, S.LName, S.FName, S.Sec, ROUND(( (SUM(Q.Score) / COUNT(Q.Score)) * 0.4 + (SUM(E.Score) / COUNT(E.Score)) * 0.6 ), 2) AS CourseAvg
    FROM HW4_Student AS S LEFT OUTER JOIN HW4_RawScore AS R
    ON S.SID = R.SID,
    Percentages AS P, HW4_Password AS Pass, Quizzes AS Q, Exams AS E
    WHERE P.SID = S.SID AND P.AName = R.AName AND Q.SID = S.SID AND E.SID = S.SID AND Pass.CurPasswords = pw
    GROUP BY R.SID
    ORDER BY S.Sec ASC, CourseAvg DESC, S.LName ASC, S.FName ASC;
END $
DELIMITER ;