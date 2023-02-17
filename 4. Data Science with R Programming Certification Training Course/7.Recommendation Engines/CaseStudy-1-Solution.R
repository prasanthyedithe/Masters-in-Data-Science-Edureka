############# TASK1 ##########################

# Installing Packages
install.packages("arules")
install.packages("arulesViz")

# Loading package
library(arules)
library(arulesViz)



data("AdultUCI")
View(AdultUCI)
dim(AdultUCI)
class(AdultUCI)

str(AdultUCI)
summary(AdultUCI)

## Discretization using the cut() function

AdultUCI$age  <- ordered(cut(AdultUCI[["age"]], c(15,25,45,65,100)), labels = c("Young", "Middle-aged", "Senior", "Old"))
AdultUCI$"capital-gain" <- ordered(cut(AdultUCI[[ "capital-gain"]], c(-Inf, 0, median(AdultUCI[[ "capital-gain"]][AdultUCI["capital-gain"] > 0 ]),Inf)), labels = c("None", "Low", "High"))
AdultUCI[[ "capital-loss"]] <- ordered(cut(AdultUCI[[ "capital-loss"]],
                                           c(-Inf,0, median(AdultUCI[[ "capital-loss"]][AdultUCI[[ "capital-loss"]]>0]),Inf)),
                                       labels = c("none", "low", "high"))

AdultUCI_mean <-AdultUCI 
AdultUCI_interval <-  AdultUCI
AdultUCI_freq <- AdultUCI 



AdultUCI$"hours-per-week" <- ordered(cut(AdultUCI[["hours-per-week"]],c(0,40,60,101)),labels=c("part-time","full-time", "overtime"))



AdultUCI_mean$"hours_mean" <- ordered(cut(AdultUCI_mean[[ "hours-per-week"]], c(-Inf, 5, mean(AdultUCI_mean[[ "hours-per-week"]][AdultUCI_mean["hours-per-week"] > 0 ]),Inf)), labels = c("parttime", "fulltime", "overtime"))
summary(AdultUCI_mean$hours_mean)


AdultUCI[["fnlwgt"]] <- NULL
AdultUCI_mean[["fnlwgt"]] <- NULL
AdultUCI[["education-num"]] <-NULL
AdultUCI_mean[["education-num"]] <-NULL
AdultUCI_mean[["hours-per-week"]]<-NULL


## Discretization using the discretize() function
AdultUCI_interval[[ "hours-per-week"]] <- discretize(AdultUCI_interval$"hours-per-week", method ='interval', breaks = 2);
AdultUCI_freq [[ "hours-per-week"]] <- discretize(AdultUCI_freq$"hours-per-week", method ='frequency', breaks = 2);

#Deleting the variables which were disretizied 
AdultUCI_interval[["fnlwgt"]] <- NULL
AdultUCI_freq[["fnlwgt"]] <- NULL
AdultUCI_interval[["education-num"]] <-NULL
AdultUCI_freq[["education-num"]] <-NULL

#Converting the data from the data.frame into the transaction
adultTR <- as(AdultUCI, "transactions")
adultTR_mean <- as(AdultUCI_mean, "transactions")
adultTR_interval <-as(AdultUCI_interval, "transactions")
adultTR_freq <- as(AdultUCI_freq, "transactions")

inspect(head(adultTR))
summary(adultTR)
summary(adultTR_mean)
summary(adultTR_interval)

## Analysis of the transactional data

freqTbl  = itemFrequency(adultTR, type = "relative") #data discretized using the cut() function
str(freqTbl)
summary(freqTbl)
print(freqTbl)

freqTbl_mean  = itemFrequency(adultTR_mean, type = "relative") #data discretized using the mean
str(freqTbl_mean)

freqTbl_interval = itemFrequency(adultTR_interval, type = "relative") #data discretized using the intervals
str(freqTbl_interval)

freqTbl_freq = itemFrequency(adultTR_freq, type = "relative") #data discretized using the frequency
str(freqTbl_freq)

#Sorting elements by the support
freqTbl = sort(freqTbl, decreasing= TRUE)
print(freqTbl)

freqTbl_mean = sort(freqTbl_mean, decreasing= TRUE)
print(freqTbl_mean)


freqTbl_interval = sort(freqTbl_interval, decreasing = TRUE)
print(freqTbl_interval)

freqTbl_freq = sort(freqTbl_freq, decreasing = TRUE)
print(freqTbl_freq)


