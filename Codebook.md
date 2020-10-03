Code Book
=========

Codeboo sourcing of `run_analysis.R`

Actions performed on data:
--------------------------

-   create data dir `./data`
-   downloading zip file:
    <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
    to `./data`
-   extracting zip file: `.//data.zip` to `./data/UCI HAR Dataset`
-   Reading data from the files into the R objects (variables:
    SubjDataTrain, SubjDataTest, ActDataTrain, ActDataTest,
    FeatDataTrain and FeatDataTest) by assigning Activity, Subject and
    Features test and train datasets\`
-   `CombineData` loaded in memory by combining ‘MergeDataSubj’,
    ‘MergeDataAct’
-   Merge columns for CombineData and MergeDataFeat to get the data
    frame called Data for all data
-   subsetted `mergedData` into `subSetMergedData` keeping only the key
    columns and features containing `std` or `mean`, dimensions : 10299
    x 68
-   merged `./data/UCI HAR Dataset/activity_labels.txt` contents with
    correct `activity_num` column, effectivly appending `activity_name`
    to `subSetMergedData`, dimensions : 10299 x 69
-   melt `subSetMergedData` into `reshapedData`, based on key columns,
    dimensions : 679734 x 5
-   split feature column `variable` into 7 seperate colums (for each sub
    feature), and added it to `reshapedData`, dimensions : 679734 x 12
-   renamed `reshapedData` to **`resultData`**
-   cast `resultData` into **`tidyData`** with the average of each
    variable for each activity and each subject dimensions :180 x 68
-   write `tidyData` to file `./data/tidy_data.txt`
