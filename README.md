Course Project for Getting and Cleaning Data Course
---------------------------------------------------

In this repository, my work that attempt to implement all instruction
for the coursera online course project “Getting and Cleaning data” were
included. The project is design to demonstrate student’s ability to
collect, work with, and clean a data set. The working data set represent
data collected from the accelerometers from the Samsung Galaxy S
smartphone.

### About the raw data

The data for the project is obtainnabke from the url:
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" class="uri">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

### About the script and the tidy dataset

A script run\_analysis.R was created, which will merge the test and
training sets together. Prerequisites for this script as obtained from
the data files downloaded from the above url. The UCI HAR Dataset was
extracted and be made availble in a r working directory called “UCI HAR
Dataset”. After merging testing and training, labels are added and only
columns that have to do with mean and standard deviation are kept.

Finally, the script will create a tidy data set called containing the
means of all the columns per test subject and per activity. This tidy
dataset will be written to a .txt file called “tidydata.txt”, which can
also be found in this repository.

### About the Code Book

The CodeBook.md file explains the transformations performed and the
resulting data and variables.

share
