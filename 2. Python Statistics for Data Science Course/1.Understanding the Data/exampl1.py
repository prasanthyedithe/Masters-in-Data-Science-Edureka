#standard deviation
import numpy as np

heights = [5.9, 5.5, 6.1, 6.0, 7.2, 5.1, 5.3, 6.0, 5.8, 6.0]
print("Sample average: %.2f" % np.mean(heights))
print("Sample standard deviation: %.2f" % np.std(heights, ddof=1))
print("Improper standard deviation: %.2f\n" % np.std(heights))

large_num_heights = np.random.random(size=100000)*1.5 + 5.0
print("Sample average: %.2f" % np.mean(large_num_heights))
print("Sample standard deviation: %.2f" % np.std(large_num_heights, ddof=1))
print("Less improper standard deviation: %.2f" % np.std(large_num_heights))


#