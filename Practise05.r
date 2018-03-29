#图形颜色

#palette()  查看系统中当前调色板，col函数可以用数值来表示  

#并且可以根据自己的喜好修改调色板，用default 来返回缺省调色板 
#col值也可以是颜色值，在网站上查询自己想要的颜色值即可 
#heat.color()可以根据参数值来随机产生颜色由深到浅的n个颜色，参数可以根据图例的个数 

heat.colors(5)

#可以通过RColorBrewer进行选色，管理调色板等工作 
library(RColorBrewer)
display.brewer.all()


brewer.pal(7,"YlOrRd") #在某个色系里生成7个由浅到深的颜色，以及显示其值
display.brewer.pal(7,"YlOrRd") #把上边的这七个值显示出来，画图的时候用 参数可以根据图例的个数

#plot中的beside=T 可以循环使用颜色 

#其它自动产生函数有rainbow() 跟heat.color是一样的效果 


#背景颜色设置

par(bg="gray")  #在画图工具中设置北京色的参数  bg
plot(rnorm(100))

#col控制图形的颜色，col.axis  坐标轴的颜色  col.lab 是坐标轴说明的颜色 

#cex 控制三点的大小

#pch 控制散点的形状 

#points()  低水平的作图命令，可以在plot上继续画图  

#ylim  限制坐标轴的范围 

#line  为划线函数   lty 限制线的类型    lwd 限制线的宽度

#bty  限制bar的类型  

#box 函数，可以将整个坐标轴  用方框包裹起来 

box(which = "figure")

#xaxp 设置坐标轴刻度如  xaxp=c(0,100,10)  从0到100，每10个间隔一个刻度  

#par(fin=c(5,5))  设置坐标轴的大小，fin即 figure inch的意思   样例为5英寸乘以5英寸 

# pin为plot inch的意思 

#ami omi 控制 各个层边缘之间的距离 





