# FILE: lab2.3
#

# set working directory
setwd("/home/richs/Documents/course_notes/ISLR")

# 2.3.1 Basic Commands

# create vector x
x <- c(1,3,2,5)
x

# you can use <- or = as assignment operator
x = c(1,6,2)
x
y = c(1,4,3)

# length of a vector
length(x)
length(y)

# adding vector
x + y

# obtain list of of objects
ls()

# remove an object
rm(x)

# remove all objects
rm(list=ls())

ls()

# matrix function
x=matrix (data=c(1,2,3,4) , nrow=2, ncol =2)
x
# default is by column; byrow=FALSE
x=matrix (data=c(1,2,3,4) , nrow=2, ncol =2, byrow = TRUE)
x
# functions operator on all elements of a matrix
sqrt(x)

# random normal variables
x <- rnorm(50)
y=x+rnorm (50, mean=50, sd=.1)
cor(x,y)

mean(x)
sqrt(var(x))
sd(x)
mean(y)

# 2.3.2 Graphics
x=rnorm (100)
y=rnorm (100)
plot(x,y)
plot(x,y,xlab=" this is the x-axis",ylab=" this is the y-axis",
     main=" Plot of X vs Y")

# save a plot
pdf("Figure.pdf")
plot(x,y,col =" green ")
dev.off ()

# generating sequences; seq()
x = seq(1,10)
x
x = 1:10
x
x=seq(-pi ,pi ,length =50)
x

# contour plots
y=x
f=outer(x,y,function (x,y)cos(y)/(1+x^2))
contour (x,y,f)
contour (x,y,f,nlevels =45, add=T)
fa=(f-t(f))/2
contour (x,y,fa,nlevels =15)

# image() and persp()
image(x,y,fa)
persp(x,y,fa)
persp(x,y,fa ,theta =30)
persp(x,y,fa ,theta =30, phi =20)
persp(x,y,fa ,theta =30, phi =70)
persp(x,y,fa ,theta =30, phi =40)

# 2.3.3 Indexing Data
