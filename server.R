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
      t <- as.numeric(input$am)
      q <- as.numeric(input$qsec)
      
      if(is.na(w) | is.na(t) | is.na(q)){PLOT <- FALSE}else{PLOT <- TRUE}
      
      # calculating consume
      m <- calcMPG(w, t, q)
      
      # prepare a data frame containing the additional point "predicted car"
      mtcars2 <- mtcars
      mtcars2$big <- 4
      newCar <- data.frame(m/0.425144, NA, NA, NA, NA, w/453.592, q, NA, t-1, NA, NA, 8)
      names(newCar) <- names(mtcars2)
      mtcars2 <- rbind(mtcars2, newCar)

      # plotting (verbosely) it
      g <- ggplot(mtcars2, aes(x=wt*453.592,y=mpg*0.425144, colour=qsec, size=as.factor(big), shape=as.factor(am)))
      g <- g + geom_point() 
      g <- g + xlab("Weight in kg") + ylab("Gas consume in km/l")
      g <- g + ggtitle("See the predicted car confronted with the others")
      g <- g + theme(plot.title = element_text(lineheight=.10, face="bold"))
      g <- g + annotate("text", x = w+100, y = m+0.5, label = "predicted car")
      g <- g + scale_shape_discrete(name="Transmission", labels=c("manual", "automatic"))
      g <- g + scale_size_manual(name="Car", labels=c("real", "predicted"), values=c(4,8))
      g <- g + scale_colour_gradient(low = "green", high = "red", "time 400 m")
      
      if(PLOT){
        print(g)
      }

    })
  }
)
