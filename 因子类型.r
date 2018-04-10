#函数factor可以把一个向量编码为一个因子，其一般形式为：
#factor(x,levels=sort(unique(x),na.last=TRUE),labels,exculde=NA,order=FALSE)
#其中x是向量，levels是水平，可以自行指定各离散的取值，不指定时由x的不同值来表示，labels可以用来指定各水平的标签
#不指定时用各离散取值的对应字符串

sex<-c("M","F","M","M","F")
factor(sex)
#使用is.factor来判断对象是否为因子类型
is.factor(sex)
#使用as.factor来将对象转换为因子类型
sex.factor<-as.factor(sex)
#使用levels来取得因子中的水平
levels(sex.factor)
# [1] "F" "M"


#函数tapply()
#当我们知道5个人的性别以及5个人的身高的时候，就能计算出每个性别下的平均身高
height<-c(170,175,180,165,168)

tapply(height,sex.factor,mean)
# F        M 
# 171.5000 171.6667 

#tapply 的使用格式为tapply(x,index,fun) 其中x为对象，index为与x具有相同个数的因子类型，fun为指定的方法

#gl()函数
#gl函数能很快的产生因子，其基本用法为：gl(n,k,length=n*k,labels=1:n,order=false)

gl(3,5)
# [1] 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3
# Levels: 1 2 3

gl(3,1,15)
# [1] 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
# Levels: 1 2 3

