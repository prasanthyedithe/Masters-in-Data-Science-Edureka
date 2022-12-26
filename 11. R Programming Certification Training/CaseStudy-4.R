library(dplyr)
housing = read.csv("housingdata.csv")
head(housing)
summary(housing)
names(housing)
str(housing)

#Select and Mutate

#Converting the ‘housing’ dataset into a tibble

as_tibble(housing)->housing

#Print out a df with the columns Gender, Education, and Income.

select(housing, Gender, Education, Income)
select(housing, Gender:Loan_Period)
select(housing, - (Record:Gender))
#Mutate
g1 <- mutate(housing, var1 = PropertyValue/Income)
head(g1)

g2 <- mutate(housing, var2 = PropertyValue/Loan_Period)
head(g2)

#Filter and Arrange

#Logical operators

g3 = filter(housing, PropertyValue < 80000 | PropertyValue > 150000)

filter(housing, PropertyValue > 100000 & Income < 3185)

filter(housing, Property_Purchased == "Y", Income < 3185)

bought <- filter(housing, Property_Purchased == "Y")

arrange(bought, Income)

arrange(bought, Gender) # Arrange bought so that Gender is grouped

arrange(bought, Gender, Education)  #Arrange bought so that Gender and Education is is grouped

notbought <- filter(housing, Property_Purchased == "N")

arrange(notbought, Income)

arrange(notbought, Gender)

arrange(notbought, Gender, Education)

arrange(housing, Gender, desc(Income))

#Summarise and the pipe operator

summarise(housing, min_income = min(Income), max_income = max(Income))
#Aggregate functions

summarise(housing, 
          minimum = min(Income), 
          average = mean(Income), 
          max = max(Income), 
          sd = sd(Income),
          inter = IQR(Income))
#Generate summary about PropertyValue column of housing

summarise(housing, 
          minimum = min(PropertyValue), 
          average = mean(PropertyValue), 
          max = max(PropertyValue), 
          sd = sd(PropertyValue),
          inter = IQR(PropertyValue))
summarise(housing, 
          minimum = min(Loan_Period), 
          average = mean(Loan_Period), 
          max = max(Loan_Period), 
          sd = sd(Loan_Period),
          inter = IQR(Loan_Period))
summarise(housing, 
          n_obs = n(), 
          n_education = n_distinct(Education), 
          n_Credit = sum(Credit_Record == 1))

#Pipe operators

#Take the housing data set and then

#+Add the new variable var1 which calculates the ratio of property value to total income
#+Pick all of the rows whose var1 value exceeds 50, and then …

#+Summarise the data set with a value named avg that is the mean value of var1.

#Write the ‘piped’ version of the English sentences.

housing %>%
  mutate(var1 = PropertyValue/Income) %>%
  filter(var1>50) %>%
  summarise(avg = mean(var1))

housing %>%
  group_by(Education) %>%
  summarise(avg_income = mean(Income), 
            avg_Value = mean(PropertyValue)) %>%
  arrange(avg_income, avg_Value)





