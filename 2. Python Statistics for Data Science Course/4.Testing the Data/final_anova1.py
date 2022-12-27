import pandas as pd
from scipy.stats import ttest_ind, ttest_ind_from_stats
import numpy as np


df=pd.read_csv("fish.csv")
print(df)

var1=df['food 1'].values
var2=df['food 2'].values
var3=df['food 3'].values
var4=df['food 4'].values

print(var1)
print(var2)
print(var3)
print(var4)

v1=np.array(var1)
v2=np.array(var2)
v3=np.array(var3)
v4=np.array(var3)

from scipy import stats
print(stats.f_oneway(v1, v2, v3, v4))

import numpy as np
from scipy import stats
food1 = np.array([ 31, 32, 53 ])
food2 = np.array([ 79, 48, 49 ])
food3= np.array([ 55, 46, 45])

print(stats.f_oneway(food1, food2, food3))