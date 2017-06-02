# Code Book Introduction

This code book contains descriptions of the variables used throughout the process of creating tidy data, as well as the process for choosing column names for the tidy dataset.

# Variables

Important variables are mentioned according to their appearance in the `run_analysis.R` script.

* `x_test`,`y_test`, `subject_test`, `x_train`, `y_train`, and `subject_train` contain data from the downloaded files.
* 'activity' contains the corresponding labels for each numerical response under `y_test` and `y_train` from the downloaded files.
* `features` contains the column names for `x_test` and `x_train` from the downloaded files.
* `test_only` contains a data frame combining `x_test`, `y_test`, and `subject_test`.
* `train_only` contains a data frame combining `x_train`, `y_train`, and `subject_train`.
* `combined` contains a data frame combining the data in `test_only` and `train_only` via the `rbind()` function.
* `extracted` contains the `combined` data frame with only the `subject_id`, `activity`, and the other columns containing mean and standard deviation data. These were isolated using the `grepl()` function.
* `described` contains the data in `extracted` except it has a new column containing the full activity name for each record.
* `final` is a dataset containing columns for `activity_id`, `subject_id`, `activity_name`, and all the columns showing mean values of data.
* 'tidy_data' contains the same columns as 'final', except the order of coluns was changed so that 'actvity_id' column is beside 'activity_name' column.

# Column Names

To achieve cleaner column names, the following were done:
* All words were formatted to begin with a capital letter (e.g. `Mean` instead of `mean`).
* Ambiguous terms in the column names were lengthened (e.g. `t` into `Time`, `f` into `Frequency` `Acc` into `Acceleration`, `std` into `StdDev`, and `X`, `Y`, and `Z` are now `XDirection`, `YDirection`, and `ZDirection`.)
* Removed parentheses `()`.
