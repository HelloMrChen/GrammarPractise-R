#本节将演示单变量离群点检测、聚类离群点检测以及从时间序列中进行离群点检测的例子

#---单变量离群点的检测，使用boxplot绘制散点图，以及使用boxplot.stats()中的out属性来获取具体的离群值

set.seed(123)
data<-rnorm(100)#随机生成100个符合正态分布的随机数
summary(data)
plot(density(data)) #打印出data的概率密度函数
#打印出data箱线图，从箱线图中可以看到地步有一个离群值
boxplot(data)
boxplot.stats(data)$out  #将这个离群值输出出来
#[1] -2.309169

#----多变量的离群值检测，跟单变量离群值检测基本类似，但是多加一步
set.seed(1235)
x<-rnorm(100)
y<-rnorm(100)
df<-data.frame(x,y)
head(df)
str(df);summary(df)
#找出x中的离群点
boxplot(x);boxplot.stats(x)$out
#找出y中的离群点
boxplot(y);boxplot.stats(y)$out

#找出这些离群点在各自数组中的下标
ylist<-which(y %in% boxplot.stats(y)$out)
# > ylist
# [1] 45 68
xlist<-which(x %in% boxplot.stats(x)$out)
# > xlist
# [1] 39 50

#我们视x和y中的离群值所构成的点都为离群点
unionlist<-union(xlist,ylist)
# > unionlist
# [1] 39 50 45 68

plot(df)
points(df[unionlist,],col="red",pch="x",cex=2) 
#这里df[unionlist,]的用法是因为（x,y）有一个是离群的就算离群值，而x,y的下标都是相同的
#同样我们可以取交集，即xy都离群的点才化为离群点，取交集的函数未intersect()

#---局部离群因子检测
# install.packages("DMwR")
# install.packages("dprep")
library(DMwR);library(dprep);

irisTest<-iris[,1:4]

#这里的k是自己设定的，表示以周围5个点判断离群点
outliner.score<-lofactor(irisTest,k=5)
#我们打印一下outliner，看里边包含了什么信息
head(outliner.score)
# [1] 0.9979707 1.0215881 1.0545295 0.9936177 1.0049730 1.2288344
#我们能看到是存储的各个点lof评分，我们取出得分前五的点

outliner<-order(outliner.score,decreasing = T)[1:5] #按照规则排序后返回相应的序号值
print(outliner) #打印出得分前五的行数值

print(irisTest[outliner,]) #打印出这五个行数在原数据集中代表的点

#我们通过配对散点图来画出离群点
pairs(irisTest,pch=ifelse(row.names(irisTest) %in% outliner,"X","*"),col=ifelse(row.names(irisTest) %in% outliner,"red","black"))

#另一种写法
pch<-rep("*",nrow(irisTest))
pch[outliner]="X"
col<-rep("black",nrow(irisTest))
col[outliner]="red"

pairs(irisTest,pch=pch,col=col)

#两种效率一样，但可见第一种写法较为简单，第二种写法展示了pch、col属性的新用法



















