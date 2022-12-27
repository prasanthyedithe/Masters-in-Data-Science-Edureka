import numpy as np
import pandas as pd
import scipy.stats as stats
import matplotlib.pyplot as plt
import math


np.random.seed(6)

population_ages1 = stats.poisson.rvs(loc=18, mu=35, size=150000)
population_ages2 = stats.poisson.rvs(loc=18, mu=10, size=100000)
population_ages = np.concatenate((population_ages1, population_ages2))

minnesota_ages1 = stats.poisson.rvs(loc=18, mu=30, size=30)
minnesota_ages2 = stats.poisson.rvs(loc=18, mu=10, size=20)
minnesota_ages = np.concatenate((minnesota_ages1, minnesota_ages2))

print( population_ages.mean() )
print( minnesota_ages.mean() )

print(stats.ttest_1samp(a= minnesota_ages,               # Sample data
                 popmean= population_ages.mean()) ) # Pop mean

stats.t.ppf(q=0.025,  # Quantile to check
            df=49)  # Degrees of freedom