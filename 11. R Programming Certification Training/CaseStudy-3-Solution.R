#1.Load the required packages 
library(R6)


#2.Create a new class template/object generator with the name “Football_Generator”, it should comprise of these components:
#  •Three private data members:”Player_Name”, “Player_Club” & “Player_Salary”
#  •Three public functions: “set_name()”, “set_club()” and “set_salary()”

Football_Generator <-R6Class("Foodball",
                              private=list(name=NA,club=NA,salary=NA),
                               public=list(
                                 set_name=function(x){private$name<-x},
                                 set_club=function(x){private$club<-x},
                                 set_salary=function(x){private$salary<-x}
                                )
                             )

#3.For the above class template create two new objects and assign values to the private 
#data members with the public functions

teams <- Football_Generator$new()
teams$set_name("Asia Team")
teams$set_club("Hyderabad CLub")
teams$set_salary(50000)

teams

#4.Create a new class generator with the name “Movie_Generator”, it should comprise of these components:
#  •Three private data members: “Movie_Name”, “Protagonist_Name”, “Movie_Budget”

Movie_Generator <-R6Class("Movie", 
                          private = list(moviename=NA,protagonistname=NA,moviebudget=NA)
                          )

#5.For the above class template, assign values to the private data members using initialize method


Movie_Generator <-R6Class("Movie", 
                            private = list(moviename=NA,protagonistname=NA,moviebudget=NA),
                            public = list(
                              initialize = function(x,y,z){
                                private$moviename<-x
                                private$protagonistname=y
                                private$moviebudget=z
                              }
                            )
                          )

movie <- Movie_Generator$new("Check De India","Test",100)
movie

#6.Create a new class generator with the name “Vegetable_Generator”, it should comprise of these components:
#  •Two private data members: “Vegetable_Name”, “Vegetable_Cost”

Vegetable_Generator <- R6Class("Vegetable",
                               private = list(name=NA,cost=NA)
                               )
#7.For the above class template, create two new objects and assign values to the private data members by using Active Bindings

Vegetable_Generator <- R6Class("Vegetable",
                               private = list(..name=NA,..cost=NA),
                               active = list(
                                 name=function(x){private$..name<-x},
                                 cost=function(x){private$..cost<-x}
                               )
                              )


vegetable = Vegetable_Generator$new()
vegetable$name <- "Carrot"
vegetable$cost <- 100

vegetable

