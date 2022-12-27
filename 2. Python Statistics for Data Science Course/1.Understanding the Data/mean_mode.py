import pandas as pd
import numpy as np

data=pd.read_csv("brain_size.csv",sep=';',na_values='.')
print(data.head())

print("\n")
data1=data[data['Gender']=='Female']['VIQ']
print(data[data['Gender']=='Female'])

print("\n")
print("The mean value of Female VIQ is ",
      data1.mean())


print("\n")

VIQ = np.array(data1)
print(VIQ)
print("Mean VIQ:       ", VIQ.mean())

print("Median VIQ  ",np.median(VIQ))

print("Standard deviation:", VIQ.std())
print("Minimum VIQ:    ", VIQ.min())
print("Maximum VIQ:    ", VIQ.max())



