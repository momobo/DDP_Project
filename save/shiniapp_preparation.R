runApp()
library(ggplot2)

getwd()
setwd("..")

setwd("09_DevelopingDataProducts\\DDP_Project")
library(ggplot2)
fit8 <- lm(mpg ~ am  + wt + qsec, mtcars)
coef(fit8)
levels(mtcars$am) <- c("manual", "automatic")

w <- 1500
t <- 0
m <- 12
q <- 20.0
mtcars2 <- mtcars
mtcars2$big <- 4
newCar <- data.frame(m/0.425144, NA, NA, NA, NA, w/453.592, q, NA, t, NA, NA, 8)
names(newCar) <- names(mtcars2)
mtcars2 <- rbind(mtcars2, newCar)
g <- ggplot(mtcars2, aes(x=wt*453.592,y=mpg*0.425144, colour=qsec, size=as.factor(big), shape=as.factor(am)))
g <- g + geom_point() 
g <- g + xlab("Weight in kg") + ylab("Gas consume in km/l")
g <- g + ggtitle("See the predicted car confronted with the others")
g <- g + theme(plot.title = element_text(lineheight=.10, face="bold"))
g <- g + annotate("text", x = w+100, y = m+0.5, label = "predicted car")
g <- g + scale_shape_discrete(name="Transmission", labels=c("manual", "automatic"))
g <- g + scale_size_manual(name="Car", labels=c("real", "predicted"), values=c(4,8))
g + scale_colour_gradient(low = "green", high = "red", "time 400 m")

mtcars2


qplot(qsec, mpg, data=mtcars)

str(mtcars)
str(q)
?geom_point
?cbind
str(mtcars2)
?ggtitle

zz <- data.frame(m, NA, NA, NA, NA, w, q, NA, t, NA, NA, 8)
dim(zz)
dim(mtcars2)
mtcars2
?data.frame

scale_shape_discrete
discrete_scale
attributes(scale_shape_discrete)
