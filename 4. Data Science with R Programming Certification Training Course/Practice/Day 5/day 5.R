install.packages('dplyr')
install.packages("readr")
install.packages('skimr') # this library is good for statistical details

# variable means column headings
# observation means rows

# there are five dplyr functions that we will use to do majority of data wrangling steps

# filter :- it picks the observations by thier values
# select :- it picks variables/ columns by their names
# mutate :- it creates new variable/ new column with functions of existing variables
# summarize :- collapse many values down to singe summary
# arrange :- reorder the rows

# use in clause for the or condition in filter
# use , for giving and condition

library(dplyr)
gapminder = readr::read_csv('/Users/abhaya/My Data/Data Science using R/Day 5/gapminder.csv')
summary(gapminder)
head(gapminder) # first 6 rows
tail(gapminder) # last 6 rows
head(gapminder, 10) # top 10 rows
tail(gapminder, 10) # last 10 rows
str(gapminder) # structure 
dim(gapminder) # rows Vs Columns same like shape in python
ncol(gapminder) # number of columns
nrow(gapminder) # number of rows
library('skimr')
skim(gapminder)

gapminder$lifeExp
head(gapminder$lifeExp, 3)
str(gapminder$lifeExp)
summary(gapminder$lifeExp)

# i want to find all the rows where lifeExp < 29
filter(gapminder, lifeExp<29)

# i want to find where country name is Mexico
filter(gapminder, country == 'Mexico')

# i want to find where country is Mexico or Peru
filter(gapminder, country %in% c('Mexico', 'Peru'))

# i want o find where country is Mexico for year 2002 data
filter(gapminder, country == 'Mexico', year == 2002)

# what is the average life expectancy in Brazil between 1987 and 2007
x = filter(gapminder, country == 'Brazil', year>1986, year<=2007)
mean(x$lifeExp)

# select is used for selecting columns
select(gapminder, year, country, lifeExp)

# use - to deselect (not to select)
select(gapminder, -continent, -lifeExp) # except continent and lifeExp everything will come

# i want to filter records for Cambodia and display all columns except continent and lifeExp
gap_cambodia = filter(gapminder, country == 'Cambodia')
select(gap_cambodia, -continent, -lifeExp)

# there was a person called Stefan Bache who gave %>%  (cntrl + shift + M)
# margrittr 

gapminder %>% filter(country == 'Cambodia') %>% select(-continent, -lifeExp)

gapminder %>% head()
gapminder %>% head(3)

ls -ltr | grep ^d # this will show all directory names
ls -ltr | wc -l # tell you number of lines in the o/p of ls -l

# we want to know each country's annual GDP
# by multiplying population with per capita GDP

gapminder %>% mutate(gdp = pop*gdpPercap)

# calculate the population in thousands for all Asian countries in year 2007
# and add a new column

gapminder %>% filter(continent == 'Asia', year == 2007) %>% 
  mutate(pop_thousands = pop/1000) %>% 
  select(country, year, pop_thousands)

# we can set our grouping variable to continent for year 2002 and create a new column
# called cont_pop 

gapminder %>% filter(year == 2002) %>% group_by(continent) %>% mutate(cont_pop = sum(pop))

# continent wise popoluation sum
gapminder %>%group_by(continent) %>% summarize(cont_pop = sum(pop)) 

# summarize year wise sum of population of different continents
gapminder %>% group_by(continent, year) %>% summarize(cont_pop = sum(pop))

# summarize year wise sum of population of different continents and sort by year
gapminder %>% group_by(continent, year) %>% summarize(cont_pop = sum(pop)) %>% arrange(year)

# What is a maximum GDP per continent across all years
gapminder %>% mutate(gdp = pop * gdpPercap) %>% 
  group_by(continent) %>% 
  mutate(max_gdp = max(gdp)) %>% 
  filter(gdp == max_gdp)

# without creating new column max_gdp
gapminder %>% mutate(gdp = pop * gdpPercap) %>% 
  group_by(continent) %>% 
  filter(gdp == max(gdp))

