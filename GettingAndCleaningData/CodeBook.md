###
### Coursera: Getting and Cleaning Data Course - Programming Assignment - CodeBook.md
###

The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc.XYZ and tGyro.XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc.XYZ and tGravityAcc.XYZ) using another low pass  filter.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk.XYZ and tBodyGyroJerk.XYZ).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc.XYZ, fBodyAccJerk.XYZ, fBodyGyro.XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: '.XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

#### Code Book for the file __final_merged.txt__

All the measurements (except for the subject and activity) are either mean (feature labels with Mean) or standard deviation (feature labels with Std).

1. subject (numeric)
2. activity (character) - with values `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`
3. tBodyAccMean.X (numeric)
4. tBodyAccMean.Y (numeric)
5. tBodyAccMean.Z (numeric)
6. tBodyAccStd.X (numeric)
7. tBodyAccStd.Y (numeric)
8. tBodyAccStd.Z (numeric)
9. tGravityAccMean.X (numeric)
10. tGravityAccMean.Y (numeric)
11. tGravityAccMean.Z (numeric)
12. tGravityAccStd.X (numeric)
13. tGravityAccStd.Y (numeric)
14. tGravityAccStd.Z (numeric)
15. tBodyAccJerkMean.X (numeric)
16. tBodyAccJerkMean.Y (numeric)
17. tBodyAccJerkMean.Z (numeric)
18. tBodyAccJerkStd.X (numeric)
19. tBodyAccJerkStd.Y (numeric)
20. tBodyAccJerkStd.Z (numeric)
21. tBodyGyroMean.X (numeric)
22. tBodyGyroMean.Y (numeric)
23. tBodyGyroMean.Z (numeric)
24. tBodyGyroStd.X (numeric)
25. tBodyGyroStd.Y (numeric)
26. tBodyGyroStd.Z (numeric)
27. tBodyGyroJerkMean.X (numeric)
28. tBodyGyroJerkMean.Y (numeric)
29. tBodyGyroJerkMean.Z (numeric)
30. tBodyGyroJerkStd.X (numeric)
31. tBodyGyroJerkStd.Y (numeric)
32. tBodyGyroJerkStd.Z (numeric)
33. tBodyAccMagMean (numeric)
34. tBodyAccMagStd (numeric)
35. tGravityAccMagMean (numeric)
36. tGravityAccMagStd (numeric)
37. tBodyAccJerkMagMean (numeric)
38. tBodyAccJerkMagStd (numeric)
39. tBodyGyroMagMean (numeric)
40. tBodyGyroMagStd (numeric)
41. tBodyGyroJerkMagMean (numeric)
42. tBodyGyroJerkMagStd (numeric)
43. fBodyAccMean.X (numeric)
44. fBodyAccMean.Y (numeric)
45. fBodyAccMean.Z (numeric)
46. fBodyAccStd.X (numeric)
47. fBodyAccStd.Y (numeric)
48. fBodyAccStd.Z (numeric)
49. fBodyAccJerkMean.X (numeric)
50. fBodyAccJerkMean.Y (numeric)
51. fBodyAccJerkMean.Z (numeric)
52. fBodyAccJerkStd.X (numeric)
53. fBodyAccJerkStd.Y (numeric)
54. fBodyAccJerkStd.Z (numeric)
55. fBodyGyroMean.X (numeric)
56. fBodyGyroMean.Y (numeric)
57. fBodyGyroMean.Z (numeric)
58. fBodyGyroStd.X (numeric)
59. fBodyGyroStd.Y (numeric)
60. fBodyGyroStd.Z (numeric)
61. fBodyAccMagMean (numeric)
62. fBodyAccMagStd (numeric)
63. fBodyBodyAccJerkMagMean (numeric)
64. fBodyBodyAccJerkMagStd (numeric)
65. fBodyBodyGyroMagMean (numeric)
66. fBodyBodyGyroMagStd (numeric)
67. fBodyBodyGyroJerkMagMean (numeric)
68. fBodyBodyGyroJerkMagStd (numeric)

#### Code Book for the file __final_summary.txt__

All the measurements (except for the subject and activity) are averages (hence the suffix .Avg) of the mean (feature labels with Mean) or standard deviation (feature labels with Std).

