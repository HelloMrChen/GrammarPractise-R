#时间序列相关案例

#ts方法构建时间序列介绍
a<-ts(1:30,frequency = 12,start = c(2011,3))
print(a)
# > print(a)
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
# 2011           1   2   3   4   5   6   7   8   9  10
# 2012  11  12  13  14  15  16  17  18  19  20  21  22
# 2013  23  24  25  26  27  28  29  30   
str(a)
attributes(a)

#在ts函数的参数中，1：30代以1-30为基础建立30个时间序列值，frequence=7代表以周循环，=12代表以月循环，=4代表以季度循环
#start 代表起始的日期

#将时间序列拆分成趋势成分、季节成分、随机成分
#所谓的趋势成分是指长时间间隔的大体运动方向，季节成分是指季节性的变化，随机成分是指重复但非周期的波动，最终是随机成分
#R自带的AirPassengers中很好演示了时间序列
plot(AirPassengers)
install.packages("tseries")
install.packages("forecast")
library(tseries)
library(forecast)
#同样可以使用tsdisplay函数显示ACF和PACF图，用来确定arima函数的参数
tsdisplay(AirPassengers)
#使用decompose()函数将其拆分为不同成分
dc<-decompose(AirPassengers)

#打印出四种趋势图
plot(dc)

#打印出关于季节性趋势的图表
season<-dc$figure
plot(season,type = "b",xaxt="n",xlab = "")

#通过ISOdate和months构建月名,ISODate是将年月日拼接成日期，然后month取其中的月份
#关于日期函数的博客：https://www.cnblogs.com/one--way/p/5868789.html
monthNames<-months(ISOdate(2011,1:12,1))
print(monthNames)

#axis(side,at,labels) side一个整数，用于指定图形中坐标轴的绘制方向。坐标轴按如下方式绘制：1 向下，2 向左 3 向上 4 向右。
#at要绘制刻度线上的点
#labels 可以是一个逻辑值，表示是否要在刻度线上进行注释， 或要放在刻度线上作标签的一个字符或表达式向量。
axis(1,at=1:12,labels = monthNames,las=2) #将monthNames中的变量名赋给x轴

#构建arima模型，我们首先使用forcast包里的auto.arima进行参数估计，然后再使用arima
a<-auto.arima(AirPassengers)
print(a)
# > print(a)
# Series: AirPassengers 
# ARIMA(2,1,1)(0,1,0)[12] 
# 
# Coefficients:
#   ar1     ar2      ma1
# 0.5960  0.2143  -0.9819
# s.e.  0.0888  0.0880   0.0292
# 
# sigma^2 estimated as 132.3:  log likelihood=-504.92
# AIC=1017.85   AICc=1018.17   BIC=1029.35


fit<-arima(AirPassengers,order = c(2,1,1),seasonal = list(order=c(0,1,0),period=12))
print(fit)
fore=predict(fit,n.head=24)
U<-fore$pred+2*fore$se
L<-fore$pred-2*fore$se
ts.plot(AirPassengers,fore$pred,U,L,col=c(1,2,4,4),lty=c(1,1,2,2))


install.packages("urca")
library(urca)
ur.df(AirPassengers)

# ############################################################### 
# # Augmented Dickey-Fuller Test Unit Root / Cointegration Test # 
# ############################################################### 
# 
# The value of the test statistic is: -0.3524 

