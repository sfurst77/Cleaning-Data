How script does analysis:

lines 1-4 load the packages needed for analysis.
Lines 5-11 load in all the data.
Line 13 designates the variable 'V2' of the features.txt data as the names that will be used for the training data (traindata), which is all the numerical data variables.
Line 14 creates a new variable in traindata called "subject" that references 'trainsubject' (created from "subject_test.txt") to get the subject numbers for each row of data in traindata.
Line 15 creates a new variable in traindata called "activity" that is a factor variable with 6 levels, that references 'trainactivity' (created from y_train.txt) to give descriptive labels to each of the 6 activities for each observation.
Line 17 organizes 'traindata' by moving the 'subject' and 'activity' variables to the first and second column instead of having them at the end.
Line 18 further organizes 'traindata' by using a second order sort to arrange the dataset by subject, and then by activity.
Lines 22-28 do the same thing with the testdata as what we did with the traindata.
Line 30 joins the training and test data sets into one dataset called 'final'.
Lines 31-32 create two new datasets from 'final' that only include the variables with mean() and std() in the name. 
Line 33 joins the 'subject' and 'activity' variables from the original 'final' dataset with the two datasets formed in lines 31-32.
Line 34 writes this 'final' dataset to a file, however it is not included in the final project.
Lines 37-39 take the 'final' dataset and create a 'final2' dataset. Each of the 180 combinations of the subject and activity variables in 'final' are created using the "group_by" function in dplyr, and then it calculates the mean for each of the columns in the 'final' dataset for each row.
Line 41 writes this 'final2' dataset to "final2.txt", which is the dataset included in the final project.

As one can see, final2 has each of the 180 combinations of subject and activity, along with the mean in 'final' for each variable using each of those combinations.
