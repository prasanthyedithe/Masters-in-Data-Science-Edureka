# data visualization
# helps us to understand data in graphical mannner
# bar chart, histogram, pie chart, scatter plots, line plots

install.packages("babynames")
library(babynames)
library(dplyr)
babynames
str(babynames)

# filter records where baby names are after 1950 and encode/ change F to Female and M to Male

since1950 = babynames %>% 
  filter(year >= 1950) %>% 
  mutate(sex = recode(sex, "F"="Female", "M"="Male"))

since1950

# group by name and find total of them in descending order

topnames = since1950 %>%
  group_by(name) %>%
  summarize(total = sum(n)) %>%
  arrange(desc(total)) %>%
  slice (1:1000)

topnames
install.packages("tidyverse")
library(tidyverse)
# inner join this topnames whith original dataframe and find ratio of Male Vs Female

unixsex_names_since1950 = since1950 %>%
  inner_join(topnames) %>%
  group_by(name, sex, total) %>%
  summarize(sextotal = sum(n, na.rm = T)) %>%
  spread(key=sex, value = sextotal) %>%
  mutate(ratio = (Male - Female)/ total) %>%
  filter(abs(ratio)<0.2)

unixsex_names_since1950

x = since1950 %>%
  inner_join(topnames)


topnames

on unisex.csv try to get results for these questions
1. filter all names Casey and deselect column prop and spread on sex with n
2. find the names which has least frequency (top 30)
3. find names which starts with C or c
4. find names where s is coming anywhere

dat ="J:\\DataScinceRCERTIFICATION\\unisex.csv"
unisex = read.csv(dat)

# on unisex.csv try to get results for these questions
# 1. filter all names Casey and deselect column prop and 
# spread on sex with n

str(unisex)
unique(unisex$name)
Casey = unisex %>% 
  filter(name =="Casey") %>% 
  select(-prop) %>% 
  spread(key = sex, value = n)

# 2. find the names which has least frequency (top 30)
lest_fred =unisex %>% 
  group_by(name) %>% 
  summarise(total = sum(n)) %>% 
  arrange(total) %>% 
  slice(1:30)

# 3. find names which starts with C or c

name_withc_C = unisex[grepl("[Cc]", unisex$name),]
# 4. find names where s is coming anywhere

name_s = unisex[grepl("[Ss]", unisex$name),]

dat ="/Users/abhaya/My Data/Data Science using R/Day 6/unisex.csv"
unisex = read.csv(dat)
casey = unisex %>% 
  filter(name =="Casey") %>% 
  select(-prop) %>% 
  spread(key = sex, value = n)

casey

# plot a scatter plot for Male Vs Female
install.packages("ggplot2")
library(ggplot2)
library(tidyverse)
ggplot(casey, aes(x=Male, y=Female)) + labs(title = "Unisex Name Popularity",
       x="# number of males", y="#number of females") + geom_point() +
  theme_minimal()
library(dplyr)
unisex = unisex %>%  select(-prop) %>% spread(sex, n, fill=0)
ggplot(unisex, aes(x=Male, y=Female, color=name)) + 
  geom_point() 
 #geom_smooth(method = 'lm', se=FALSE)


H = c(7,12,28,3,41)
png(file = "/Users/abhaya/My Data/Data Science using R/Day 6/barchart.png") # this will save in a file
barplot(H)
dev.off()


# month wise revenue earned by company - show in a form of bar chart

Revenue = c(7,12,28,3,41)
Month = c("Mar", "Apr", "May", "Jun", "Jul")
barplot(Revenue, names.arg=Month,xlab="Month", ylab="Revenue",col="blue",
        main="Revenue Chart", border="red")


gearCounts = table(mtcars$gear)
gearCounts

mtcars
1. plot bar chart of gear counts
2. label the above graph for x axis as "number of gears"
3. labels the bars individually in above graph ("3 gear", "4 gear", "5 gear")
4. align the above graph horizontally
5. create stacked bar plot for am Vs gear columns

# 1. plot bar chart of gear counts
library(ggplot2)

barplot(gearCounts)

# 2. label the above graph for x axis as "number of gears"
barplot(gearCounts, xlab = "number of gears")

# 3. labels the bars individually in above graph ("3 gear", "4 gear", "5 gear")
barplot(gearCounts, xlab = "number of gears", names.arg = c("3 gear", "4 gear", "5 gear"))

# 4. align the above graph horizontally
gear_transmission = table(mtcars$am, mtcars$gear)
barplot( gearCounts, xlab = "number of gears", names.arg = c("3 gear", "4 gear", "5 gear"), horiz = T)

# 5. create stacked bar plot for am Vs gear columns
barplot(gear_transmission, xlab = "number of gears", names.arg = c("3 gear", "4 gear", "5 gear"),
        legend.text = c("automatic", "manual"), beside = T)
# 6 Create a boxplot of mpg vs cylinder and give labels of x axis and y axis
names(mtcars)
mpgdata =select(mtcars, mpg, cyl)

#cylidata = select(mtcars, )
boxplot(mpg~cyl, data = mtcars, xlab = "Features", ylab ="Statistics", main = "mileage data")
# 7 Create a boxplot of mpg only
boxplot(mtcars$mpg, ylab ="m/gallo")


#  8create a scatterplot of wt vs mpg and give x and y labels and heading of the graph.
mtcars %>% 
  ggplot(aes(x = wt , y = mpg)) +
  geom_point() + 
  theme_minimal()+
  labs(x ="wt", y ="mpg")


plot(mtcars$wt, mtcars$mpg)


# home work
1. understand the terminologies of stats like (mathisfun.com)
   mean
   median
   mode
   standard deviation
   variance
   null hypothsis
   p value
   z score for finding outlieirs
   IQR method for finding outlieirs
   3 SD method for finding outlieirs
   gaussian distribution curve
   binomial distribution curve
   R2 value in linear regression
   adjusted r2 value in linear regression
   standard scaling (subtracting from mean and dividing by standard deviation)
   probability distribution
   conditional probability / Naive bayes classifier
   sampling techniques
   
2. check how to plot
   histogram
   line plots
   pie charts
   bar charts
   scatter plots
   box plots
   
attempt mcq from sanfoundry.com


   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   