#Plotting the results
itemFrequencyPlot(adultTR, type ="relative", support= 0.2)
itemFrequencyPlot(adultTR_mean, type ="relative", support= 0.2)
itemFrequencyPlot(adultTR_interval, type ="relative", support= 0.2)
itemFrequencyPlot(adultTR_freq, type ="relative", support= 0.2)

## Mining the frequent itemsets

#Setting the parameters
aParam  = new("APparameter", "confidence" = 0.6, "support" =0.5, "minlen"= 1, maxtime = 20) 
print(aParam)
aParam@support <- 0.3
aParam@confidence <-0.8
aParam@target ="frequent itemsets"

#Apriori algorithm
asets_user <-apriori(adultTR,aParam) #data discretized using the cut() function
asets_mean <-apriori(adultTR_mean,aParam) #data discretized using the mean
str(asets_user)
str(asets_mean)

asets_interval <-apriori(adultTR_interval,aParam)#data discretized using the interval
asets_freq <-apriori(adultTR_freq,aParam) #data discretized using the frequency
str(asets_interval)
str(asets_freq)

#Comparing the lenght of frequent itemsets
length(asets_user)
length(asets_mean)
length(asets_interval)
length(asets_freq)


#Summary of the results
summary(asets_user)
summary(asets_mean)
summary(asets_interval)
summary(asets_freq)

#Inspecting first 10 rules by support
inspect(head(sort(asets_user, by="support"),10))
inspect(head(sort(asets_mean, by="support"),10))
inspect(head(sort(asets_interval, by="support"),10))
inspect(head(sort(asets_freq, by="support"),10))




############# TASK2 ##########################
library(recommenderlab)
library(ggplot2)
library(data.table)
library(reshape2)


setwd(choose.dir())
getwd()

movie_data = read.csv("movie.csv",stringsAsFactors = TRUE)
rating_data = read.csv("rating.csv")

str(movie_data)
str(rating_data)
summary(movie_data)
summary(rating_data)

##Data Preprocessing

# Taking genres column from movie_data and storing it in movie_genre data frame
movie_genre = as.data.frame(movie_data$genres , stringsAsFactors=FALSE)
library(data.table)

# converting list to data frame and splitting genres
movie_genre2 <- as.data.frame(tstrsplit(movie_genre[,1], '[|]', type.convert=TRUE), stringsAsFactors=FALSE)

# giving column names to movie_genre2
colnames(movie_genre2) <- c(1:10)

list_genre <- c("Action", "Adventure", "Animation", "Children", "Comedy", "Crime","Documentary", "Drama", "Fantasy", "Film-Noir", "Horror", "Musical", "Mystery", "Romance","Sci-Fi", "Thriller", "War", "Western")

# creating a matix with all zeroes with rowsize as movie ids length and column as types of genres 
genre_mat1 <- matrix(0,10330,18)
genre_mat1[1,] <- list_genre
colnames(genre_mat1) <- list_genre

# converting data in movie_genre2 to 0's and 1's as per the column names in genre_mat1
for(index in 1:nrow(movie_genre2)){
  for(col in 1:ncol(movie_genre2)){
    gen_col = which(genre_mat1[1,] == movie_genre2[index,col])
    genre_mat1[index+1,gen_col] = 1
  }
}

# removing first row which is genre list
genre_mat2 = as.data.frame(genre_mat1[-1,] , stringsAsFactors = FALSE)

# converting columns to integers from characters
for(col in 1:ncol(genre_mat2)){
  genre_mat2[,col] = as.integer(genre_mat2[,col])
}

# confirming the type of each column has changed to integer
str(genre_mat2)


SearchMatrix = cbind(movie_data[,1:2] , genre_mat2[])
head(SearchMatrix)

ratingMatrix <- dcast(rating_data,userId~movieId, value.var = "rating", na.rm=FALSE)
ratingMatrix <- as.matrix(ratingMatrix[,-1]) #remove userIds

#Convert rating matrix into a recommenderlab sparse matrix which is realRatingMatrix class
ratingMatrix <- as(ratingMatrix, "realRatingMatrix")
ratingMatrix

recommendation_model = recommenderRegistry$get_entries(dataType = "realRatingMatrix")
names(recommendation_model)

lapply(recommendation_model , '[[' , "description")


recommendation_model$IBCF_realRatingMatrix



similaritY_mat = similarity(ratingMatrix[1:4,],method = "cosine",which="users")
as.matrix(similaritY_mat)
image(as.matrix(similaritY_mat),main="Users Similarities")
