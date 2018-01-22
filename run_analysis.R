library(dplyr)
library(stringr)
library(tidyverse)
library(reshape2)
testdata <- read.table("X_test.txt")
testactivity <- read.table("y_test.txt")  # 6 labels for walking/sitting etc. 1 variable
testsubject <- read.table("subject_test.txt")  # up to 30 subjects (test has 24). 1 variable, subject #
features <- read.table("features.txt")  # 561 feature variables, V1 is variable #, V2 is variable name
traindata <- read.table("X_train.txt")
trainactivity <- read.table("y_train.txt") #labels for walking/stting/etc
trainsubject <- read.table("subject_train.txt") #patient number

names(traindata) <- as.character(features$V2) #activity types
traindata$subject <- trainsubject$V1
traindata$activity <- factor(trainactivity$V1, levels = c(1:6), labels = c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"))
traindata <- traindata[ ,c(562, 563, 1:561)]
traindata <- traindata %>%
    arrange(subject, activity)


names(testdata) <- as.character(features$V2)
testdata$subject <- testsubject$V1
testdata$activity <- factor(testactivity$V1, levels = c(1:6), labels = c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"))
testdata <- testdata[ ,c(562, 563, 1:561)]
testdata <- testdata %>%
    arrange(subject, activity)

final <- full_join(traindata, testdata)
finalmean <- final[ ,grepl("mean()", names(final), fixed = TRUE)]
finalstd <- final[ ,grepl("std", names(final))]
final <- cbind(final[, 1:2],finalmean, finalstd)
write.table(final, file="final.txt")


final2 <- final %>%
    group_by(subject, activity) %>%
    summarise_all(mean)

write.table(final2, file="final2.txt")



















