#画图
hist(x) #直方图
plot(x$x1,x$x2) #散点图  

table(x$x1) #列联函数，统计每个分数下共有多少人 
barplot(table(x$x1)) # 柱状图，首先先用列联函数 
pie(table(x$x1))
boxplot(x$x1,x$x2,x$x3,col = c("red","green","blue"),horizontal = T) #箱线图   上线下线分别为最大值和最小值  箱子上下分别为25%分位数和25%分位数


#星象图
stars(x[c("x1","x2","x3")],full = T ,draw.segments = T) #雷达图
stars(x[c("x1","x2","x3")])   #星象图，能看出有没有偏科，各科的成绩分布

#茎叶图
stem(x$x2)


#QQ图 判断是否是正态分布

qqnorm(x$x2) #圆点越接近直线越是正态分布
qqline(x$x2) #直线的斜率是标准差，截距是均值


#散点图的进阶
plot(x$x1,x$x2,main = "数学和线性代数的关系",xlab = "数学分析",ylab = "线性代数",
     xlim = c(50,100),ylim = c(50,100),
     xaxs="i",yaxs="i",
     col="red",pch=18
     )

#typle="l"  将散点图中的点通过连线连接到一起  

#line() 函数可以在散点图的基础之上，继续进行连线，称为低水平画图命令  

#data()列出 内置数据集

#热力图  

heatmap(as.matrix(mtcars),Rowv = NA,Colv = NA,col=heat.colors(256),scale = "column",
        margins = c(2,8),main="cars")

#向日葵散点图,解决点重叠的关系
sunflowerplot(iris[1:4],col = "gold",seg.col = "gold") #对数据集的第三列和第四列画图，重叠的部分用延伸的线来表示

#散点图集，数据框中如果包含很多列，可以相互之间画散点图，看那两个之间有关系
plot(iris[1:4],pch=19,col="blue",cex=0.9);pairs(iris[1:4])

#par 函数将作图区域分割,将多个图在一个设备上输出 
par(mfrow=c(3,1))#将图分为3行1列
plot(x1,x2,main = "1");plot(x2,x3,main = "2");plot(x1,x3,main = "3")

plot(iris[1:4],pch=19,col="blue",cex=0.9);pairs(iris[1:4])

#colors() 查看系统中包含了哪些函数 

#dev() 设备管理器

dev.cur()
dev.new()

#关于画图可以参考的R graph cookbook 

#三维散点图画图 
scatterplot3d(x[2:4])
library(scatterplot3d)

# 另外有的高级图有 三维图比如sinx*siny  调和曲线（可以区分聚类可以分几类）

#地图

library(maps)
map("state")
# 可以画出航班起飞图  














