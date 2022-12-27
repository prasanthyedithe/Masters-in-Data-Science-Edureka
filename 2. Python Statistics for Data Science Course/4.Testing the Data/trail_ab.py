import numpy as np
from scipy import stats
data={
    'A':{'views':42,'signup':2},
    'B':{'views':85,'signup':11}
}

posteriors={variations:stats.beta(logs['signup'],logs['views']-logs['signup'])
            for variations, logs in data.items()}
print(posteriors['A'].mean)

print(posteriors['A'].ppf(0.025),posteriors['A'].ppf(0.975))

