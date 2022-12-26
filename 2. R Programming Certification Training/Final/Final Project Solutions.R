# Final Project 
setwd(choose.dir())
getwd()


# Load the required libraries 
library(readr)
library(ggplot2)

# Load the dataset 'projectdata.csv' and call it p
p = read.csv("projectdata.csv")

# Look at the structure of the dataset
str(p)

# Change the description variable from factor to character
p$description = as.character(p$description)

# Re-look at the structure of the dataset
str(p)

# Explore the data - which variables have missing values and what is the count of these missing values
summary(p)

#check the number of unique values in each column
apply(p,2,function(x) length(unique(x)))

# what is the median price
median(p$startprice)

#add a variable priceclass, which takes value 1 if the price is above median value, or 0 otherwise
p$priceclass <- ifelse(p$startprice>=170.5, 1, 0)

# Re-look at the structure of the dataset
str(p)

#convert categorical variables to factor
cols = c("biddable", "sold", "priceclass")
for(i in cols){
  p[,i]=as.factor(p[,i])
}

# Re-Check structure
str(p)

# Find Maximum value of all numerical variables
apply(p[,c(3,8)], 2, max, na.rm= TRUE)

# Find Maximum value of all categorical variables
apply(p[,c(4:7, 9,10,12)], 2, max, na.rm= TRUE)

# use lapply function to Calculate Median of each of the numerical variables
lapply(p[,c(3,8)], function(x) median(x, na.rm = TRUE))

# use lapply function to Calculate standard deviation of each of the numerical variables
lapply(p[,c(3,8)], function(x) sd(x, na.rm = TRUE))

# use the tapply function to calculate the median price according to sold
tapply(p$startprice,p$sold,median)

# use the tapply function to calculate the median price according to biddable
tapply(p$startprice,p$biddable,median)

# Load the dplyr package 
library(dplyr)

# Print out a df with the columns startprice, condition, and sold.
select(p, startprice, condition, sold)

# Print out the columns biddable to sold
select(p, biddable:sold)

#mutate
# Add the new variable var1 which calculates the ratio of storage to startprice and save the result in p.
p <- mutate(p, var1 = startprice/storage)

# Arrange p by price
arrange(p, startprice)

# Arrange p so that condition is grouped
arrange(p, condition)

# Arrange p so that biddable and sold is is grouped
arrange(p, biddable,sold)

# Definition of notbought - create a df of observations when ipad was notpurchased
notbought <- filter(p, sold == "1")

# Arrange notbought so that condition and sold is is grouped
arrange(notbought, condition, sold)

# Generate summary about startprice column of p
summarise(p, 
          minimum = min(startprice), 
          average = mean(startprice), 
          max = max(startprice), 
          sd = sd(startprice),
          inter = IQR(startprice))

# Generate summary about storage column of housing
summarise(p, 
          minimum = min(storage), 
          average = mean(storage), 
          max = max(storage), 
          sd = sd(storage),
          inter = IQR(storage))

#### Visualization ###
# Load the necessary package 
library(ggplot2)   

# Create a scatter plot between startprice and storage 
ggplot(p, aes(x = storage, y = startprice)) +
  geom_point()

# In the above plot, add the color argument which should be dependent on the sold Variable
ggplot(p, aes(x = storage, y = startprice, color = sold)) +
  geom_point()

# In the above plot where you had used the color argument, please add the smooth line using the geom_smooth() function
ggplot(p, aes(x = storage, y = startprice, color = sold)) +
  geom_point() +
  geom_smooth()

# Make a univariate histogram on startprice
ggplot(p, aes(startprice)) +
  geom_histogram()

# In the above plot, add set binwidth to 200 in the geom layer
ggplot(p, aes(startprice)) +
  geom_histogram(binwidth = 200)

# In the above plot,  MAP ..density.. to the y aesthetic (i.e. in a second aes() function)
ggplot(p, aes(startprice)) +
  geom_histogram(aes(y = ..density..), binwidth = 200)

# Now, In the above plot, plus SET the fill attribute to "#377EB8"
ggplot(p, aes(startprice)) +
  geom_histogram(aes(y = ..density..), binwidth = 200, fill = "#377EB8")

# Draw a bar plot of sold, filled according to biddable
ggplot(p, aes(x = sold, fill = biddable)) +
  geom_bar()

# In the previous plot, Change the position argument to "stack""
ggplot(p, aes(x = sold, fill = biddable)) +
  geom_bar(position = "stack")

# Change the position argument to "fill""
ggplot(p, aes(x = sold, fill = biddable)) +
  geom_bar(position = "fill")

# Change the position argument to "dodge""
ggplot(p, aes(x = sold, fill = biddable)) +
  geom_bar(position = "dodge")

##Faceting
# Now create a basic scatter plot between pce and psavert variables on econ_2:
p2 <- ggplot(p, aes(x = storage, y = startprice)) +
  geom_point()

# Separate rows according to sold
p2 +
  facet_grid(sold ~ .)

# Separate columns according to biddable
p2 +
  facet_grid(. ~ biddable)

# Separate by both columns and rows 
p2 +
  facet_grid(sold ~ biddable)

### Text Analytics ###
#load the required packages and libraries
library(tm)
library(SnowballC)
library('stringr')
library('readr')
library('wordcloud')
library('tm')
library('SnowballC')
library(DT)

