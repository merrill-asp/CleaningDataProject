# Personal Motion Data

## Analysis

The R script `run_analysis.R` reads in the UCI HAR Dataset and creates two data frames:

1. A data frame of 10299 observations of 68 variables (66 kinematic measurements, with subject number and activity)
2. A data frame of 180 observations of averages of the 66 kinematic variables across subject and activity

As the original dataset has no missing values, there was no need to impute the data.

The 66 chosen kinematic variables (described in `CodeBook.md`) are a selection of the 561 variables of the original dataset. They are the means and standard deviations of the unique kinematic features measured.

The second data frame is also automatically written out as meansBySubjectAndActivity.txt
