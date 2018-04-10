#R中的对象与他的模式和属性

#--------固有属性mode和length
#mode 即向量的类型，可以分为数值型、逻辑型、复数型、字符型
mode(c(1,2,3))
# [1] "numeric"
mode(c(1,2,3)<3)
# [1] "logical"

#使用is.character可以判断某个对象的类型
is.character(c("1","2")) #另外有is.logical
# [1] TRUE

#使用as.character可以强制进行类型转换
as.numeric(c("1","2"))
# [1] 1 2

#length 即向量的长度，这个跟数组的类型相似
length(c(1,2,3))
# [1] 3

a<-numeric()
a[3]<-3
# [1] NA NA  3

#一般缩短长度和增加长度只需要在此赋值即可,例如
a<-1:10
# [1]  1  2  3  4  5  6  7  8  9 10
a<-a[2*1:5]
# [1]  2  4  6  8 10
a<-1:4
# [1] 1 2 3 4

#------函数attribute和attr 
#attributes返回 对象所包含的特殊属性，而不包含固有属性mode和length
x<-c(apple=2.5,orange=2.0)
attributes(x)
# > attributes(x)
# $names
# [1] "apple"  "orange"
attr(x,"names")
# > attr(x,"names")
# [1] "apple"  "orange"

attr(x,"names")[1]
# [1] "apple"


#attr除了能取出相应的属性之外，还能给对象添加新的属性
attr(x,"type")<-"fruit"
attributes(x)
# $names
# [1] "apple"  "orange"
# 
# $type
# [1] "fruit"

#attr同样也可以对已有的属性进行修改
attr(x,"names")<-c("apple","grage")
attributes(x)
# $names
# [1] "apple" "grage"
# 
# $type
# [1] "fruit"

#R中的class 属性是用来支持面向对象的概念，class函数能返回对象的类

class(x)
# [1] "numeric"  #这里的numeric并不是类型，而是数据类型的类