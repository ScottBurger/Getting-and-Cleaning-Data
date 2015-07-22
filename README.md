# Getting-and-Cleaning-Data

Hi there and thanks for evaluating my assignment!

For the run_analysis.R script to work, you should drop it into the directory that the UCI HAR Dataset is in, then run it from there.

The script works by first reading the test and train data for each x,y, and subject, then merges them appropriately (ie, loads x_train, then x_test, then merges the two by rows).

Then I read in the features.txt file and extract only the ones that include the keywords "mean" and "std". With the merged x data, I then filter on those extracted keywords to get only the values that we are interested in taking the mean of later. I then add the column names from the same features.txt file.

I then add some more column labels to some data for joining purposes. I join the merged y data with the data from the activity_labels.txt file. This introduces an extra column of activity labels which I then remove.

With the fully merged data, I then tell R to group it first by subject, then by activity. I then pass that data into the summarise_each() function, specifying that I want the mean() to be calculated across all columns except the two that are being grouped by.

Finally I write the table to a file in the working directory called "tidy.txt".
