-- HW4_ShowAllCourseAverages.sql
-- Given any valid password in the HW4_passwords table, display a full table of summary data for all students in the course.

DELIMITER $

DROP FUNCTION IF EXISTS ShowAllRawScores $

CREATE FUNCTION ShowRawScores(CurPasswords VARCHAR(15)) RETURNS VOID
BEGIN
    -- TODO: fill this section in
    -- SELECT S.SID, S.LName, S.FName, S.Sec, CourseAvg
    -- FROM
    -- WHERE
    -- ORDER BY S.Sec ASC, CourseAvg DEC, S.LName ASC, S.FName ASC;
END $
DELIMITER ;