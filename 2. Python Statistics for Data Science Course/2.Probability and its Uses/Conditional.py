#Conditional Probability

import pandas as pd

df = pd.DataFrame({'company': ['ford', 'chevy', 'ford', 'ford', 'ford', 'toyota'],
                     'model': ['mustang', 'camaro', 'fiesta', 'focus', 'taurus', 'camry'],
                     'rating': ['A', 'B', 'C', 'A', 'B', 'B'],
                     'type': ['coupe', 'coupe', 'sedan', 'sedan', 'sedan', 'sedan']})
print(df)

print(df.groupby('rating').count()['model'] / len(df))

print((df.groupby(['rating', 'type']).count() / df.groupby('rating').count())['model'])


