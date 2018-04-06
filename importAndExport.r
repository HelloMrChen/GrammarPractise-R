#查看数据集的相关函数

str(iris) #查看数据结构类型、观测值数、列数、以及每个列的大体概况
names(iris)#查看数据结构中的列名，及赋值列名

#R数据的保存与加载
setwd("/Users/gavinchen/我的文档/MBA养成记/2-自我提升/2-数据分析/程序练习/GrammarPractise-R")
a<-c(1,2,3,4)
save(a,file = "./data/dumpData.Rdata")
rm(a)
load("./data/dumpData.Rdata")#load 之后会自动将该数据赋值为之前保存时的变量

#----csv文件的保存于加载
var1<-(1:5)
var2<-(1:5)/10
var3<-c("R","and","data","mining","case")
df<-data.frame(var1,var2,var3)
names(df)<-c("int","real","str")
write.csv(df,file = "./data/dumpData.csv",row.names = TRUE) #行数row.names默认不打印
df2<-read.csv("./data/dumpData.csv")
print(df2)

#----通过ODBC导入导出数据
library(RODBC)
#构建数据库链接
conn<-odbcConnect(dsn = "dataSource",pwd = "123",uid = "root")# dsn为自己定义
#构建自定义查询语句
query<-"select * from my_table"
#查询语句也可以从文件中读取
query<-readChar("./data/sqlQuery.sql",nchars = 99999)
#返回结果
myData<-sqlQuery(conn,query,errors = TRUE)

#从excel中导入导出数据
library(xlsx)
filename<-"./data/dumpData.xls"
excelData<-read.xlsx(filename)
write.xlsx(excelData,file = "./data/dumpData.xlsx",row.names = TRUE) #行数row.names默认不打印


#本次学习关键词 save()、load()、read.csv()、write.csv()、read.xlsx()、write.xlsx()
#odbcConnect、readChar、sqlQuery

















