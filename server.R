library(shiny)


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
  }
)
