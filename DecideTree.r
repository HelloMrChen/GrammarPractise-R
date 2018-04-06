#一、使用part包构建决策树
#我们将在iris数据集上演示使用party包构建决策树的方法，在iris数据集中，茎叶的长宽都能来预测花的种类
#我们将使用party包中的ctree()用来建立决策树，用predict()来预测新的数据


#---设置学习集和测试集
str(iris)

set.seed(1234)
ind<-sample(c(1:2),nrow(iris),replace = T,prob = c(0.7,0.3))

#这里解释set.seed的含义，在产生一个随机样本之前设置set.seed(n) n代表标号，下次再调用set.seed(n)的时候，随机样本
#产生函数会生成一样的结果，以方便结果的重现，比如我们执行以下代码，会发现ind2==ind
#set.seed(1234)
#ind2<-sample(2,nrow(iris),replace = TRUE,prob = c(0.7,0.3))

#sample函数 即产生随机样本，用法为sample(x,size,replace,prob) x代表从哪些集合中抽取随机数，size代表抽取几个随机数

trainData<-iris[ind==1,]
testData<-iris[ind==2,]

#---使用party包中的ctree()函数来产生决策树

#先定义公式，Species作为因变量，其余作为自变量
myFormula<-Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width
install.packages("party")
library(party)
irisTree<-ctree(myFormula,data=trainData)

table(predict(irisTree),trainData$Species)

plot(irisTree,main = "prediction tree")
plot(irisTree,type="simple")
#在简化版的决策树图中，n代表在该节点中的实例个数，y代表各个种类分布情况，比如第二个节点中有35个实例，且都属于第一类


#使用构建好的决策树进行预测
testPre<-predict(irisTree,testData)

#检验预测结果，发现只有两个是False，即50个测试集预测错了2个
testData$Species==testPre


#二、使用rpart包构建决策树
#我们将用rpart包中的rpart函数进行构建决策树，然后同样用predict函数进行预测

install.packages("mboost")
data("bodyfat",package = "TH.data")
str(bodyfat)
attributes(bodyfat)
dim(bodyfat)

library(rpart)
set.seed(12345)
ind2<-sample(2,nrow(bodyfat),replace=T,prob = c(0.7,0.3))

trainData2<-bodyfat[ind2==1,]
testData2<-bodyfat[ind2==2,]

myFormula2<-DEXfat~age+waistcirc+hipcirc+elbowbreadth+kneebreadth

bodyfatTree<-rpart(myFormula2,data=trainData2,control = rpart.control(minsplit = 10))

print(bodyfatTree)

attributes(bodyfatTree)
par(mar = c(4,4,4,4)) #设置画图区域的离四周边界的距离
plot(bodyfatTree)
text(bodyfatTree,use.n = T) #添加节点文字信息

print(bodyfatTree$cptable)

#选择具有最小误差的决策树，通过决策树对象的cptable中的xerror属性最小来选择。
opt<-which.min(bodyfatTree$cptable[,"xerror"])

#取出所选对象的cp的值
cp<-bodyfatTree$cptable[opt,"CP"]

#决策树的剪枝
bodyfat_prune<-prune(bodyfatTree,cp=cp)
print(bodyfat_prune)
plot(bodyfat_prune)
text(bodyfat_prune,use.n = T)

bodyfat.pre<-predict(bodyfat_prune,newdata = testData2)
xlim<-range(bodyfat$DEXfat)
plot(bodyfat.pre~DEXfat,data=testData2,xlab="Oberserved",ylab="pre")
abline(a=0,b=1)


