---
title       : Predict the gasoline consume of every car
subtitle    : An example of multiple linear regression application
author      : Massimo Morelli
job         : BI consultant, future data scientist
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
--- .class #id bg:url(https://raw.githubusercontent.com/momobo/DDP_slide/master/img/bgWhite.jpg)

## A tool for Gasoline Consumption Prediction

* Draw from the power of the mighty multiple linear model
* Is it hosted to shiniapps.io
* It is only a proof of concept, but it works!

--- .class #id bg:url(https://raw.githubusercontent.com/momobo/DDP_slide/master/img/bgWhite.jpg)

## Linear model
* The data available are collected in 1974 from Motor Trend, and comprise fuel consumption and som aspects of automobile design for 32 automobiles. 
* A linear model has been developed to model the consumption in miles per gallon, using three simple predictors: the weight of the car in lb * 1000, the time in seconds to cover 1/4 of mile and the type of transmission (automatic or manual)
* The model has been translated in metric unities 

--- .class #id bg:url(https://raw.githubusercontent.com/momobo/DDP_slide/master/img/bgWhite.jpg)

## The point of the exercise
* The use the combination of statistical language R, the simple developement of models and the rapid
deployment with shinyapp.io demonstrate the extreme facility in developing and deploying simple plug-in statistical product.

* A linear product could be deployed with a couple of lines of code:

```r
fit <- lm(mpg ~ am  + wt + qsec, mtcars)
coef(fit)
```

```
## (Intercept)          am          wt        qsec 
##       9.618       2.936      -3.917       1.226
```


--- .class #id bg:url(https://raw.githubusercontent.com/momobo/DDP_slide/master/img/bgWhite.jpg)

## Why this app is cool in itself
* You could evaluate the gasoline consumption of a car from three simple basic characteristics and then, knowing how many kilometer you do in a year, evaluate the yearly gasoline cost.

(yes, I know that this is not very precise, but you know, prediction is hard!)

And Don't forget to try it: https://momobo-coursera.shinyapps.io/DDP_Project/


