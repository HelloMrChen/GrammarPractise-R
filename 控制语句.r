#条件语句 if else 

x<-c(1,2,3,-5)

#如果x中存在负数，那么x赋值为y，否则将x+1 赋值给y
if(any(x<0)) y<-x else y<-x+1
y
# [1]  1  2  3 -5

#这两者的语句是类似的
y<-if(any(x<0)) x else x+1
y

#switch语句
#switch有点像选择表达式，但是参数中能加上多个值以供选择
#基本用法为switch(statement,list),如果statement返回的是1到length(list)之间的值，那么返回statement等于list下标的值
#，否则返回null
x<-3
switch(x,mean(1:3),rnorm(4),2+2)
# [1] 4

#list也是可以有别名的，当有别名时，那么statement可以是list的别名
y<-"friut"
switch(y,friut="banana",price=1.2)
# [1] "banana"
switch("price",friut="banana",price=1.2)
# [1] 1.2

#for循环，for 循环的格式为for(names in expr ) expr2
#for循环跟其它语句中的for循环类似，没有太大区别，例如我们构建4阶矩阵 

n<-4
x<-array(0,dim = c(n,n))
for (i in 1:n) {
  for (j in 1:n) {
    x[i,j]=1/(i+j+1)
  }
}

#         [,1]      [,2]      [,3]      [,4]
# [1,] 0.3333333 0.2500000 0.2000000 0.1666667
# [2,] 0.2500000 0.2000000 0.1666667 0.1428571
# [3,] 0.2000000 0.1666667 0.1428571 0.1250000
# [4,] 0.1666667 0.1428571 0.1250000 0.1111111

#while 语句
#while 的一般行为是 while(condition) expr

x<-1
while (x<3) {
  print(x)
  x<-x+1
}
# [1] 1
# [1] 2

#repeat() 语句是循环执行函数体内的数据 ，依靠break进行退出
#我们创建一个1000以内的斐波那契数列 

f<-1;f[2]<--1;i<-1
repeat(
  f[i+2]<-f[i]+f[i+1]
  i<-i+1
  if(f[i]+f[i+1]>=1000) break
)






