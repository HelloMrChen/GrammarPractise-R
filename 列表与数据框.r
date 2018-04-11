# --列表

#列表是一种特殊的对象集合，跟数组一样，他的元素也有序号确定，但是不同点在于可以存在不同类型的元素。
Lst<-list(name="Fred",no.children=3,wife="Lucy",children.ages=c(4,7,9))
# $name
# [1] "Fred"
# 
# $no.children
# [1] 3
# 
# $wife
# [1] "Lucy"
# 
# $children.ages
# [1] 4 7 9

#列表元素可以Lst[[下标]]
Lst[[2]];Lst[[1]]
# [1] 3

Lst[[4]][2]
# [1] 7

#列表不同于向量，下标不能用向量的方式引用
Lst[[1:2]]
# Error in Lst[[1:2]] : 下标出界

#需要注意的是list[下标]的方式也是合法的，但是返回的是资料表类型，最为标准的引用类型是list[[下标]]，
#这样返回的是原数据类型

#列表的修改
#增加元素
Lst$income<-10000
Lst$name<-"Gavin"
Lst$wife<-NULL
Lst
# $name
# [1] "Gavin"
# 
# $no.children
# [1] 3
# 
# $children.ages
# [1] 4 7 9
# 
# $income
# [1] 10000

#----数据框
df<-data.frame(
  Name=c("Alice", "Becka", "James", "Jeffrey", "John"),
  Sex=c("F", "F", "M", "M", "M"),
  Age=c(13, 13, 12, 13, 12),
  Height=c(56.5, 65.3, 57.3, 62.5, 59.0),
  Weight=c(84.0, 98.0, 83.0, 84.0, 99.5)
)
df
#     Name  Sex  Age Height Weight
# 1   Alice   F  13   56.5   84.0
# 2   Becka   F  13   65.3   98.0
# 3   James   M  12   57.3   83.0
# 4 Jeffrey   M  13   62.5   84.0
# 5    John   M  12   59.0   99.5
class(df)
# [1] "data.frame"

Lst<-list(
  Name=c("Alice", "Becka", "James", "Jeffrey", "John"),
  Sex=c("F", "F", "M", "M", "M"),
  Age=c(13, 13, 12, 13, 12),
  Height=c(56.5, 65.3, 57.3, 62.5, 59.0),
  Weight=c(84.0, 98.0, 83.0, 84.0, 99.5)
)
Lst
# $Name
# [1] "Alice"   "Becka"   "James"   "Jeffrey" "John"   
# $Sex
# [1] "F" "F" "M" "M" "M"
# $Age
# [1] 13 13 12 13 12
# $Height
# [1] 56.5 65.3 57.3 62.5 59.0
# $Weight
# [1] 84.0 98.0 83.0 84.0 99.5

class(Lst)
# [1] "list"

as.data.frame(Lst)
#     Name Sex Age Height Weight
# 1   Alice   F  13   56.5   84.0
# 2   Becka   F  13   65.3   98.0
# 3   James   M  12   57.3   83.0
# 4 Jeffrey   M  13   62.5   84.0
# 5    John   M  12   59.0   99.5

#矩阵也可以转换为数据框，如果之前有列名就用之前的列名，没有的话系统会自动起一个
a<-array(1:6,dim=c(2,3))
a
#       [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6
as.data.frame(a)
#   V1 V2 V3
# 1  1  3  5
# 2  2  4  6

#--数据框的引用，直接用下标、列名来引用数据框
df[1:3,3:4]
#   Age Height
# 1  13   56.5
# 2  13   65.3
# 3  12   57.3

df[["Name"]]
# [1] Alice   Becka   James   Jeffrey John   
# Levels: Alice Becka James Jeffrey John   #很明显转化为了factor类型

df$Name
# [1] Alice   Becka   James   Jeffrey John   
# Levels: Alice Becka James Jeffrey John

names(df)

rownames(df)<-c("one","two","three","four","five")
df
#           Name Sex Age Height Weight
# one     Alice   F  13   56.5   84.0
# two     Becka   F  13   65.3   98.0
# three   James   M  12   57.3   83.0
# four  Jeffrey   M  13   62.5   84.0
# five     John   M  12   59.0   99.5


#在每次引用df中的属性时，我们都要加上$，为了避免这种麻烦，我们采用attch函数
attach(df)
Name  #这样就能直接引用df中的变量了
# [1] Alice   Becka   James   Jeffrey John   
# Levels: Alice Becka James Jeffrey John
detach(df)
Name
# 错误: 找不到对象'Name'
