run_analysis <- function() {
      #import activity labels
      T_Activities<-read.table("activity_labels.txt")
      #import features table
      T_features<-read.table("features.txt")
      #import subject test
      T_Sub_test<-read.table("./test/subject_test.txt")
      #import subject train
      T_Sub_train<-read.table("./train/subject_train.txt")
      #import test data
      T_Data_test<-read.table("./test/X_test.txt")
      #import train data
      T_Data_train<-read.table("./train/X_train.txt")
      #import activity list test
      T_Act_test<-read.table("./test/y_test.txt")
      #import activity list train
      T_Act_train<-read.table("./train/y_train.txt")
      #merge activity list test with labels
      T_Act_test_label<-merge(T_Act_test,T_Activities,by.x="V1",by.y="V1")
      #merge activity list train with labels
      T_Act_train_label<-merge(T_Act_train,T_Activities,by.x="V1",by.y="V1")
      #allocate names to columns of T_Act_test_label
      names(T_Act_test_label)<-c("Activity ID","Activity")
      #allocate names to columns of T_Act_train_label
      names(T_Act_train_label)<-c("Activity ID","Activity")
      #allocate name to subject test column
      names(T_Sub_test)<-c("User ID")
      #allocate name to subject train column
      names(T_Sub_train)<-c("User ID")
      #allocate features to test data set
      names(T_Data_test)<-T_features[,2]
      #allocate features to train data set
      names(T_Data_train)<-T_features[,2]
      #create matrix with all test data
      T_Data_test_all<-cbind(T_Act_test_label,T_Sub_test,T_Data_test)
      #create matrix with all train data
      T_Data_train_all<-cbind(T_Act_train_label,T_Sub_train,T_Data_train)
      #merge all data together
      T_Data_all<-merge(T_Data_test_all,T_Data_train_all,by.x=1:564,by.y=1:564,all=TRUE)
      #create a reduced datasted including activities, users and only data for mean and std measurements
      T_Data_redux<-cbind(T_Data_all[,1:3],T_Data_all[, grepl("mean", names(T_Data_all))],T_Data_all[, grepl("Mean", names(T_Data_all))],T_Data_all[, grepl("std", names(T_Data_all))],T_Data_all[, grepl("Std", names(T_Data_all))])
      #calculate mean per user and activity
      T_Data_redux_avg<-aggregate(T_Data_redux,by=list(User=T_Data_redux[,3],Activity=T_Data_redux[,2]),mean)
      #remove double columns from aggreate results
      T_Data_redux_avg<-T_Data_redux_avg[,-c(4:5)]
      #write output file
      write.table(T_Data_redux_avg,"output.txt",row.name=FALSE,sep=";",na="NA")
}
