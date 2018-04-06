#使用iris数据集进行数据探索的练习

#本次练习点：
#str dim attribute head tail summary quantile hist cov cor aggregate pairs boxplot  scatterplot3d  plot3d heatmap


#-----探索整体情况
#str()查看数据结构类型、行列数以及每列大体情况
str(iris)

#dim()查看数据结构大小
dim(iris)

#attribute() 返回names,row.names,class属性
attributes(iris)

#head和tail分别返回数据的前五行和后五行
head(iris)
tail(iris)

#取某一列的任意几行
iris[1:10,"Sepal.Length"]
iris$Sepal.Length[1:10]


#-----探索单个变量
#概况、分位数、方差、直方图、概率密度分布
summary(iris)  #最大、最小、中位数、平均值、一三分位数
var(iris$Sepal.Length)
quantile(iris$Sepal.Length)
hist(iris$Sepal.Length)
plot(density(iris$Sepal.Length))

#table()函数探索单个变量因子频数，以及用它来绘制饼图、条形图
table(iris$Species)
pie(table(iris$Species))
barplot(table(plot(iris$Species)))

#-----探索多个变量
#两个及多个变量的协方差
cov(iris$Sepal.Length,iris$Sepal.Width)
cov(iris[,1:4])  #统计1-4列中所有行的协方差

#两个及多个变量的相关系数
cor(iris$Sepal.Length,iris$Sepal.Width)
cor(iris[,1:4])

#查看每个种类的sepal.length 的数据
# aggregate是在某个数据总集中拆分子集并按照指定函数运算aggregate(x, by, FUN,data ..., simplify = TRUE)
aggregate(Sepal.Length~Species,summary,data=iris)

#使用箱线图打印每个分类下的数据
#boxplot(x,by,data=)
boxplot(Sepal.Length~Species,data=iris)

#打印变量之间的相关关系图
with(iris,plot(Sepal.Length,Sepal.Width,col=Species,pch=as.numeric(Species)))

#添加jitter值进行噪声值的优化
with(iris,plot(jitter(Sepal.Length),jitter(Sepal.Width),col=Species,pch=as.numeric(Species)))

#绘制不同变量之间的散点图矩阵
pairs(iris)

#----更高级的探索

#3d图
library(scatterplot3d)
with(iris,scatterplot3d(Sepal.Length,Sepal.Width,Species))
# install.packages("rgl")

#绘制交互式的3d图，效果很炫
library(rgl)
with(iris,plot3d(Sepal.Length,Sepal.Width,Species))

#热区图
distMatrix<-as.matrix(dist(iris[,1:4])) #通过dist距离函数来计算1-4列之间各个花数据的距离，形成矩阵
heatmap(distMatrix)#将距离矩阵传给热区图进行绘制图形

#如何将图表保存到图片中
pdf("/Users/gavinchen/我的文档/MBA养成记/2-自我提升/2-数据分析/程序练习/GrammarPractise-R/data/myplot.pdf")
x<-(1:50)
plot(x,log(x))
dev.off()





