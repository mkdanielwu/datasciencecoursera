==================================================================
Tidy/Summary Human Activity Recognition Using Smartphones Datasets
Version 1.0
==================================================================
Created by Daniel Wu (8/7/2016) from original dataset produced by:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

Original description of the dataset:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 66-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt': this document

- 'codebook.txt': List of all features and shows information about the variables used on the feature vector.

- 'run_analysis.R': R script to generate the tidy and summary datasets from the UCI HAR Dataset.

- 'UCI-HAR-Tidy-Dataset.csv': Merged original training and test sets and includes only the measurements on the mean and standard deviation for each measurement.

- 'UCI-HAR-Summary-Dataset.csv': Summary dataset based on 'UCI-HAR-Tidy-Dataset.csv' with the average of each variable for each activity and each subject.

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

To Generate the tidy and summary dataset csv files:
===================================================
1. Download and extract the original HCI HAR Dataset from: 

  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
2. Extract the original dataset into working directory, this should create 'UCI HAR Dataset' subdirectory

3. Place 'run_analysis.R' in the working directory, edit the first statement to match your actual working directory:

  setwd("C:/Users/daniel/Documents/Courses/Data Science/03 Getting and Cleaning Data/course project")

4. Run 'run_analysis.R' to generate 'UCI-HAR-Tidy-Dataset.csv' and 'UCI-HAR-Summary-Dataset.csv'

For more information about this dataset contact: mk.danielwu@gmail.com

License (original dataset license term):
========================================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
