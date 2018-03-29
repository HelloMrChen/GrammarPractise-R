#向量、数组之间的转换和判断
x=c(1:6)
is.array(x)
is.vector(x)

dim(x)<-c(2,3) #给x多增加一层定义
is.array(x)
is.matrix(x) #矩阵和数组之间其实并没有太严格的定义

#数据框的认识，跟矩阵不同在于矩阵所有列都是数值类型，是线性代数中的载体，而数据框更像是表格

x1=rnorm(15);x2=rnorm(15)
a=data.frame('长度'=x1,'宽度'=x2) #数据框内的两个向量必须是相同行数
plot(a)


#R语言读剪切板中的内容
y=read.table("clipboard",header = T) #拷贝剪切板，并拷贝表头

#如果不用rstudio，读excel可以用ODBCConnectExcel("x.xls")

#R中的循环语句,for while 
for (i in 1:59) {
  b[i]=i*2+3
  i=i+2
} #此处的循环变量并没有让for循环里的i每次加2

i=1
while (i<=10) {
  print(i)
  i=i+1
}

print(i) #打印数值的大小

#运行脚本的函数为
#source()  参数为文件的绝对路径 



#综合性的例子，模拟产生统计专业同学的名单，记录数学分析，线性代数、概率统计三科成绩，
#然后进行一些统计分析
num=seq(10378001,10378100)
num
x1=round(runif(100,80,100)) #round 默认小数位位0，runif产生均匀分布的随机数
x2=round(rnorm(100,mean = 80,sd=7))#产生100个平均值为80，标准差为7的100个正态分布数
x3=round(rnorm(100,mean = 83,sd = 13)) #正态分布随机数中是没有上下限的
x3[which(x3>100)]=100  #异常值的处理 

x=data.frame(num,x1,x2,x3)
#write.table 可以将数据框写入到文件 

#计算平均值  means(),colmeans()
mean(x);colMeans(x)  #mean()函数只能计算数学类型的值，比如数值向量，矩阵等，数据框不可以 

colMeans(x)[c("x1","x2","x3")]
apply(x,2,mean)# 对x进行操作，2表示在列的方向上操作，mean表示做的操作室平均值计算 

#计算每个人的总分
sumScore=apply(x[c("x1","x2","x3")],1,sum)

x=data.frame(num,x1,x2,x3,sumScore)
x

#数据框、矩阵、向量的数据查看方式
m=matrix(1:16,nrow = 4,ncol=4)
m[1,];m[1,2]
dataframe=x
dataframe[c("x1","x2")]  #通过组成数据框的列进行挑选
x1[1:4]


#总分最高的同学 
x$num[which.max(apply(x, 1, sum))]
















