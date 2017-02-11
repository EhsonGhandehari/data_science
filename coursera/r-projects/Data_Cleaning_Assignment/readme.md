---
title: "codebook"
author: "Ehson Ghandehari"
date: "September 27, 2015"
---

This is the process flow of run_analysis.R:

1. It sets the working directory to where UCI HAR Dataset is stored. In case one wants to run this on local computer, the working directory must be changed.
2. It finds all the text files, recursively, in the working directory, and stores the name all the files in a character vector(variable All_files). This helps the user to have control on all the existing text files. 

example: read.table(All_files[1]) opens up the data inside the first text file in the character vector.

3. Read the descriptive column name of data from All_files[3] and load it in "variable_names" object . Basically opening "feature.txt" file.

note: this is the step 4 on coursework assignment instructions!

4. Read in training and testing data and save the in "Train," and "Test" objects, respectively.
5. Combing the training and testing data in one single object (used Row Binding).

6. Selecting the necessary columns (86 out of 561) that contained "mean" or "std" in the column names. (grep function was used)
7. Changed the activity column from character to factor class, and changes the levels from (1:6) to ("Walking, Walking_upstairs, Walking_downstairs,...,laying")
8. Used ddply function (plyr package) to cut pieces of whole data (grouped by subject and activity), then subsequently customized function(x) runs apply command on columns (3-88), averaging all the columns.
9. The independent tidy data was assigned to "data_tidy" object.
10. Using write table "data_tidy.txt" dataset was created in the working directory. 




    