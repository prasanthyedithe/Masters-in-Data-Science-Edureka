#Normal Distribution

import numpy as np
import matplotlib.pyplot as pl

x = np.random.randn(10000)

nbins = 20

n, bins = np.histogram(x, nbins)
pdfx = np.zeros(n.size)
pdfy = np.zeros(n.size)
for k in range(n.size):
    pdfx[k] = 0.5*(bins[k]+bins[k+1])
    pdfy[k] = n[k]

pl.plot(pdfx, pdfy)