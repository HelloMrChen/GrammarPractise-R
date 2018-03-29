#xyplot 画散点图的分组功能
install.packages("lattice")
library(lattice)
xyplot(mpg~disp,data=mtcars,groups = cyl,auto.key = list(corner=c(1,1)))


#ggplot 包是R语言中强大的画图包
library(ggplot2)
qplot(mpg,disp,data=mtcars,col=as.factor(cyl))
qplot(mpg,disp,data=mtcars,size=as.factor(cyl),col=as.factor(mpg))

#plot中的text()可以在plot图上进行标识文字
plot(mpg~disp,data=mtcars)
text(mtcars$mpg,mtcars$disp,mtcars$carb)  #text函数跟line、point一样是低水平的作图工具 通过这种方法可以将数据
#集中的其他维度写到点的上边

#arrows函数用来画出误差条   
plot(mpg~disp,data = mtcars)
arrows(x0=mtcars$disp,y0=mtcars$mpg*0.95,
       x1=mtcars$disp,y1=mtcars$mpg*1.05,angle = 90,code=3,length = 0.04,lwd = 0.4)
#此处的x0,x1为上下箭头的横坐标，y0和y1为上下箭头的纵坐标，angle是将箭头变为90度，就成了上下界的感觉

#雾化效果函数 smoothScatter
x=rnorm(10000)
y=rnorm(10000)
plot(x,y)
smoothScatter(x,y)


