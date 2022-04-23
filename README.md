Ted Lee
tlee144

Databases
Homework 4

In this README, I will talk about an issue with my implementation. While most of it seems to be working, there are some factors that couldn't be implemented. The first is displaying the null values in the tables, particularly with the assignments not appearing (even as a null value), for instance when joining HW4_Student and HW4_RawScore in HW4_ShowRawScores.sql. I attempted to use LEFT OUTER JOIN to try and fix this, but it seemed to have no effect; this also seemed to confuse the CAs, as well. I couldn't figure out a proper workaround, so I left it as is in the implementations of all SQL files. I acknowledge that this, of course, skews with the results when averaging the scores (making averages potentially higher since it treats scores of zeros as not existing), as the formula to calculate the weighted average completely skips the nonexistent assignment. However, I still wrote the code in HW4_ShowPercentages.sql and HW4_ShowAllCourseAverages.sql as if they still accounted for potential null values as 0.