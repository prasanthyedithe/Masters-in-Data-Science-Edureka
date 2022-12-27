#Marginal Probability

#total number of students
total=105

#Students attended edureka training
students_trained=45

# The probability that a candidate has undergone Edureka training
edu_training=students_trained/total
print("The probability that a candidate has undergone Edureka training is ",round(edu_training,2))

#Joint probability

#students with edureka training having good salary
good_sal_edu=30

#students without edureka training having good salary
good_sal=5

#Finding the probability that a candidate has attended Edureka training and
# also has good package
student_good_sal=good_sal_edu/total

print("The probability that a candidate has attended Edureka training and also has good "
      "package ",student_good_sal)



#Conditional Probability

#Total no. of students without edureka training
student_without_training=60

#Students getting good salary without training
student_without_training_good_sal=5

print("The probability of students getting good package without edureka training "
      "is ",student_without_training_good_sal/student_without_training)


