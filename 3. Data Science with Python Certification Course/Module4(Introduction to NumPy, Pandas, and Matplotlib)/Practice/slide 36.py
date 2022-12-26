import numpy as np
arr=np.zeros(8)
arr3d=arr.reshape((2,2,2))
arr=arr3d.ravel()
print(arr)
