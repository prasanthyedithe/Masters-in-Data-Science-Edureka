dice=[1,2,3,4,5,6]

n=len(dice)

for i in range(0,n):
    if((dice[i]%2==0)and(dice[i]%3)==0):
        print(dice[i])

#Union of events
dice=[1,2,3,4,5,6]

n=len(dice)

for i in range(0,n):
    if((dice[i]==4)or(dice[i]==6)):
        print(dice[i])