1. subject (numeric)
2. activity (character) - with values `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`
3. tBodyAccMean.X.Avg (numeric)
4. tBodyAccMean.Y.Avg (numeric)
5. tBodyAccMean.Z.Avg (numeric)
6. tBodyAccStd.X.Avg (numeric)
7. tBodyAccStd.Y.Avg (numeric)
8. tBodyAccStd.Z.Avg (numeric)
9. tGravityAccMean.X.Avg (numeric)
10. tGravityAccMean.Y.Avg (numeric)
11. tGravityAccMean.Z.Avg (numeric)
12. tGravityAccStd.X.Avg (numeric)
13. tGravityAccStd.Y.Avg (numeric)
14. tGravityAccStd.Z.Avg (numeric)
15. tBodyAccJerkMean.X.Avg (numeric)
16. tBodyAccJerkMean.Y.Avg (numeric)
17. tBodyAccJerkMean.Z.Avg (numeric)
18. tBodyAccJerkStd.X.Avg (numeric)
19. tBodyAccJerkStd.Y.Avg (numeric)
20. tBodyAccJerkStd.Z.Avg (numeric)
21. tBodyGyroMean.X.Avg (numeric)
22. tBodyGyroMean.Y.Avg (numeric)
23. tBodyGyroMean.Z.Avg (numeric)
24. tBodyGyroStd.X.Avg (numeric)
25. tBodyGyroStd.Y.Avg (numeric)
26. tBodyGyroStd.Z.Avg (numeric)
27. tBodyGyroJerkMean.X.Avg (numeric)
28. tBodyGyroJerkMean.Y.Avg (numeric)
29. tBodyGyroJerkMean.Z.Avg (numeric)
30. tBodyGyroJerkStd.X.Avg (numeric)
31. tBodyGyroJerkStd.Y.Avg (numeric)
32. tBodyGyroJerkStd.Z.Avg (numeric)
33. tBodyAccMagMean.Avg (numeric)
34. tBodyAccMagStd.Avg (numeric)
35. tGravityAccMagMean.Avg (numeric)
36. tGravityAccMagStd.Avg (numeric)
37. tBodyAccJerkMagMean.Avg (numeric)
38. tBodyAccJerkMagStd.Avg (numeric)
39. tBodyGyroMagMean.Avg (numeric)
40. tBodyGyroMagStd.Avg (numeric)
41. tBodyGyroJerkMagMean.Avg (numeric)
42. tBodyGyroJerkMagStd.Avg (numeric)
43. fBodyAccMean.X.Avg (numeric)
44. fBodyAccMean.Y.Avg (numeric)
45. fBodyAccMean.Z.Avg (numeric)
46. fBodyAccStd.X.Avg (numeric)
47. fBodyAccStd.Y.Avg (numeric)
48. fBodyAccStd.Z.Avg (numeric)
49. fBodyAccJerkMean.X.Avg (numeric)
50. fBodyAccJerkMean.Y.Avg (numeric)
51. fBodyAccJerkMean.Z.Avg (numeric)
52. fBodyAccJerkStd.X.Avg (numeric)
53. fBodyAccJerkStd.Y.Avg (numeric)
54. fBodyAccJerkStd.Z.Avg (numeric)
55. fBodyGyroMean.X.Avg (numeric)
56. fBodyGyroMean.Y.Avg (numeric)
57. fBodyGyroMean.Z.Avg (numeric)
58. fBodyGyroStd.X.Avg (numeric)
59. fBodyGyroStd.Y.Avg (numeric)
60. fBodyGyroStd.Z.Avg (numeric)
61. fBodyAccMagMean.Avg (numeric)
62. fBodyAccMagStd.Avg (numeric)
63. fBodyBodyAccJerkMagMean.Avg (numeric)
64. fBodyBodyAccJerkMagStd.Avg (numeric)
65. fBodyBodyGyroMagMean.Avg (numeric)
66. fBodyBodyGyroMagStd.Avg (numeric)
67. fBodyBodyGyroJerkMagMean.Avg (numeric)
68. fBodyBodyGyroJerkMagStd.Avg (numeric)
