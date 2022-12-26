import pandas

data = [{'a':1, 'b':2}, {'a':2, 'b':4, 'c':8}]
table = pandas.DataFrame(data, index=['first', 'second'])
print(table)