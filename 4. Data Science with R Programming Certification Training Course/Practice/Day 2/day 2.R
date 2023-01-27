what is a differene between ML and deep learning

1,2,3,4,9,100 -> single dimentional data

SQL table rows Vs columns, excel sheet -> 2 dimentional data

image - pixels - 3 values of every pixel - RGB - 3 dimentional data 0-255

ML fails when we deal with multidimentional data
Deep learning can take care of multidimentional data

this dimnetionality problem is called as curse of dimentionality

feature selection/ column selection is a manual process in ML
feature selection is automatic in Deep Learning

Linear Regression - p value (null hypothesis) if p value is < 0.05 column is significant/ important
decision trees - feature importances 

KMeans - is unsupervised ML algorithm

for finding outliers we use

Homework
------------------------------
3 Standard Deviation technique 
IQR method
Z Score
Box plot

-------------------------------
  
# numeric has higher precedence as compared to integer
a = c(100L, 10,10.2,10L)
class(a)
  
integer has higher precedence as compared to logical
a = c(100L, TRUE)
class(a)
  
a = c(100L, TRUE, 'India')
class(a)

a = c(100L, 10.2)
class(a)

  
Character -> Numeric -> integer -> logical

# to check the datatype we can use is clause

a=10
is.numeric(a)

dt = as.Date("28-02-2009")
class(dt)

inbuild functions
------------------
name = 'Amit'
nchar(name) # number of characters in name

rep('A', 10)
rep(1:6,2)

vect1 = c(1,2,3)
vect2 = c(10,20,30)
vect1 + vect2

vect1 = c(1,2,3)
vect2 = c(10,20,30,22)
vect1 + vect2

we can slice vectors

vect1 = c(1,2,35,66,55,44,23,34,56,77)
vect1[1:5]

# in python
range(1,10) # go from 1 to 9
range(1,10,2) # go from 1 to 9 with the jump of 1 value

# operators < > <= >= == !=
!x not of x
x & y means x and y
isTRUE(x) -> true if x is true


x = c(1,10)
x>5 # returns a boolean vector

x = c(1:10)
x>5
x[(x>5)] # whereever its true it fetches the value
  
name = 'Amit Kumar'

find all upper case letters 
find all lower case letters
find vowels (upper or lower either of it)
  
mystring <- "Amit Kumar"
lst = unlist(strsplit(mystring,"")) # having individual chars
print(lst)
class(lst)
index_list = unlist(gregexpr("[A-Z]",mystring)[[1]]) # [[1]] fetches index locations
lst[index_list] # fetching values at that index location

index_list = unlist(gregexpr("[a-z]",mystring)[[1]])
lst[index_list]


index_list = lst %in% c('A','E','I','O','U','a','e','i','o','u')
lst[index_list]

# while loop 
# runs infinitely till condition is true

# { starts from where conditional statement is there
# fibonacci series
a=0
b=1
while(b<20){
  print(b)
  temp = a+b
  a=b
  b=temp
}

# i want to find square root of numbers between 1 and 10

i=1
while(i<=10){ # while loop can be an infinite loop
  print(sqrt(i))
  i=i+1
}

for(x in c(1:10)){ # in for loop we know how many times loop will run
  print(sqrt(x))
}

x=c(2,3,5,9,19,9,10)
count=0
for(val in x){ # val is a temp variable here which picks one by one each value from container
  if (val%%2 == 0){. ## %% means modulus or remainder
    print(val)
  }
}

# program to print table of a number entered by user
num = as.integer(readline(prompt = "Please enter any number : "))
for(i in 1:10){
  print(paste(num, ' X ', i, " = ", num*i))
}


# take 3 numbers from user and find the greatest among them


num1 = as.integer(readline(prompt = "Please enter any number : "))
num2 = as.integer(readline(prompt = "Please enter any number : "))
num3 = as.integer(readline(prompt = "Please enter any number : "))

if(num1>num2 & num1>num3){
print(paste(num1, "is greatest"))
}else if (num2>num1 & num2>num3){
  print(paste(num2, "is greatest"))
}else{
  print(paste(num3, "is greatest"))
}


Home work
Read more about

3 Standard Deviation technique
IQR method
Z Score
Box plot

Module 1 and 2 - cover all slides from LMS 
attempt atleast 100 questions from sanfoundry.com
https://www.sanfoundry.com/1000-r-programming-questions-answers/


