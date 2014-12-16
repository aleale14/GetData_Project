List of variables used and transformations implemented:

	-	T_Activities:	activity labels imported from activity_labels.txt file
	-	T_features:		features imported from features.txt file
	-	T_Sub_test:		subjects from test database imported from ./test/subject_test.txt file, column name set to "User ID"
	-	T_Sub_train:	subjects from train database imported from ./train/subject_train.txt file, column name set to "User ID"
	-	T_Data_test:	data from test database imported from ./test/X_test.txt file, column names taken from T_features table
	-	T_Data_train:	data from train database imported from ./train/X_train.txt file, column names taken from T_features table
	-	T_Act_test:		activities from test database imported from ./test/y_test.txt file
	-	T_Act_train:	activities from train database imported from ./train/y_train.txt file
	-	T_Act_test_label:	merge activity list test with labels 
	-	T_Act_train_label:	merge activity list train with labels
	-	T_Data_test_all:	collate together activities, subjects and data from test database
	-	T_Data_train_all:	collate together activities, subjects and data from train database
	-	T_Data_all:			merge of T_Data_test_all and T_Data_train_all into a single database
	-	T_Data_redux:		subset of T_Data_all including activities, user IDs and all data columns containing the words "mean", "Mean", "Std" or "std"
	-	T_Data_redux_avg:	table including the average value per user and per activity for each numeric variable included in T_Data_redux