# find max life expectant for countries in Asia
gapminder %>% filter(continent == 'Asia') %>% 
  group_by(country) %>% 
  filter(lifeExp == max(lifeExp)) %>% 
  arrange(year)



# titanic 

titanicDF = readr::read_csv('C:\\Rajeev Work\\Day 5\\titanic.csv')

# str of data frame 
str(titanicDF)


# print first 5 rows of data frame
library(dplyr)
titanicDF %>% head(5)

# find count of missing values in every column

install.packages('skimr')

library(skimr)
colSums(is.na(titanicDF))


# how many female and how many males were travelling
X=with(titanicDF,table(sex))
addmargins(X)

#R Code to find the percentage of passengers who survived
X=xtabs(~sex+survived,data=titanicDF) 
prop.table(X)*100

#R Code to find the percentage of first class passenger who survive
Temp_DF=titanicDF %>% filter(pclass==1)

Y=xtabs(~pclass+survived,data=Temp_DF) 
prop.table(Y)*100

# R Code to find the number of female/male all class passengers who survived
Temp_DF=titanicDF %>% filter(survived==1)
xtabs(~sex+pclass+survived,data=Temp_DF)

#R Code to find the percentage of female survivors from all classes
Temp_DF=titanicDF %>% filter(survived==1,sex=='female')

xtabs(~sex+pclass+survived,data=titanicDF)
prop.table(Y)

titanicDF$survived <- as.factor(titanicDF$survived)
titanicDF$pclass <- as.factor(titanicDF$pclass)
str(titanicDF)

#R Code to count the number of first-class passengers who survived the sinking of the Titanic.
count(titanicDF %>% filter(survived==1,pclass==1))

#Create a 3-way table for the variables `survived` (passengers' survival; 0=No, 1=Yes), `pclass` (passenger class; 1=Upper class, 2=Middle class, 3=Lower class) and `sex` (male and female).
table(titanicDF$survived, titanicDF$pclass, titanicDF$sex)

#Display the five-number summaries  
fivenum(titanicDF$fare)

#Display the frequency table
#Display the frequency tables for `sibsp` (number of siblings or spouses aboard Titanic) and `embarked` (port of embarkation; C=Cherbourg, Q=Queenstown, S=Southampton).
sibspTab <- table(titanicDF$sibsp)
sibspTab
embarkedTab <- table(titanicDF$embarked)
embarkedTab

#Inspect the data for unusual patterns like find passengers travelled on zero fare.
summary(titanicDF$fare==0)

#find name of passengers who paid the most expensive fare ans should be 512.33 pounds.
max(titanicDF$fare, na.rm=T)
expFare <- max(titanicDF$fare, na.rm=T)
expFare
# number of passengers that paid max fare
(1:1309)[!is.na(titanicDF$fare) & titanicDF$fare == expFare]



# names of the 4 passengers
a = 1;
expName <-array(0, dim=c(4,1))
for (i in 1 : 1309){
  if (!is.na(titanicDF$fare[i]) & titanicDF$fare[i] == expFare){
    expName[a] = titanicDF$name[i];
    a = a + 1;
  }
}
expName


#print passengers who had at least 6 family members on board, with their names.
length((1:1309)[titanicDF$sibsp + titanicDF$parch >= 6])
# names of the 33 passengers with at least 6 other family members on Titanic
bigFam <- array(0, dim=c(33,1))
a = 1;
for (i in 1 : 1309){
  if (titanicDF$sibsp[i] + titanicDF$parch[i] > 5){
    bigFam[a] = titanicDF$name[i];
    a = a + 1;
  }
}
bigFam

# print number of unique tickets
length(unique(titanicDF$ticket))

# number of tickets (bottom row) shared by number of passengers (top row)
table(table(titanicDF$ticket))


# print names of tickets that had at least 6 passengers sharing it
names(table(titanicDF$ticket))[table(titanicDF$ticket) > 5]


# print names of the 86 passengers who shared the tickets: 
shareTix <- titanicDF[titanicDF$ticket %in% names(table(titanicDF$ticket))[table(titanicDF$ticket) > 5],]
shareTix[order(shareTix$ticket),]$name







