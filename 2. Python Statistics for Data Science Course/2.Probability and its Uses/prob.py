import scipy.stats
print(scipy.stats.norm(0, 1))

print(scipy.stats.norm(0, 1).pdf(0))
print(scipy.stats.norm(0, 1).cdf(0))
print(scipy.stats.norm(100, 12))
print(scipy.stats.norm(100, 12).pdf(98))
print(scipy.stats.norm(100, 12).cdf(98))
print(scipy.stats.norm(100, 12).cdf(100))
