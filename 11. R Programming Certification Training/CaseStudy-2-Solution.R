library(dplyr)
library(purrr)

#1.Given a vector “First_Hundred”, which comprises of sequence of first hundred natural numbers:
  #Change all the odd numbers to the string “ODD”
  #Change all the even numbers to the string “EVEN”

First_Hundred <- (1:10)

v <- c()
for (e in First_Hundred){
  if(e %% 2 == 1){
    v[e] <- "ODD"  
  }else{
    v[e] <- "EVEN"
  }
  
}

print(v[1:5])

#2.From the “iris” dataset, find the number of observations whose “Sepal.Length” 
#is greater than ‘6.5’ by using only loops and conditional statements

Sepal_Length = iris$Sepal.Length
class(Sepal_Length)
for(e in Sepal_Length){
  if(e > 6.5){
    
    print(paste(e," Grether than 6.5"))
  }
}

#3.“CO2” is a preloaded data-set in R. From the “CO2” data-set, find the mean ‘uptake’ of only those observations 
#where Type is “Mississippi” and Treatment is ‘chilled’. You canuse only loops and conditional statements

View(CO2)
co2_selected_value = CO2[CO2$Type == 'Mississippi' & CO2$Treatment == "chilled",]

co2_selected_value

mean(co2_selected_value$uptake)

#4. On the “CO2” data-set, use ‘tapply()’ function to obtain mean, median, minimum and maximum 
#values of ‘uptake’ with respect to the ‘Treatment’ column

tapply(CO2$uptake, CO2$Treatment, mean)
tapply(CO2$uptake, CO2$Treatment, median)
tapply(CO2$uptake, CO2$Treatment, min)
tapply(CO2$uptake, CO2$Treatment, max)



#5.‘swiss’ is a preloaded data-set in R. Using the ‘invoke_map()’ function, find out the 
#minimum ‘Fertility’ and maximum ‘Infant.Mortality’ from the ‘swiss’ data-set.

invoke_map(list(Min_Fertility="min",Max_Mortality="max"),list(swiss$Fertility,swiss$Infant.Mortality))


#Create a custom function “dice()” which will give a random number between 1-6 
#every time the function is invoked

dice <- function(){
  runif(1, min=1, max=6)
  
}

dice()
