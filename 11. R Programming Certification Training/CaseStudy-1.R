#Generating a 3 Random numbers b/w 1 and 10
runif(3, min=1, max=10)

#1. Create a vector “Random” which comprises of ten observations, whose:
  #First three observations are normally distributed random numbers with mean ‘5’ and standard deviation ‘1’
  Random_Set1 = rnorm(3, mean=5, sd=1) 
  Random_Set1
  #Next three observations are normally distributed random numbers with mean ‘3’ and standard deviation ‘3’
  Random_Set2 = rnorm(3, mean=3, sd=3) 
  Random_Set2
  #Last four observations are normally distributed random numbers with mean ‘1’and standard deviation ‘4’ 
  Random_Set3 = rnorm(4, mean=1, sd=4) 
  Random_Set3

  Random = paste(c(Random_Set1,Random_Set2,Random_Set3),collapse=" ")
  Random

#2.log values and exponentiation values natural numbers
#First five observations are log values of the first five natural numbers
#Next five observations are exponentiation values of next five natural numbers
  LogExpo = c(log(1),log(2),log(3),log(4),log(5),exp(6),exp(7),exp(8),exp(9),exp(10))
  
  LogExpo

#3 Add two vectors “Thousand” and “Negative_thousand”
  #Vector “Negative_thousand” is a sequence of integers from ‘-1000’ to ‘0’
  Negative_thousand = seq(-1000,0)
  #Vector “Thousand” is a sequence of integers from ‘0’ to ‘1000’
  Thousand =  seq(0,1000)
  Final_Thousand = Negative_thousand + Thousand
  Final_Thousand
  
#4 Store the above result in a new vector and name it as “Final_Thousand”. From this data-set:
  #Select the 500th observation
  Final_Thousand[500]
  #Extract the first hundred observations and store them in a new vector “First_Hundred”
  First_Hundred = Final_Thousand[1:100]
  #Extract the last hundred observations and store them in a new vector “Last_Hundred”
  Last_Hundred = tail(Final_Thousand,100)
  #Extract all the elements from 321st observation to 764th observation and store them in a new vector “Weird_Set”
  Weird_Set = Final_Thousand[321:764]
  
  First_Hundred
  Last_Hundred
  Weird_Set

#5 Create a list “Book_Details” which comprises of:
  #'Book_Name’-A character vector of five observations listing the names of books
  #'Author_Name’-A character vector of five observations listing the names of authors
  #‘Book_Cost’-A numeric vector of five observations listing the cost of books
  Book_Details <- list(Book_Name=c("Java First","Python","Learn C++","JavaScript for Beginners","PMP"), 
                       Author_Name=c("David","Jogn","Michel","James","James John"),
                       Book_Cost=c(150,140,400,500,600))
  Book_Details

#6 From the above list:
  #Extract all the three individual vectors by their name
  Book_Details[1]
  Book_Details[2]
  Book_Details[3]
  #Extract the name of fourth book
  Book_Details[[1]][4]
  #Extract the name of second author
  Book_Details[[2]][2]
  #Extract the cost of last book
  Book_Details[[3]][5]

#7 Load the inbuilt data-set “women” by using the “data()” command. From this data-set
  data()
  View(women)
  #Extract the observation which is present at 6th row, 2nd column
  women[6,2]
  #Extract the last four rows of the data-set
  last_row = tail(women, n =4)
  last_row
  #Extract alternate rows from the data-set
  data_row_even <- women[row_odd == 1, ]            
  data_row_even
  
#8 Create a “Student” dataset with a minimum of ten rows, which comprises of:
  #‘Name’-Name of the student
  #'Department’-Department of the student
  #’CGPA’-CGPA of the student
  #‘Placement’-Is the student placed or not(Boolean values)
  Student.data = data.frame(
    Name=c("StudentName1","StudentName2","StudentName3","StudentName4","StudentName5","StudentName6","StudentName7","StudentName8","StudentName9","StudentName10"),
    Department=c("IT","CSE","EEE","ECE","Mech","Civil","CSE","EEE","ECE","Mech"),
    CGPA=c(10.0,9.8,7.6,8.9,7.0,6.5,8.9,9.9,9.0,10.0),
    Placement=c(TRUE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE,FALSE)
  )