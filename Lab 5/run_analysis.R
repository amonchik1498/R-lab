#Ви повинні створити один R-скрипт, який називається run_analysis.R, який виконує наступні дії.

library(dplyr)
features <- read.table("C:/Users/PC ALLO/Desktop/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("C:/Users/PC ALLO/Desktop/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("C:/Users/PC ALLO/Desktop/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("C:/Users/PC ALLO/Desktop/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("C:/Users/PC ALLO/Desktop/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("C:/Users/PC ALLO/Desktop/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("C:/Users/PC ALLO/Desktop/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("C:/Users/PC ALLO/Desktop/UCI HAR Dataset/train/y_train.txt", col.names = "code")

#1.Об’єднує навчальний та тестовий набори, щоб створити один набір даних.
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

#2.Витягує лише вимірювання середнього значення та стандартного відхилення (mean and standard deviation) для кожного вимірювання.
Tidy_Data <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

#3.Використовує описові назви діяльностей (activity) для найменування діяльностей у наборі даних.
Tidy_Data$code <- activities[Tidy_Data$code, 2]

#4.Відповідно присвоює змінним у наборі даних описові імена.
names(Tidy_Data)[2] = "activity"
names(Tidy_Data)<-gsub("Acc", "Accelerometer", names(Tidy_Data))
names(Tidy_Data)<-gsub("Gyro", "Gyroscope", names(Tidy_Data))
names(Tidy_Data)<-gsub("BodyBody", "Body", names(Tidy_Data))
names(Tidy_Data)<-gsub("Mag", "Magnitude", names(Tidy_Data))
names(Tidy_Data)<-gsub("^t", "Time", names(Tidy_Data))
names(Tidy_Data)<-gsub("^f", "Frequency", names(Tidy_Data))
names(Tidy_Data)<-gsub("tBody", "TimeBody", names(Tidy_Data))
names(Tidy_Data)<-gsub("-mean()", "Mean", names(Tidy_Data), ignore.case = TRUE)
names(Tidy_Data)<-gsub("-std()", "STD", names(Tidy_Data), ignore.case = TRUE)
names(Tidy_Data)<-gsub("-freq()", "Frequency", names(Tidy_Data), ignore.case = TRUE)
names(Tidy_Data)<-gsub("angle", "Angle", names(Tidy_Data))
names(Tidy_Data)<-gsub("gravity", "Gravity", names(Tidy_Data))

#5.З набору даних з кроку 4 створити другий незалежний акуратний набір даних (tidy dataset) із середнім значенням для кожної змінної для кожної діяльності та кожного суб’єкту (subject).
tidy_dataset <- Tidy_Data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(tidy_dataset, "C:/Users/PC ALLO/Desktop/UCI HAR Dataset/Tidy_Dataset.csv", row.name=FALSE)
