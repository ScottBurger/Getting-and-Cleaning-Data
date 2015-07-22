This codebook details the variables created and stored by my script.

x_train
	this is a 561 column dataframe of 7353 rows of observations from the raw UCI data
	
x_test
	same format as train data, but test
	
xmerge
	simply the train data with the test data appended at the bottom
	
y_train
	these are the activity types in labels of 1 through 6
	
y_test
	same format as y_train data, but test
	
ymerge
	the y_train data with the t_test data appended at the bottom
	
subject_train
	the subject data in train form
	
subject_test
	subject data in test form
	
smerge
	train subject data with test subject data appended at the bottom
	
features
	table of features data provided from the UCI dataset
	
features_mean_std
	the raw features data filtered by keywords including "mean" and "std"
	
xkeep
	these are the merged x data filtered by the "mean" and "std" keywords
	
activity_labels
	the raw activity labels from the UCI dataset
	
ymerge_activity_join
	the merged y data joined with the x data filtered by "mean" and "std" keywords
	
full_merge
	the column-based merging of the subject data, the activity data, and the raw observations
	
groupmeans
	the full_merge data summarized by the mean of each column that there is observational data for, ignoring the two grouped-by columns: subject and activity