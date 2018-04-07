Anscombe<-data.frame(
  X =c(10.0, 8.0, 13.0, 9.0, 11.0, 14.0, 6.0, 4.0, 12.0, 7.0, 5.0),
  Y1=c(8.04, 6.95, 7.58, 8.81, 8.33, 9.96, 7.24, 4.26, 10.84, 4.82, 5.68),
  Y2=c(9.14, 8.14, 8.74, 8.77, 9.26, 8.10, 6.13, 3.10, 9.13, 7.26, 4.74),
  Y3=c(7.46, 6.77, 12.74, 7.11, 7.81, 8.84, 6.08, 5.39, 8.15, 6.44, 5.73),
  X4=c(rep(8,7), 19, rep(8,3)),
  Y4=c(6.58, 5.76, 7.71, 8.84, 8.47, 7.04, 5.25, 12.50, 5.56, 7.91, 6.89)
)

#这里y1,y2,y3是x的因变量，y4是x4的因变量，我们来查看两者之间的关系
summary(lm(Y1~X,data=Anscombe))
summary(lm(Y2~X,data=Anscombe))
summary(lm(Y3~X,data=Anscombe))
summary(lm(Y4~X4,data=Anscombe))

#通过查看变量间的线性模型概况，我们发现这四组数据模型的p值以及模型系数均能通过显著性检验
#但同时我们看到四个模型的R方值都在60%左右，不算理想

#接下来，我们通过绘制这个模型相应的散点图，以及其拟合曲线，来查看是否满足线性关系
par(mfrow=c(2,2)) #将屏幕分为2*2的矩阵
plot(Y1~X,data=Anscombe,main="Y1~X",xlab="",ylab="");abline(lm(Y1~X,data=Anscombe))
plot(Y2~X,data=Anscombe,main="Y2~X",xlab="",ylab="");abline(lm(Y2~X,data=Anscombe))
plot(Y3~X,data=Anscombe,main="Y3~X",xlab="",ylab="");abline(lm(Y3~X,data=Anscombe))
plot(Y4~X4,data=Anscombe,main="Y4~X4",xlab="",ylab="");abline(lm(Y4~X4,data=Anscombe))

#通过图形我们发现图一线性拟合性尚可，
#图二的lm对象曲线跟实际点偏离较大，且实际点很明显符合某种曲线模型，有可能是二次多项式
#图三因为一个异常点的存在，导致本来非常符合线性关系的点，其拟合曲线偏离实际情况
#图四情况类似图三 


#我们首先对图二模型进行更新，更新为可能的二次多项式
attach(Anscombe) #表示下面的代码可以直接取Anscombe中的变量名，不必加$
X2<-X^2
lm.new<-lm(Y2~X+X2,data=Anscombe)
coef(lm.new)
x<-seq(min(X),max(X),by=0.1)
y<-b[1]+b[2]*x+b[3]*x^2
plot(c(3,20), c(3,13), type="n", xlab = "X", ylab = "Y")
points(X,Y2)
lines(x,y)

summary(lm.new)
#通过查看summary，我们看到通过二次多项式拟合之后的模型R方值为1，即完全拟合
# > summary(lm.new)
# 
# Call:
#   lm(formula = Y2 ~ X + X2, data = Anscombe)
# 
# Residuals:
#   Min         1Q     Median         3Q        Max 
# -0.0013287 -0.0011888 -0.0006294  0.0008741  0.0023776 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -5.9957343  0.0043299   -1385   <2e-16 ***
#   X            2.7808392  0.0010401    2674   <2e-16 ***
#   X2          -0.1267133  0.0000571   -2219   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.001672 on 8 degrees of freedom
# Multiple R-squared:      1,	Adjusted R-squared:      1 
# F-statistic: 7.378e+06 on 2 and 8 DF,  p-value: < 2.2e-16

#对于图三和图四中因为异常点拟合有误的情况，需要去除异常点重新进行拟合，比如图三
#我们发现是第三个点（13.0.12.74）为异常点，我们将其排除

lm3.new<-lm(Y3[-3]~X[-3],data=Anscombe)
plot(X,Y3)
abline(lm3.new)

residuals(lm3.new)
# 1             2             3             4             5             6             7             8 
# -0.0010606061 -0.0009740260 -0.0060173160  0.0038961039 -0.0012337662 -0.0008874459 -0.0008008658 -0.0011471861 
# 9            10 
# 0.0140692641 -0.0058441558 

#通过plot(object)的方法可以查看回归模型的残差图，命令执行之后共有四个图：
#1、表示普通残差与拟合值的残差图
#2、表示画残差图的QQ图
#3、画标准化残差的开方与拟合值的残差图
#4、表示画Cook统计量的残差图










