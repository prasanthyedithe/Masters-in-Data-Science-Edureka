from scipy.stats import norm
import numpy as np
import matplotlib.pyplot as plt


x= np.arange(-4,4,0.001)
plt.plot(x, norm.pdf(x))

plt.show()


#new
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import scipy.stats  as stats

uniform_data = stats.uniform.rvs(size=100000,  # Generate 100000 numbers
                                 loc = 0,      # From 0
                                 scale=10)     # To 10

pd.DataFrame(uniform_data).plot(kind="density",  # Plot the distribution
                               figsize=(9,9),
                               xlim=(-1,11))

from scipy.stats import norm
import numpy as np
import matplotlib.pyplot as plt


x= np.arange(-4,4,0.001)
plt.plot(x, norm.pdf(x))

plt.show()
