# install.packages('dplyr')
# install.packages('swirl')
# line comment is given by #
# cntrl + shift + c after highlighting lines and to comment

x = 7 + 9
x

y = 10 - 7
y

ls() # give you all the variables defined 

?ls() # this will give you help for any fucntion

help("*")
help("bs", try.all.packages = TRUE)
help("bs", package = "splines")

# in R we dont have multiline comments
# we need to use a trick to do that

help

ls

if(FALSE){
  "this is my
  block comment"
}
mystring = "Hello World"
print(mystring)

# there are 6 data types/ data structures in R
# homogeneous elements -> every element is of same type

vectors - logical, Numeric, Integer, Character, raw, complex
        - if elements are not homogeneous, they get coerced to become homogeneous
lists
matrices
arrays
factors
Data Frames


x = TRUE
class(x) # class will give you datatype

y=FALSE
class(y)

z="TRUE" # anything in double or single quotes is treated as character
class(z)

# all numbers either int of float is stored as Numberic
# if you suffix integers with L, L means long int - datatype is integer

x=23.5
class(x)

y=10L
class(y)

z=90
class(z)

# all the ranges data by default get stored as integer 
y=1:10 # it will generate numbers between 1 and 10
print(y)
class(y)


z=as.numeric(y) #converts data to numeric type
class(z)
print(z)


x="India"
class(x)

z='123'
class(z)

z = c('a','b',10.2,100.5)
class(z)
print(z)

#--------------------------------------------------------------
# HOME WORK
#--------------------------------------------------------------

Read more about these datatypes and try in R Studio few examples of each type


vectors - logical, Numeric, Integer, Character, raw, complex
- if elements are not homogeneous, they get coerced to become homogeneous
lists
matrices
arrays
factors
Data Frames




