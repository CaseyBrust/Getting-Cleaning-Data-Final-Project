#Code Book for tidy.txt
##Original data files
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##Original Variable Defintions
See features_info.txt and README.txt from original data files
##Full list of original variables measured
See features.txt from original data files
##Transformations
1. Combined data from subject_test.txt (ids of test subjects),y_test.txt (activity measured on each row), and X_test.txt (measurements of each column) to data frame "test"
  1. test[1]="ids" or the subject ids
  2. test[2]="activity" or the activity measured
  3. test[3:363]=measurements of each id x activity corresponding to measurements labeled in features.txt
2. Repeat for train files.
3. Merged test and train dataframes
4. Removed all variables except "id", "activity", and columns measuring mean or standard deviation.
5. Renamed measurement columns to lowercase names, with no abbreviations (i.e. "t" was tranformed to "time"), and removed any punctuation in variables names.
6. Formatted activity as a factor
7. This completed the first data set (my_data)
8. Melted and recasted data to get means for each measurement by ID and activity and saved data set (tidy)
##Variables
* id=subject id (vector of 180 ids, 1 row for each respondent)
* activity=factor where:
  *1=walking
  *2=walkingupstairs
  *3=walkingdownstairs
  *4=sitting
  *5=standing
  *6=laying
*Means of measurements that can be mapped from original mean and standard deviation measurements to the following variable names using renaming techniques mapped in the Transformations section step 5. These are the means for each respondent and respondent's activity for all original mean and standard deviation variable measurements.
*timebodyaccelerometermeanx
*timebodyaccelerometermeany
*timebodyaccelerometermeanz
*timegravityaccelerometermeanx
*timegravityaccelerometermeany
*timegravityaccelerometermeanz
*timebodyaccelerometerjerkmeanx
*timebodyaccelerometerjerkmeany
*timebodyaccelerometerjerkmeanz
*timebodygyroscopemeanx
*timebodygyroscopemeany
*timebodygyroscopemeanz
*timebodygyroscopejerkmeanx
*timebodygyroscopejerkmeany
*timebodygyroscopejerkmeanz
*timebodyaccelerometermagnitudemean
*timegravityaccelerometermagnitudemean
*timebodyaccelerometerjerkmagnitudemean
*timebodygyroscopemagnitudemean
*timebodygyroscopejerkmagnitudemean
*frequencybodyaccelerometermeanx
*frequencybodyaccelerometermeany
*frequencybodyaccelerometermeanz
*frequencybodyaccelerometerjerkmeanx
*frequencybodyaccelerometerjerkmeany
*frequencybodyaccelerometerjerkmeanz
*frequencybodygyroscopemeanx
*frequencybodygyroscopemeany
*frequencybodygyroscopemeanz
*frequencybodyaccelerometermagnitudemean
*frequencybodybodyaccelerometerjerkmagnitudemean
*frequencybodybodygyroscopemagnitudemean
*frequencybodybodygyroscopejerkmagnitudemean
*timebodyaccelerometerstdx
*timebodyaccelerometerstdy
*timebodyaccelerometerstdz
*timegravityaccelerometerstdx
*timegravityaccelerometerstdy
*timegravityaccelerometerstdz
*timebodyaccelerometerjerkstdx
*timebodyaccelerometerjerkstdy
*timebodyaccelerometerjerkstdz
*timebodygyroscopestdx
*timebodygyroscopestdy
*timebodygyroscopestdz
*timebodygyroscopejerkstdx
*timebodygyroscopejerkstdy
*timebodygyroscopejerkstdz
*timebodyaccelerometermagnitudestd
*timegravityaccelerometermagnitudestd
*timebodyaccelerometerjerkmagnitudestd
*timebodygyroscopemagnitudestd
*timebodygyroscopejerkmagnitudestd
*frequencybodyaccelerometerstdx
*frequencybodyaccelerometerstdy
*frequencybodyaccelerometerstdz
*frequencybodyaccelerometerjerkstdx
*frequencybodyaccelerometerjerkstdy
*frequencybodyaccelerometerjerkstdz
*frequencybodygyroscopestdx
*frequencybodygyroscopestdy
*frequencybodygyroscopestdz
*frequencybodyaccelerometermagnitudestd
*frequencybodybodyaccelerometerjerkmagnitudestd
*frequencybodybodygyroscopemagnitudestd
*frequencybodybodygyroscopejerkmagnitudestd
