#1.Load the required libraries and the data
library("dplyr")
library("ggplot2")
  #Record: Record ID  
  #Gender: Gender of the applicant. 
  #No_kids: Number of kids.
  #Education: Education level of the individual.
  #HasCar: whether the individual has car or not.
  #Income: income level of the individual.
  #PropertyValue: Property Value of the Flat / House (in USD)
  #Loan_Period: period of the loan (in months)
  #Credit_Record: value of 1, if the Credit Record is good and 0, if it is not.
  #Housing_type: category of housing property –(Affordable, Mid-Range and Premium)
  #Property_Purchased: takes the value ‘Y’, if the inquiry led to Purchase of the property, and ‘N’ if the property was not Purchased

#3.Create a scatter plot between Credit_Record on x-axis and Income on y-axis.

setwd(choose.dir())
getwd()

housing = read.csv("housingdata.csv")
View(housing)

plot(housing$Income,housing$Credit_Record)

x <- housing$Credit_Record
y <- housing$Income

grps <- as.factor(housing$Credit_Record)
library("scatterplot3d")
scatterplot3d(x, y,pch = 16)

#4.Create a scatter plot between Income on x-axis and PropertyValue on y-axis
plot(housing$PropertyValue,housing$Income)
plot(housing$PropertyValue,housing$Income, col=housing$No_kids)
plot(housing$PropertyValue,housing$Income, cex = 3,cex.axis = 0.5, col=housing$No_kids)
ggplot(housing, aes(y=PropertyValue,x=Income), col=housing$No_kids)+geom_smooth()

#5. ggplot comparson with Base plot
plot(housing$PropertyValue,housing$Income, col=housing$No_kids)

x1 <- housing$Income
y1 <- housing$PropertyValue

grps1 <- as.factor(housing$No_kids)
colors <- c("#999999", "#E69F00", "#56B4E9")
plot(x, y, pch = 16, col = colors[grps])

ggplot(housing, aes(x=Income,y=PropertyValue))

#6. Aesthetics

ggplot(housing, aes(x=Income, y=PropertyValue)) + geom_point()
ggplot(housing, aes(y=Income, x=PropertyValue)) + geom_point()
ggplot(housing, aes(x=Income, y=PropertyValue, col=No_kids)) + geom_point()
ggplot(housing, aes(x=Income, y=PropertyValue, col=No_kids)) + geom_point(size=6, shape=24)            

#7. Geometry

plot(housing$Income, housing$PropertyValue)
ggplot(housing, aes(Income, PropertyValue)) + geom_jitter()
ggplot(housing, aes(Income, PropertyValue)) + geom_jitter(width = 0.1)            

#8. Histogram

ggplot(housing, aes(x = Income)) + geom_histogram()

ggplot(housing, aes(x = Income)) + geom_histogram(fill = "cornflowerblue", color = "green", binwidth = 5)

ggplot(housing, aes(x = Income)) + geom_density()

ggplot(housing, aes(x = Income)) + geom_density(fill="#377EB8")

# 9.Bar Plot: 

ggplot(housing, aes(x = Property_Purchased, fill= Education)) + geom_bar()
ggplot(housing, aes(x = Property_Purchased, y = Education, fill= Education)) + geom_bar(stat="identity", position=position_stack())
ggplot(housing, aes(x = Property_Purchased, y = Education, fill= Education)) + geom_bar(stat="identity", position=position_fill())
ggplot(housing, aes(x = Property_Purchased, y = Education, fill= Education)) + geom_bar(stat="identity", position=position_dodge())

#10.Overlapping bar plots: 
#Not understood posn_d
ggplot(housing, aes(x = Property_Purchased, y = Education, fill= Education)) + geom_bar(stat="identity", position=position_dodge(padding = 0.1))


#11.Overlapping histograms:
ggplot(housing, aes(x = Income, fill= HasCar)) + geom_histogram(width = 1.0)
ggplot(housing, aes(x = Income, fill= HasCar)) + geom_histogram(width = 1.0, position = position_identity())

#12. Faceting
ggplot(housing, aes(x=Income, y=PropertyValue))
ggplot(housing, aes(x=Income, y=PropertyValue)) + geom_boxplot(aes(fill=HasCar))

ggplot(housing, aes(x=Income, y=PropertyValue)) + geom_boxplot(aes(fill=No_kids))

ggplot(housing, aes(x=Income, y=PropertyValue)) + geom_boxplot() + facet_grid(HasCar ~ No_kids)
