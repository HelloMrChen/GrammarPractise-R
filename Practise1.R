x1=c(1,2,3,4,5)
x2=c(6,7,8,9,10)
x3=c("a","b","c","d","e")

mode(x1);length(x1)

x4=rbind(x1, x2,x3)
mode(x4)  # 数字型和字符型可以rbind 但是个数要匹配，且rbind完了之后是字符型的  

#简单的数学计算
sum(x1);mean(x2);var(x1);sd(x1); #方差，标准差
prod(x1) #连乘

#函数帮助
help(mode)


# 向量括号中可以写计算公式,控制向量的生成和查看
c(1:10-1);c(1:10*2) #产生向量
x1[-5];x1[5] #查看向量
x1[1:3];x1[-(1:3)] 
x1[c(1,2,3)]
x1[x1>2];x1[x1>1&x1<4]
x2[x1[2]] #显示x2向量中下标等于x1中第二个元素的值

#常用函数  seq()、which()
seq(5,10,by=2)  #从5到10 产生等差数列，差值为2
seq(5,100,length=10)  #从5到100 产生等差数列，共产生10个数，公差根据个数和范围，系统自己算

letters[1:26]


#which 就是返回各种各样的下标 
which.max(x2) #返回某向量中最大数的下标
x2[which.max(x2)] 
which(x2==10) #返回x2向量中值为10的下标
which(x2>5)

rev(x1) #颠倒数值位置
sort(x1)  #对x1进行排序 

#matrix 将向量生成矩阵，规定数据集及是否按行来排，默认按照列来排 
x4=c(1:12)
matrix(x4,nrow = 3,ncol = 4,byrow = T)
a=matrix(x4,nrow = 3,ncol = 4)
a[1,2];a[x1[1],x1[2]]  #数据的挑选和显示 


#矩阵的相加相减需要有同样的行列  
#矩阵相乘

#求对角线
diag(a)

#以某向量为对角线构建矩阵
diag(diag(a))

#以数为参数时，表示阶数个数等于参数的单位矩阵  
diag(4)

#求逆矩阵(矩阵必须是正方形的)

b=matrix(rnorm(16),nrow = 4,ncol = 4)
solve(b)

#用solve(a,b)解方程组
c=c(1,2,3,4)
solve(b,c)  #表示解bx=c的方程组，求出x1,x2,x3,x4


#求出矩阵的特征值和特征向量
a.e=eigen(b,symmetric = T)
a.e 





help("rnorm") #随机产生x个均值为0，标准差为1的正态分布数值









