setwd(choose.dir())
getwd()



install.packages("ggplot2")
install.packages("dplyr")
install.packages("broom")
install.packages("ggpubr")
install.packages("ROCR")

library("dplyr")
library("caTools")
library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)
library(ROCR) 


###########Linear Regression##################
data_frame = read.csv("video_game.csv")
View(data_frame)
summary(data_frame)
data_frame[is.na(data_frame) | data_frame=="Inf"] = NA
na.omit(data_frame)

# 1. Create a test set and training set
print ("Training Dataset")
training_dataset  <- data_frame %>% dplyr::sample_frac(0.7)
print (training_dataset)
print ("Testing Dataset")
testing_dataset   <- dplyr::anti_join(data_frame,
                                      training_dataset, by = 'EU_players')
print (testing_dataset)

#2. Create a new linear regression model using train set
plot(Critic_Score ~ Critic_Count, data = data_frame) #Linearity
lm(formula = Critic_Score ~ Critic_Count, data = data_frame)


year.euplayer.lm <- lm(Critic_Score ~ Critic_Count, data = data_frame)

#3. Predict the values for other sales for the test
summary(year.euplayer.lm)



###########Logistic Regression##################
df = read.csv("Employee_Data.csv")
View(df)

summary(df)


df$sex_of_emp<-ifelse(df$sex_of_emp=="Male",1,0)


View(df)
# Splitting dataset
split <- sample.split(df, SplitRatio = 0.8)
split

train_reg <- subset(df, split == "TRUE")
test_reg <- subset(df, split == "FALSE")

# Training model
logistic_model <- glm(sex_of_emp ~ Emp_Sal, 
                      data = train_reg, 
                      family = "binomial")
logistic_model
# Summary
summary(logistic_model)

# Predict test data based on model
predict_reg <- predict(logistic_model, 
                       test_reg, type = "response")
predict_reg  


# Changing probabilities
predict_reg <- ifelse(predict_reg >0.4, 1, 0)


# Evaluating model accuracy
# using confusion matrix
table(test_reg$Emp_Sal, predict_reg)


missing_classerr <- mean(predict_reg != test_reg$Emp_Sal)
print(paste('Accuracy =', 1 - missing_classerr))
