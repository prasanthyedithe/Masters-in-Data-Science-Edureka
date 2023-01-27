inbuild functions
-------------------
  
na means missing value (NA means missing value)
  
mean(container, trim=0, na.rm = TRUE/FALSE)
trim is used to drop observations form both ends of the sorted vector


x=c(1,2,3,4)
mean(x)

x=c(1,2,3,4,NA) # whenever we have NA, mean in NA if we do not give na.rm = TRUE
mean(x)

x=c(1,2,3,4, NA) # it is going to delete the missing value and then find mean
mean(x, na.rm = TRUE)

median - means middle value
median(container, na.rm=TRUE/FALSE)

x=c(1,2,3,4)
median(x)

# for finding mode we need to use tabulate function - i will discuss when i will discuss dataframe

x=c(1,3,4,5,11,22,33,44)
max(x)
min(x)
sd() for standard deviation
var() for variance
quantile() for quantile

x=c(9,9,8,3,4,5,2)
quantile(x, probs = c(.25,.5,.75))

to find outiers
------------------
IQR method is for finding outiers
3 SD technique
box plot
Z score


age column - 1 to 100 yrs, one age is there 1000

Data Frames - contains two dimentional data/ every column has its own datatype 
==============
# variable means columns # obs means rows
BMI = data.frame(gender = c('Male', 'Female', 'Male', 'Female'),
                 height = c(152,136,155,132),
                 weight = c(81,56,78,80),
                 Age = c(42,41,39,32))

class(BMI)
dim(BMI) # dimentions of data frame rows Vs column
BMI
BMI[1] # fetch the first column
BMI[2] # fetch the second column
BMI[2,3] # 2nd row and 3rd colum
BMI[c(1,2)] # prints 1 and 2 column
BMI[seq(1,2)]
BMI[seq(1,3)]
str(BMI) # structure of a dataframe
ncol(BMI) # number of columns in BMI
nrow(BMI) # number of rows in BMI

df = data.frame(name=c('Anuj', 'Kiran', 'Suman', 'John'),
                score = c(67,45,33,11))
df
df[1:2,2] #it will fetch 1st and 2nd row and 2nd col
is.na(df) # give true and false if missing values are thre
table(is.na(df)) # gives table of logical o/p
# if we want to fetch any column by the name of column we use $ symbol

df$score
df$name
mean(df$score)
# if we want to find mean after removing missing values
mean(df$score, na.rm = TRUE)
# if we want data frame with missing values
# all rows will be deleted which is having missing values (python dropna())
new_df = na.omit(df)
new_df

# if we want sum of missing values column wise (python df.isna().sum())

colSums(is.na(df))

# iris - type of flower and it has got 3 species
# setosa, versicular, verginca
# scientist find these species by differentiating between sepal length
# sepal width, petal length and petal width
# 150 rows and 4 columns

# species is a dependent variable
# Sepal.Length Sepal.Width Petal.Length Petal.Width - independent var

data("iris")
summary('iris')

str(iris)

iris$Petal.Length
hist(iris$Petal.Length)
summary(iris$Sepal.Length)
var(iris$Sepal.Length)
sd(iris$Sepal.Length)
mean(iris$Sepal.Length)
# write.csv is saving dataframe into our local disk 
write.csv(iris, "/Users/abhaya/My Data/Data Science using R/Day 4/mydata.csv")

# sort any column

sort(iris$Sepal.Length)
iris[,] # all rows and all columns
iris[1,1]
iris[1,]
iris[c(2,4,6),]
iris[,c(2,4)]
# i want to find records where species is Setosa
iris[(iris$Species == 'setosa'), ]
# i want to find records where sepal length > 4
iris[(iris$Sepal.Length > 4),]

# i want to find records where species is Setosa or sepal length > 4

iris[(iris$Sepal.Length > 4) | (iris$Species=='setosa'),]

# i want to find records where species is Setosa and sepal length > 4
iris[(iris$Sepal.Length > 4) & (iris$Species=='setosa'),]

iris[c(1,2),c(3,4)] # first and second row from column 3,4
iris[1,"Sepal.Length"]
iris[iris$Species!='setosa',]

# between 4 and 5
iris[(iris$Sepal.Length > 4) & (iris$Sepal.Length<5),]


df = read.csv('/Users/abhaya/My Data/Data Science using R/Day 4/student_raw.csv')
str(df)

#convert all ones in any case to 1 and twos in any case to 2
names(df)
head(df)
str(df)

df$Section <- tolower(df$Section)
df[df=="one"] <- 1
df[df=="two"] <- 2

# I want the percentages of all the students in a separate column called percentage	

df$percentage = (df$Maths +df$Science +df$English)/3


#I want to filter class 1 and class 2 students 
#separately and store in two different data frames df1 and df2

df1=df[(df$Section==1),]
df2 = df[df$Section==2,]


## I want topper of class 1 in maths
df1[(df1$Maths==max(df1$Maths)), ]


#I want topper of class 2 in English

df2[(df2$English==max(df2$English)), ]


#I want overall topper in class 1
df1[(df1$percentage==max(df1$percentage)), ]

#I want overall topper in class 2
df2[(df2$percentage==max(df2$percentage)), ]

#I want names of the students which starts with A along with their classes

df[grep("^A", df$Name), ] # ^-means starting with

#convert all ones in any case to 1 and twos in any case to 2
names(df)
head(df)
str(df)

df$Section <- tolower(df$Section)
df[df=="one"] <- 1
df[df=="two"] <- 2

# I want the percentages of all the students in a separate column called percentage	
df$percentage = (df$Maths +df$Science +df$English)/3


#I want to filter class 1 and class 2 students 
#separately and store in two different data frames df1 and df2
df1=df[(df$Section==1),]
df2 = df[df$Section==2,]

## I want topper of class 1 in maths
df1[(df1$Maths==max(df1$Maths)), ]

#I want topper of class 2 in English
df2[(df2$English==max(df2$English)), ]

#I want overall topper in class 1
df1[(df1$percentage==max(df1$percentage)), ]

#I want overall topper in class 2
df2[(df2$percentage==max(df2$percentage)), ]

#I want names of the students which starts with A along with their classes
df[grep("^A", df$Name), ] # ^-means st

#I want names of the students which ends with n along with their classes
df[grep("n$", df$Name), ] ##  $- means ending with



#I want names of all the students who failed in class 1 in any
#of the subjects (fail means less than 40% marks in a subject)
df[(df$Maths<40) | (df$Science<40) | (df$English<40), ]

#I want names of the students in class 1 who failed in all the subjects
df1[(df1$Maths<40) & (df1$Science<40) & (df1$English<40), ]
# No one failed

#I want name and class of students who failed in maths but passed in English and Science		


df[(df$Maths<40) & (df$Science>=40) & (df$English>=40), ]

dplyr -> filtering
ls | grep "a" # this means o/p of one command becomes input for another
ls | wc - l

df %>% filter(class 1 students) %>% (people who passed in maths) %>% (find name of topper)


