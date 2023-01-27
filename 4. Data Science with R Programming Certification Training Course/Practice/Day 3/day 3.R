# find the area of a circle and if area < 20 print "sorry"
# if area is between 20 and 100 print "hello"
# otherwise print bye

# there is no break statement in R

r = readline()
r = as.integer(r)
area = pi*r^2 # in r ^ means power of 
print(paste0("vale of area is ", area))
if (area<20){
  print("sorry")
}else if (area>20 && area<100){
  print("hello")
}else{
  print("bye")
}

# factorial of a number 
# factorial of 5 :- 5*4*3*2*1

num = as.integer(readline(prompt = "Please enter any number : "))
factorial = 1
if (num<0){
  print("Sorry factorial does not exist for negative numbers ")
}else if (num == 0){
  print("factorial of 0 is 1")
}else{
  for (i in 1:num){
    factorial = factorial*i
  }
  print(paste0("factorial is ", factorial))
}



if(print(1)){print(2)}else{print(3)}
if(FALSE && print(1)){print(2)}else{print(3)} # in && condition if first condition is false, second is not seen
if(TRUE && print(1)){print(2)}else{print(3)}
if(TRUE && !print(1)){print(2)}else{print(3)}
if(FALSE && !print(1)){print(2)}else{print(3)}


install.packages("e1071")
library(help=e1071)

#Question 1
# take input from user two numbers, 
# if first number is greater than second number :- print invalid input
# if first number is equal to second number :- print if its even or odd
# if first number is less than second number :- print all even numbers betweeb those two numbers

x = as.integer(readline(prompt = "Please enter any number : "))
y = as.integer(readline(prompt = "Please enter any number : "))

if (x>y) {
  print(" invalid input")
}else if(x==y) {
  if((x %% 2) == 0) {
    print(paste(x,"is Even"))
  } else {
    print(paste(x,"is Odd"))
  } else(x<y) {
    for(i in x:y){
      if((i %% 2) == 0){print(i)}
    }
  } 
    
#Question 2
# take input from user any string and check if it contains any special character
# remove all special chars from the string and print again as a single string.
# if no special char is there print success.


library(stringr)
text = readline()
text = as.character(text)
if(grepl('[^[:alnum:]]', text) == TRUE){
    print("it contains special character")
    finalText = str_replace_all(text, "[^[:alnum:]]", "")
    print(paste0(text, " is now ",finalText))
  } else {
  print("it does not contain special character")
}



# scan function
# takes the input continuously and inorderto terminate the input process we need to hit enter key twice

x = scan()
print(x)
print(class(x))

x = scan(what = character())
print(x)

# repeat keyword executes the loop again and agin until some stopping condition is met

sytnax 

repeat{
  command
  if (condition){
    break
  }
}

c = c("Hello", "hi")
count = 2
repeat{
  print(c)
  count = count + 1
  if (count>5){
    break
  }
}

x = LETTERS[1:4]
for (i in x){
  print(i)
}

# next statement
# it is useful when we want to skip the current iteration of a loop without terminating it
# on encountring next, R skips further evaluation and starts next iteration of the loop
# next is same like continue in other programming languages

x = LETTERS[1:6]
for (i in x){
  if (i == 'D'){
    next # all statements below it will be skipped and control goes to for condition.
  }
  print(i)
}

# take input from user infinitely till user enters -999 and store these numbers in a container
# find the max, min ,mean, median , mode, standard deviation, all odd numbers, all negative numbers from that container
# try not to use break statement

num = 0
container = c()

while (num != -999) {
  num = as.integer(readline(prompt = "enter number : "))
  if(num != -999){
    container <- append(container, num)
  }
}

print("max of the numbers")
print(max(container))

print("min of the numbers")
print(min(container))

print("mean of the numbers")
print(mean(container))

print("median of the numbers")
print(median(container))

mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

print("mode of the numbers")
print(mode(container))

print("standard deviation of the numbers")
print(sd(container))

print("all odds of the numbers")
for(i in container){
  if(i %% 2 != 0){
    print(i)
  }
}

print("all negatives of the numbers")
for(i in container){
  if(i < 0){
    print(i)
  }
}


# functions are peice of code which can be reused again and again to attain certain task 
# suppose i want to multiply two numbers and add to third number and I want to do this task many times
# in R . is just a character. 

new.function = function(a,b,c){
  result = a*b+c
  print(result)
}

new.function(3,5,11)
new.function(4,10,11)

# we can define default arguments in a function
# default arguments has to be in the last and not in middle or beginning
new.function = function(a,b,c=100){
  result = a*b+c
  print(result)
}
new.function(4,10)
new.function(4,10,5)

# arguments in a function are evaluated lazily
# means they are evaluated only when needed by function body

new.function = function(a,b){
  print(a*2)
  print(a)
  print(b)
}

new.function(6)


# you need to go to sanfoundry.com and attempt questions of basic data structures and
# go through module 1,2,3 in LMS of edureka and try to solve exercises given there















