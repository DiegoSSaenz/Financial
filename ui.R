#ui.R for Roth vs. Traditional

library(shiny)

# Define UI for application that takes inputs and draws plot
shinyUI(fluidPage(
  
  inputPanel(
    fixedRow(
      column(width = 3.6, offset = 0,
             numericInput("income", label = h5("Gross Income:"), 
                          value = 50000)),
      column(width = 3.6, offset = 0,
             selectInput("state", 
                         label = h5("State:"),
                         choices = list("AK","CO","IL","IN","FL","MD","NV",
                                        "NH","SD","TN","TX","WA","WY"),
                         selected = "MD"))
      
    )
  ),
  mainPanel(textOutput("text1")
  )
))