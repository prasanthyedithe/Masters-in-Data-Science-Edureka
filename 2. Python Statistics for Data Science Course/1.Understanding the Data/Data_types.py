'''
#Ordinal data
marks=int(input("Enter your percentage"))

if(marks<=40):
    print("Fail")
elif((marks>40)&(marks<=50)):
    print("Second Class")
elif((marks>50)&(marks<=60)):
    print("First Class")
elif(marks>=60):
    print("Congratulations!! You got distinction")


#nominal data
ans1=input("Would you like to go for shopping? if yes then type Y / y else N/n")
ans2=input("Do you love talking on any topic? if yes then type Y / y else N/n")

if(((ans1=='Y')|(ans1=='y'))&((ans2=='Y')|(ans2=='y'))):
    print("Welcome to girls club")
else:
    print("Sorry boys, you can not join the club")
'''

#mean mode median
import matplotlib
import matplotlib.pyplot as plt
matplotlib.style.use('ggplot')
import numpy as np
from statistics import mode
from scipy import stats

np.random.seed(1)
data = np.round(np.random.normal(5, 2, 100))
plt.hist(data, bins=10, range=(0,10), edgecolor='black')

plt.show()

mean = np.mean(data)

print(mean)

print(np.median(data))

mode = stats.mode(data)

print("The modal value is {} with a count of {}".format(mode.mode[0], mode.count[0]))
