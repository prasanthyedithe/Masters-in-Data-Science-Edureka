# load twitter library - the rtweet library is recommended now over twitteR
library(rtweet)
# plotting and pipes - tidyverse!
library(ggplot2)
library(dplyr)
# text mining library
library(tidytext)

setwd(choose.dir())
getwd()

######## You should do the following to create the above shiny output: 

#1.Load the required libraries and the data and call the dataframe ‘tweets’.

tweets = read.csv("tweets.csv")
View(tweets)
class(tweets)

#2. Understand the data structure and provide concise summary on the following 
head(tweets)
summary(tweets)
names(tweets)
str(tweets)

#3.Setting up before text processing. Run the following lines of codes
r1 = as.character(tweets$Tweet)
set.seed(100)
sample = sample(r1, (length(r1)))
sample

#4.Data Preprocessing using Bag of Words Technique
library(tm)

tweets_v3 = read.csv("tweets.csv")
str(tweets_v3)
tweets_v4 <- tweets_v3$Tweet

tweets_for_mining <- VectorSource(tweets_v4)

tweets_Corps2 <- VCorpus(tweets_for_mining)
print(tweets_Corps2)

v1 <- tm_map(tweets_Corps2, removePunctuation)
v1[[3]][1]

v <- tm_map(tweets_Corps2, tolower)
v[[3]][1]

v2 <- tm_map(tweets_Corps2, removeNumbers)
v2[[3]][1]


v3 <- tm_map(tweets_Corps2, stripWhitespace)
v3[[3]][1]

tdm <- TermDocumentMatrix(tweets_Corps2,
                          control = list(removePunctuation = TRUE,
                                         stopwords = TRUE))
tdm


tweets_Corps2 <- VCorpus(tweets_for_mining)
print(tweets_Corps2)
stem_document <- stemDocument(tweets_Corps2)
stem_document

DocumentTermMatrix(tweets_Corps2)

dtm <- DocumentTermMatrix(tweets_Corps2)
class(dtm)
library(tidytext)
data_frame <- tidy(dtm)
class(data_frame)

# 5. Now, create three different wordclouds using the following arguments
# Install
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")


dtm <- TermDocumentMatrix(tweets_Corps2)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=TRUE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))


wordcloud(words = d$word, freq = d$freq, min.freq = 5,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))


###########Text Mining and Visualization for negative Tweets

tweets_v4 = read.csv("tweets.csv")
class(tweets_v4)
negativeTweets = dplyr::filter(tweets_v4, Avg < 0)
View(negativeTweets)

#2. Now, Run the follwoing commands in your R Studio

n1 = as.character(negativeTweets$Tweet)
set.seed(100)
sample2 = sample(n1, (length(n1)))
sample2

#3.Next, run the following Data Preprocessing tasks
install.packages("rtweet")
install.packages("tidytext")
install.packages("tidyverse")

library(rtweet)
library(tidytext)
library(tidyverse)

tweets_myCorpus <- tweets_v4$Tweet

tweets_for_mining <- VectorSource(tweets_myCorpus)

tweets_Corps2 <- VCorpus(tweets_for_mining)
print(tweets_Corps2)

v1 <- tm_map(tweets_Corps2, removePunctuation)
v1[[3]][1]

v <- tm_map(tweets_Corps2, tolower)
v[[3]][1]

v2 <- tm_map(tweets_Corps2, removeNumbers)
v2[[3]][1]


v3 <- tm_map(tweets_Corps2, stripWhitespace)
v3[[3]][1]

tdm <- TermDocumentMatrix(tweets_Corps2,
                          control = list(removePunctuation = TRUE,
                                         stopwords = TRUE))
tdm


tweets_Corps2 <- VCorpus(tweets_for_mining)
print(tweets_Corps2)
stem_document <- stemDocument(tweets_Corps2)
stem_document

DocumentTermMatrix(tweets_Corps2)

dtm <- DocumentTermMatrix(tweets_Corps2)
class(dtm)
library(tidytext)
data_frame <- tidy(dtm)
class(data_frame)

#4.Now, create three different wordclouds using the following arguments
dtm <- TermDocumentMatrix(tweets_Corps2)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=TRUE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))


wordcloud(words = d$word, freq = d$freq, min.freq = 5,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

###########Text Mining and Visualization for Positive Tweets

library(tm)

tweets_v4 = read.csv("tweets.csv")
class(tweets_v4)
positiveTweets = dplyr::filter(tweets_v4, Avg > 0)
View(positiveTweets)

#2. Now, Run the follwoing commands in your R Studio

n1 = as.character(positiveTweets$Tweet)
set.seed(100)
sample2 = sample(n1, (length(n1)))
sample2

#3.Next, run the following Data Preprocessing tasks
install.packages("rtweet")
install.packages("tidytext")
install.packages("tidyverse")

library(rtweet)
library(tidytext)
library(tidyverse)

tweets_myCorpus <- positiveTweets$Tweet

tweets_for_mining <- VectorSource(tweets_myCorpus)

tweets_Corps2 <- VCorpus(tweets_for_mining)
print(tweets_Corps2)

v1 <- tm_map(tweets_Corps2, removePunctuation)
v1[[3]][1]

v <- tm_map(tweets_Corps2, tolower)
v[[3]][1]

v2 <- tm_map(tweets_Corps2, removeNumbers)
v2[[3]][1]


v3 <- tm_map(tweets_Corps2, stripWhitespace)
v3[[3]][1]

tdm <- TermDocumentMatrix(tweets_Corps2,
                          control = list(removePunctuation = TRUE,
                                         stopwords = TRUE))
tdm


tweets_Corps2 <- VCorpus(tweets_for_mining)
print(tweets_Corps2)
stem_document <- stemDocument(tweets_Corps2)
stem_document

DocumentTermMatrix(tweets_Corps2)

dtm <- DocumentTermMatrix(tweets_Corps2)
class(dtm)
library(tidytext)
data_frame <- tidy(dtm)
class(data_frame)

#4.Now, create three different wordclouds using the following arguments
dtm <- TermDocumentMatrix(tweets_Corps2)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=TRUE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))


wordcloud(words = d$word, freq = d$freq, min.freq = 5,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))



