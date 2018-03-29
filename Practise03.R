li=iris


#相关系数
cor(li[1],li[2])
li=iris[which(iris$Species=="setosa"),1:2]  #筛选出花种类为setosa的花的茎长和宽的数据
plot(li)

#相关系数显著性检验
cor.test(li$Sepal.Length,li$Sepal.Width)# 这里参数填写 li[1],li[2]是不行的，因为不是向量类型，而是list类型

#线性回归分析函数 lm() ,参数为y~1+x 等各种形式，需要参考场景？
# 将lm的结果赋给a，然后通过sumaary 查看a的详细内容 

# 建立好的模型可以存储到一个模型对象a中，然后通过predict进行预测，比如predict(a,z),z为其中一个值 

#多元线性相关分析，将多个向量数据plot，就能两两画出散点图  


View(swiss)
s=lm(Fertility~.,data = swiss)
summary(s)

#update 更新之前的函数，薛毅书  326页  

step() #逐步回归法，参数可以为forward 以及backward  




