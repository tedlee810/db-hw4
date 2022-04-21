-- HW4_ShowRawScores.sql
-- Given a single SID identifier, display that single student's info and raw scores on all assignments in the course.

-- quiz2 is still all NULL, try nested query?

DELIMITER $

DROP PROCEDURE IF EXISTS ShowRawScores $

CREATE PROCEDURE ShowRawScores(IN id VARCHAR(4))
BEGIN
    SELECT X.SID, X.LName, X.FName, X.Sec, X.AName, X.Score
    FROM HW4_Assignment AS A RIGHT OUTER JOIN
        (SELECT S.SID, S.LName, S.FName, S.Sec, R.AName, R.Score
        FROM HW4_Student AS S LEFT OUTER JOIN HW4_RawScore AS R
        ON S.SID = R.SID
        WHERE S.SID = id) AS X
    ON A.AName = X.AName;
END $
DELIMITER ;