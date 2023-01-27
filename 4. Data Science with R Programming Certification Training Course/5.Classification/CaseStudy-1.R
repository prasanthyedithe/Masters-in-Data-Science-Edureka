install.packages("AER")
install.packages("randomForest")
install.packages("rpart")
install.packages("caret")
install.packages("ggplot2")
install.packages("dplyr")

library(AER)
library(randomForest)
library(rpart)
library(caret)
library(ggplot2)
library(dplyr)

# Task 1: Using the affairs column of our data
  # Create a new column with nominal values “YES” and “NO”.
  # Convert it into factor

data("Affairs")
View("Affairs")

Affairs$yesno <- ifelse(Affairs$affairs>0,"YES","NO")
Affairs$yesno <- as.factor(Affairs$yesno)
class(Affairs$yesno)

#Task 2: Create a classifier with our data using Decision tree algorithm
  # Plot the Decision tree
  # Calculate the accuracy using confusion matrix

Affairs <- Affairs[-1]

set.seed(3)
id <- sample(2,nrow(Affairs), prod = c(0.7,0.3), replace =T)
trainAffairs <-Affairs[id ==1]
testAffairs <- Affairs[id==2]


treeAffairs <- rpart(yesno~.,data = trainAffairs)
treeAffairs

plot(treeAffairs,margin=0.1)
test(treeAffairs,pretty=T,cex=0.7)

predtree <- predit(treeAffairs, testAffairs, type="class")
predtree


confusionMatrix(table(predtree,testAffairs$yesno))


#Task 3: Create another classifier with our data using random forest algorithm
   # Calculate the accuracy using confusion matrix
   # Find out the importance of attributes using importance() function


forestAffairs <-randomForest(yesno~.,data = trainAffairs)
forestAffairs

presforest<-predict(forestAffairs, testAffairs, type="class")

confusionMatrix(table(predforest, testAffairs$yesno))

importance(forestAffairs)