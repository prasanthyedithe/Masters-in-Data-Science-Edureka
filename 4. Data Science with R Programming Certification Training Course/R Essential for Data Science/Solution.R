install.packages("plyr")
install.packages("ggplot2")
install.packages("RColorBrewer")
install.packages("DAAG")


# Loading package
library(plyr)
library(ggplot2)
library(RColorBrewer)
library(DAAG)

# Module-1

A = 22
B = 34 
C = 102

vec = c(A,B,C)
mean(vec)

# Module-2
data(jobs)
head(jobs)
df = data.frame(jobs$BC,jobs$Alberta)
df
jobs[jobs$Atlantic < 950,]
order(jobs$Quebec, na.last = TRUE, decreasing = FALSE)

# Module-3
data(VADeaths)
head(VADeaths)

mean(VADeaths["Rural Female"])

head(mtcars)
lapply(mtcars, toupper)
sapply(mtcars, max)
apply(mtcars, mean)


# Module-4
#Downloading the Data for batting across all formats of cricket
library(XML)
url="http://stats.espncricinfo.com/ci/engine/stats/index.html?class=11;template=results;type=batting"
tables=readHTMLTable(url,stringsAsFactors = F)
#Note we wrote stringsAsFactors=F in this to avoid getting factor variables, 
#since we will need to convert these variables to numeric variables
table2=tables$"Overall figures"
rm(tables)
#Creating new variables from Span
table2$Debut=as.numeric(substr(table2$Span,1,4))
table2$LastYr=as.numeric(substr(table2$Span,6,10))
table2$YrsPlayed=table2$LastYr-table2$Debut
#Creating New Variables. In cricket a not out score is denoted by * which can cause data quality error. 
#This is treated by grepl for finding and gsub for removing the *. 
#Note the double \ to escape regex charachter
table2$HSNotOut=grepl("\\*",table2$HS)
table2$HS2=gsub("\\*","",table2$HS)


# Module-5

data("mtcars")
my_data <- mtcars[, c(1,3,4,5,6,7)]
# print the first 6 rows
head(my_data, 6)
res <- cor(my_data)
round(res, 2)
