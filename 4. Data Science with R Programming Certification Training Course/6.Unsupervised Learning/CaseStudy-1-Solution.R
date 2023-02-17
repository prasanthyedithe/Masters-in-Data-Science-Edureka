
# Installing Packages
install.packages("ClusterR")
install.packages("cluster")
install.packages("readxl")

# Loading package
library(ClusterR)
library(cluster)
library(readxl)


setwd(choose.dir())
getwd()

df <- read_excel("InsuranceData.xlsx")

set.seed(240) # Setting seed
kmeans.re <- kmeans(df, centers = 3, nstart = 20)
kmeans.re
kmeans.re$cluster


# Confusion Matrix
cm <- table(df$Age, kmeans.re$cluster)
cm

plot(df[c("Age", "Income")], 
     col = kmeans.re$cluster, 
     main = "K-means with 3 clusters")


## Plotiing cluster centers
kmeans.re$centers
kmeans.re$centers[, c("Age", "Income")]

# cex is font size, pch is symbol
points(kmeans.re$centers[, c("Age", "Income")], 
       col = 1:3, pch = 8, cex = 3) 

## Visualizing clusters
y_kmeans <- kmeans.re$cluster
clusplot(iris_1[, c("Age", "Income")],
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("Cluster iris"),
         xlab = 'Age',
         ylab = 'Income')
