setwd(choose.dir())
getwd()
install.packages("readr")

library(readr)

data_frame <- read.delim2('RestReviews.tsv',sep="\t")

typeof(data_frame)


library(tm)
library(tmap)
library(corpus)

data <- readlines(data_frame$Review)

myCorpus<-Corpus(VectorSource(data_frame$Review))
myCorpus<-tm_map(myCorpus,removePunctuation)
myCorpus<-tm_map(myCorpus,removeNumbers)
myCorpus<-tm_map(myCorpus,content_transformer(tolower))
myCorpus<-tm_map(myCorpus,removeWords,stopwords("english"))
myCorpus<-tm_map(myCorpus,stripWhitespace)
myCorpus<-tm_map(myCorpus,stemDocument)

dtm = DocumentTermMatrix(myCorpus)
dtm
