library(shiny)
library(ggplot2)

fit8 <- lm(mpg ~ am  + wt + qsec, mtcars)
#am <- 0
#qsec <- 20

calcMPG <- function(wgt, am, qsec){
  wgt_mpg = wgt / 453.592
  mpg <- coef(fit8)[1] + wgt_mpg * coef(fit8)[3] + as.numeric(am) * coef(fit8)[2] + qsec * coef(fit8)[4]

  kml <- mpg * 0.425144
  names(kml) <-"km/l"
  kml
}

shinyServer(
  function(input, output) {

    output$inputValue <- renderPrint({paste(input$weight,"(weight);",  
                                            input$am,"(transm.)",  
                                            input$qsec,"(time 1/4 ml)" )})
    output$prediction <- renderPrint({calcMPG(input$weight, input$am, input$qsec)})
    output$distPlot <- renderPlot({
        w <- as.numeric(input$weight)
        if(is.na(w)){w <- 1500}
        tt <- as.numeric(input$am)
        if(is.na(tt)){tt = 0}
        q <- as.numeric(input$qsec)
        if(is.na(q)){q <- 1500}
        
        m <- calcMPG(input$weight, input$am, input$qsec)
        
        g <- ggplot(mtcars, aes(x=wt*453.592,y=mpg*0.425144, colour=qsec, shape=as.factor(am)))
        g <- g + xlab("Weight in kg") + ylab("Gas consume in km/l") 
        g <- g + geom_point() + scale_colour_gradientn(colours=rainbow(3))
        g <- g + ggtitle("See your car confronted with the others")
        g <- g + annotate("text", x = w+100, y = m+0.5, label = "Predicted Car")
        g <- g + scale_shape_discrete(name="Transmission", labels=c("manual", "automatic"))
        g + geom_point(x=w, y=m, shape=tt+16, col=q, size=5)
        
    })
  }
)
