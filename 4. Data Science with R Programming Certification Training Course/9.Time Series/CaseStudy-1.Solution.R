setwd(choose.dir())

getwd()

production <- read.csv('CADairyProduction.csv')
milk.ts <- ts(production$Milk.Prod, start=1995, freq=12)
plot(log(milk.ts), main='Milk Production Time Series', ylab='Log of Milk Production')


#Time Series Decomposition
milk.decomp <- stl(log(milk.ts), s.window = "periodic", t.window = 0.5*length(milk.ts))
plot(milk.decomp, main = paste('Decompositon of Milk Production with lowess span = 0.5'))

remainder.ts <- milk.decomp$time.series[,'remainder']
plot.acf(remainder.ts, is.df=F) ## Function added in the appendix

milk.arima = arima(remainder.ts, order = c(1,0,0), include.mean=F)
milk.arima

#Forecasting
#To forecast for 2014 milk production, we use the forecast R package.


require(forecast)
ARIMAfit <- auto.arima(log(milk.ts), max.p=3, max.q=3, max.P=2, max.Q=2, max.order=5,
                       max.d=2, max.D=1, start.p=0, start.q=0, start.P=0, start.Q=0)
summary(ARIMAfit)

#From the summary above, we see that our ARIMA has d=1 and q=1 with seasonal D=1 and Q=2. With this model in hand we can now forecast for the 2014, namely the next 12 months.
milk.forecast = forecast(ARIMAfit, h=12)
summary(milk.forecast)
plot(milk.forecast)


## Show ACF and PACF plots
plot.acf <- function(df, col = 'Remainder', is.df=TRUE){
  if(is.df) temp <- df[, col]
  else temp <- df
  par(mfrow = c(2,1))
  acf(temp, main = paste('ACF of', col))
  pacf(temp, main = paste('PACF of', col))
  par(mfrow = c(1,1))
}