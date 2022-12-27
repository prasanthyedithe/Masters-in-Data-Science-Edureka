s = 0
for i in range(0,3):
    s += i*i
print(s)

print("a %s b %d:%3.1f" % ("hey",12,1.2))

def f(x, y):
    return (x*y)
print(f(3,2))

x = 5
print("%d %s" % (x, x*"*"))

print(sum([1.0/i for i in range(1,3)]))

from random import random
samp_size = 100000000
n = 0
for i in range(0,samp_size):
    if random() < 0.7:
        n += 1
p = float(n) / samp_size
print(p)

import statistics

agesData=[10,23,34,11,23,33,12,11,15,11]

print(statistics.mean(agesData))
print(statistics.mode(agesData))
print(statistics.median(agesData))
print(sorted(agesData))
print(statistics.variance(agesData))
print(statistics.stdev(agesData))