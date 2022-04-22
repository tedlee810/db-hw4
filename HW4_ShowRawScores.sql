-- HW4_ShowRawScores.sql
-- Given a single SID identifier, display that single student's info and raw scores on all assignments in the course.

DELIMITER $

DROP PROCEDURE IF EXISTS ShowRawScores $

CREATE PROCEDURE ShowRawScores(IN id VARCHAR(4))
BEGIN
    SELECT S.SID, S.LName, S.FName, S.Sec, R.AName, R.Score
    FROM HW4_Student AS S LEFT OUTER JOIN HW4_RawScore AS R
    ON S.SID = R.SID
    WHERE S.SID = id;
    -- SELECT X.SID, X.LName, X.FName, X.Sec, X.AName, X.Score
    -- FROM HW4_Assignment AS A RIGHT OUTER JOIN
    --     (SELECT S.SID, S.LName, S.FName, S.Sec, R.AName, R.Score
    --     FROM HW4_Student AS S LEFT OUTER JOIN HW4_RawScore AS R
    --     ON S.SID = R.SID
    --     WHERE S.SID = id) AS X
    -- ON A.AName = X.AName;

    -- SET @sql = NULL;

    -- -- accumulate into the variable named @sql a list of assignment names
    -- -- and expressions to that will get the associated scores, for use 
    -- -- as part of a later query of table HW4_RawScore
    -- SELECT
    --     GROUP_CONCAT(DISTINCT
    --     CONCAT(
    --         'max(case when aname = ''',
    --         aname,
    --         ''' then score end) as ''',aname,''''
    --     )
    --     ORDER BY atype DESC, aname ASC
    --     ) INTO @sql
    -- FROM HW4_Assignment;

    -- -- concatenate the assignment name list and associated expressions
    -- -- into a larger query string so we can execute it, but leave ?
    -- -- in place so we can plug in the specific sid value in a careful way
    -- SET @sql = CONCAT('SELECT sid, ',
    --                     @sql,
    --                     ' FROM HW4_RawScore WHERE sid = ',
    --             '?');

    -- -- alert the server we have a statement shell to set up
    -- PREPARE stmt FROM @sql;

    -- -- now execute the statement shell with a value plugged in for the ?
    -- EXECUTE stmt USING sid;

    -- -- tear down the prepared shell since no longer needed (we won't requery it)
    -- DEALLOCATE PREPARE stmt;
END $
DELIMITER ;