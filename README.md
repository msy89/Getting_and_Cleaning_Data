#GETTING AND CLEANING DATA COURSE PROJECT

##Raw data
The raw data for this project comes from experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For effects of this project, the training and the test sets are merged to create one data set. 

Each record of the merged data have the next set of variables:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##Tidy data
From the 561-feature vector we make a new data set by extracting the measurements on the mean and standard deviation for each measurement.The variables with the subject number and the activity labels are also included.

Finally, we generate a tidy data set with the average of each variable for each activity and each subject.

For each row of the tidy data it is provided (see CodeBook.md for detailed description):

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 66-feature vector with time and frequency domain variables. 
- An activity label. 
- An identifier of the subject who carried out the experiment.

For example,the first row of the tidy data contains the mean of each of the 66-feature vector for all the measurements of the activity WALKING performed for subject 1.

##Contents of the repository
This repository includes the following files:

- 'README.md'
- 'CodeBook.md': Shows information about the variables in the tidy data: the subjects involved in the experiments, the activities performed and the variables used on the feature vector.
- 'run_analysis.R': Script for obtain the tidy data.
