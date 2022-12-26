import pandas

data = {'one': pandas.Series([1, 2, 3], index=['a', 'b', 'c']),
        'two': pandas.Series([1, 2, 3, 4], index=['a', 'b', 'c', 'd'])}
table = pandas.DataFrame(data)
table['three'] = pandas.Series([10, 20, 30], index=['a', 'b', 'c'])
del(table['one'])
print(table)