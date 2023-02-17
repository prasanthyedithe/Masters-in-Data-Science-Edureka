# Installing Packages
install.packages("arules")
install.packages("arulesViz")
install.packages("caTools")
install.packages("caret")
install.packages("rminer")
install.packages("randomForest")


# Loading package
library(arules)
library(arulesViz)
library(recommenderlab)
library(ggplot2)
library(data.table)
library(reshape2)
library(datasets)
library(caTools)
library(party)
library(dplyr)
library(magrittr)
library(plyr)
library(partykit)
library(caTools)
library(caret)
library(naivebayes)
library(rminer)
library(e1071)
library(randomForest)



setwd(choose.dir())
getwd()

df <- read.csv("338_cert_proj_datasets_v3.0.csv")
head(df)

######## Decision  Tree

df2 <- df[,-c(9,10)]

head(df2)
str(df2)

sample_data = sample.split(df2, SplitRatio = 0.8)
train_data <- subset(df2, sample_data == TRUE)
test_data <- subset(df2, sample_data == FALSE)


model<- ctree(df2$left ~ ., train_data)
plot(model)


# Splitting data into train
# and test data
split <- sample.split(df, SplitRatio = 0.7)
train_cl <- subset(df, split == "TRUE")
test_cl <- subset(df, split == "FALSE")

# Feature Scaling
train_scale <- scale(train_cl[, 1:4])
test_scale <- scale(test_cl[, 1:4])


########## Fitting Naive Bayes Model
# to training dataset
set.seed(120)  # Setting Seed
classifier_cl <- naiveBayes(df$salary ~ ., data = train_cl)
classifier_cl

# Predicting on test data'
y_pred <- predict(classifier_cl, newdata = test_cl)

# Confusion Matrix
cm <- table(test_cl$Species, y_pred)
cm

# Model Evaluation
confusionMatrix(cm)




########## Random Forest Approach in R Programming

# Splitting data in train and test data
split <- sample.split(df, SplitRatio = 0.7)
split

train <- subset(df, split == "TRUE")
test <- subset(df, split == "FALSE")

# Fitting Random Forest to the train dataset
set.seed(120)  # Setting seed
classifier_RF = randomForest(x = train[-5],
                             y = train$left,
                             ntree = 500)

classifier_RF

# Predicting the Test set results
y_pred = predict(classifier_RF, newdata = test[-5])

# Confusion Matrix
confusion_mtx = table(test[, 5], y_pred)
confusion_mtx

# Plotting model
plot(classifier_RF)

# Importance plot
importance(classifier_RF)

# Variable importance plot
varImpPlot(classifier_RF)

#############Classifying data using Support Vector Machines(SVMs) in R
head(df)

dataset = df[0:8]
head(dataset)
et.seed(123)
split = sample.split(dataset$left, SplitRatio = 0.75)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])


classifier = svm(formula = dataset$left ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')


# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])


# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)

# installing library ElemStatLearn
library(ElemStatLearn)


# Plotting the training data set results
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)

grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Time Sepdm Company', 'left')
y_grid = predict(classifier, newdata = grid_set)

plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Left',
     xlim = range(X1), ylim = range(X2))

contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)

points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'coral1', 'aquamarine'))

points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))