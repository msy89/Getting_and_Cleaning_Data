#Setting work directory
setwd('C:/Users/Martin/Downloads/UCI HAR Dataset')
#Preparing feature variable names
features=read.table("features.txt",h=F)
features=as.character(features[,2])
#You must note that some variable names have the error
#that the word 'Body' repeats 2 times. We correct that
#with the following:
for(i in grep('BodyBody',features)){
a=unlist(strsplit(features[grep('BodyBody',features)][i],'Body'))
features[i]=paste(a[1],'Body',a[3],sep='')
}
#Preparing activity labels
labels=read.table("activity_labels.txt",h=F)
labels[,2]=as.character(labels[,2])
#Reading the test dataset
setwd('C:/Users/Martin/Downloads/UCI HAR Dataset/test')
test=read.table("X_test.txt",h=F)
tind=read.table("subject_test.txt",h=F)
tact=read.table("y_test.txt",h=F)
test$subject=tind[,1];test$activity=tact[,1]
#Reading the train dataset
setwd('C:/Users/Martin/Downloads/UCI HAR Dataset/train')
train=read.table("X_train.txt",h=F)
trind=read.table("subject_train.txt",h=F)
tract=read.table("y_train.txt",h=F)
train$subject=trind[,1];train$activity=tract[,1]
#Merging 'test' and 'train' datasets in 'tidy' dataset
tidy=rbind(test,train)
#Labelling the data set with descriptive variable names.
names(tidy)[1:length(features)]=features
#Subsetting 'tidy' dataset extracting only the measurements on 
#the mean and standard deviation for each measurement.
tidy=tidy[,c((ncol(tidy)-1),ncol(tidy),grep('mean()',names(tidy)),grep('std()',names(tidy)))]
tidy=tidy[,grep('Freq',names(tidy),invert=T)]
#Preparing descriptive variable names
for(i in 3:ncol(tidy)){
names(tidy)[i]=sub('..','',make.names(names(tidy)[i]),fixed=T)
}
#Labelling 'activity' variable with activity labels
activity=rep(NA,nrow(tidy))
for(i in 1:nrow(labels)){
activity[as.numeric(row.names(tidy[tidy$activity==i,]))]=labels[i,2]
}
tidy$activity=activity
#Generating a 'final' dataset with the average of each variable for each activity and each subject.
final=matrix(ncol=ncol(tidy),nrow=length(table(tidy$subject))*nrow(labels),dimnames=list(1:(length(table(tidy$subject))*nrow(labels)),names(tidy)))
for(j in 1:length(table(tidy$subject))){
for(i in 1:nrow(labels)){
final[6*(j-1)+i,3:ncol(final)]=colMeans(tidy[tidy$subject==j&tidy$activity==labels[i,2],-(1:2)])
final[6*(j-1)+i,1]=as.numeric(names(table(tidy$subject)))[j]
final[6*(j-1)+i,2]=labels[i,2]
}
}
#Saving the 'final' dataset in a .txt file
write.table(final,'final.txt',row.names=F)

##Please only run the code below if you want to have a better visualisation of the tidy data#################
####################################################################################################
address="https://s3.amazonaws.com/coursera-uploads/user-71404fce0a73801a55083cb2/975115/asst-3/aa0b9a40417e11e59260092beb391fd2.txt"
address=sub("^https", "http", address)
data=read.table(url(address), header = TRUE)
View(data)
####################################################################################################
