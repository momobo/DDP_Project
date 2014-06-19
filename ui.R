library(shiny)

# Define UI 
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Car consume prediction"),
  
    sidebarPanel(
      numericInput('weight', 'Weight kg', 1000, min = 500, max = 4000, step = 5),
     # numericInput('am', 'Transmission (0: man, 1: aut)', 0, min = 0, max = 1, step = 1),
      radioButtons("am", label = "Select Transmission",
                   choices = list("Manual" = 1, "Automatic" = 2),selected = 1),
      numericInput('qsec', '1/4 mile  (400m) time (s)', 20, min = 4, max = 50, step = 1)
      #, submitButton('Submit')
    ),
    mainPanel(
        h3('Results of prediction'),
        h4('You entered'),
        verbatimTextOutput("inputValue"),
        h4('Consume predicted in km/l: '),
        verbatimTextOutput("prediction")
    )
  )
)

