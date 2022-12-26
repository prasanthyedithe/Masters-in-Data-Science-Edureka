list=[(1,2,3),("Python","Java")]
print(list)
print(len(list))
print(list[1][0:1])

list[0][1]=50
print(list)







tup=([1,2,3],[3,4,5],[5,6,7])
print(tup)
print(len(tup))
print(tup[0][1])

#Updating Tuple
tup[0][1]=90
print(tup)

#Deleting element in Tuple
del(tup[1][2])
print(tup)





list=[1,2,'Python','Android']
print(list)

list[2]='Data Science'
print(list)

tup=(1,2,3,'Data Science')
print(tup)

tup[1]='Python'
print(tup)



tuple1=(1,2,3,5,7,'a','b')
lst=list(tuple1)
print(lst)

lst[1]='Python'
print(lst)

tuple2=tuple(lst)
print(tuple2)
