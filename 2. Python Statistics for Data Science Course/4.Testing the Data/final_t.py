import pandas as pd
from scipy.stats import ttest_ind, ttest_ind_from_stats

df=pd.read_csv('T-test.csv')
print(df)

var1=df['Low_Light'].values
var2=df['High_Light'].values

print(var1)
print(var2)

t, p = ttest_ind(var1, var2, equal_var=False)
print("ttest_ind:            t = %g  p = %g" % (t, p))