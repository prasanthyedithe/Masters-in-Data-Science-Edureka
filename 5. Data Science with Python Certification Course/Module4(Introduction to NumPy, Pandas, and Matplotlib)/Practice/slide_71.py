import pandas

data = {'one': pandas.Series([1, 2, 3], index=['a', 'b', 'c']),
        'two': pandas.Series([1, 2, 3, 4], index=['a', 'b', 'c', 'd'])}
table = pandas.DataFrame(data)
row  = pandas.DataFrame([[11, 13], [17, 19]], columns=['two', 'three'])
table = table.append(row)
table = table.drop('a')

print(table)