#Now, extract the relevant variable, the one containing the text.
r1 = as.character(p$description)
#Set the seed to 100 for code reproducibility
set.seed(100)
# run the following command, 'sample = sample(r1, (length(r1)))', in your RStudio, now you are ready for Bag of Words
sample = sample(r1, (length(r1)))

#Data Preprocessing using Bag of Words Technique

# Create a Corpus - which, in simple terms, is nothing but a collection of text documents.
corpus = Corpus(VectorSource(list(sample)))

# Now, remove punctuations
corpus = tm_map(corpus, removePunctuation)

# Next, change the case of the word to lowercase so that same words are not counted as different because of lower or upper case.
corpus = tm_map(corpus, content_transformer(tolower))


# Next, remove numbers 
corpus = tm_map(corpus, removeNumbers)

# Next, remove whitespaces
corpus = tm_map(corpus, stripWhitespace)

# Now, remove unhelpful terms, also referred as stopwords
corpus = tm_map(corpus, removeWords, stopwords('english'))

# Now, please carry out the process of stemming, motivated by the desire to represent words with different endings as the same word.
corpus = tm_map(corpus, stemDocument)

# creat a document term matrix from the corpus
frequencies = DocumentTermMatrix(corpus)

# now create the data frame from the output of the above line
alldescription = as.data.frame(as.matrix(frequencies))

# Create a word cloud and set random.order = TRUE:
wordcloud(colnames(alldescription), colSums(alldescription), random.order=TRUE)

# Create a word cloud and set random.order = FALSE:
wordcloud(colnames(alldescription), colSums(alldescription), random.order=FALSE)

# In the above word cloud, adjust the frequency level with min.freq parameter set at 5 
wordcloud(colnames(alldescription), colSums(alldescription), random.order=FALSE, min.freq=5)


##### Creating Word Cloud for Soldipads ####
#craete a new dataframe from the original data 'p' which only includes those observations where the ipad was not sold
notsoldipads = subset(p, sold == 0)

#Run the follwoing commands in your R Studio 

#extracting relevant negative tweets as character
n1 = as.character(notsoldipads$description)
#Set the seed to 100 for code reproducibility
set.seed(100)
#sample
sample2 = sample(n1, (length(n1)))


#Bag of Words - Run the above codes
#1 -  Create a Corpus
#2 -  Remove punctuations
#3 -  Convert to lowercase
#4 -  Remove Numbers
#5 -  Remove whitespaces
#6 -  Remove stopwords
#7 -  Perform Stemming
corpus2 = Corpus(VectorSource(list(sample2)))
corpus2 = tm_map(corpus2, removePunctuation)
corpus2 = tm_map(corpus2, content_transformer(tolower))
corpus2 = tm_map(corpus2, removeNumbers)
corpus2 = tm_map(corpus2, stripWhitespace)
corpus2 = tm_map(corpus2, removeWords, stopwords('english'))
corpus2 = tm_map(corpus2, stemDocument)

#creat a document term matrix from the resultant corpus
frequencies2 = DocumentTermMatrix(corpus2)
# now create the data frame from the output of the above line
notsold = as.data.frame(as.matrix(frequencies2))

# Create three word clouds using the following three instructions
# WordCloud 1  -  Create a word cloud and set random.order = TRUE. 
# WordCloud 2  -  Create a word cloud and set random.order = FALSE
# WordCloud 3  -  In the above word cloud, adjust the frequency level with min.freq parameter set at 5 

wordcloud(colnames(notsold), colSums(notsold), random.order=TRUE)
wordcloud(colnames(notsold), colSums(notsold), random.order=FALSE)
wordcloud(colnames(notsold), colSums(notsold), random.order=FALSE, min.freq=5)

##### Creating Word Cloud for sold ipads ####
#craete a new dataframe from the original data 'p' which only includes those observations where the ipad was sold
p_sold = subset(p,sold == 1)

#Now, run the follwoing commands in your R Studio 
#extracting relevant positive tweets
p1 = as.character(p_sold$description)
#Set the seed to 100 for code reproducibility
set.seed(100)
#sample
sample3 = sample(p1, (length(p1)))


#Bag of Words - Run the above codes
#1 -  Create a Corpus
#2 -  Remove punctuations
#3 -  Convert to lowercase
#4 -  Remove Numbers
#5 -  Remove whitespaces
#6 -  Remove stopwords
#7 -  Perform Stemming 
corpus3 = Corpus(VectorSource(list(sample3)))
corpus3 = tm_map(corpus3, removePunctuation)
corpus3 = tm_map(corpus3, content_transformer(tolower))
corpus3 = tm_map(corpus3, removeNumbers)
corpus3 = tm_map(corpus3, stripWhitespace)
corpus3 = tm_map(corpus3, removeWords, stopwords('english'))
corpus3 = tm_map(corpus3, stemDocument)


#creat a document term matrix from the resultant corpus
frequencies3 = DocumentTermMatrix(corpus3)

# now create the data frame from the output of the above line
soldipads = as.data.frame(as.matrix(frequencies3))

# Create three word clouds using the following three instructions
# WordCloud 1  -  Create a word cloud and set random.order = TRUE. 
# WordCloud 2  -  Create a word cloud and set random.order = FALSE
# WordCloud 3  -  In the above word cloud, adjust the frequency level with min.freq parameter set at 5 
wordcloud(colnames(soldipads), colSums(soldipads), random.order=TRUE)
wordcloud(colnames(soldipads), colSums(soldipads), random.order=FALSE)
wordcloud(colnames(soldipads), colSums(soldipads), random.order=FALSE, min.freq=5)



  


