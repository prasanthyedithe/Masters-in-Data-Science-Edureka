#total number of participants
total=100000

#Probability of students agree that the duration of
# the courses conducted by Edureka is just right
agree=0.80

# probability of students having university degree
university_degree=0.1

#probability of students fit in both categories
agree_with_degree=0.05

#Part 1 solution
if(agree_with_degree==0):
    print("Both events are disjoint")
else:
    print("Events are not disjoint")


#Part 3 solution

#Probability that a randomly drawn person has a university degree
# or agrees with the statement about duration time

soln=agree+university_degree-agree_with_degree

print("Probability that a randomly drawn person has a university degree or "
      "\n agrees with the statement about duration time is ",soln)

#Part 4 solution

#percent of the population do not have a university degree
# and disagree with the  statement about duration time of lectures

ans=1-soln
print("Percent of the population do not have a university degree "
      "\n and disagree with the  statement about duration time of lectures is ",ans)

