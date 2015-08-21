---
title: "README.md"
author: "A.Iordanova"
date: "08/19/2015"
output: pdf_document
---
# Course Project - Getting and Cleaning data

This is the course project for the Getting and Cleaning Data from Coursera. 
There are 3 files in this projects:

1.The R script, "run_analysis.R":

    Reads data from the working directory.
    Merges the tets and train datasets together.
    Keeps only the variables representing mean and standard deviation of measurements.
    Converts the activity and subject columns into factors.
    Creates a tidy data of the average (mean) value of each variable 
    for each subject and activity (factors).
    Writes the tidy data to a tidy_data.txt file.

2.The text file, "tidy_data.txt":

    Contains the tidy data.
    Table of 180 rows and 68 columns.
    
3.The Code Book, "CodeBook.md":

    Describes the variables in the tidy data.
    Describes the tidy data and row data.
    Describes the steps to obtain the tidy data.