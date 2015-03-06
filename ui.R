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
             selectInput("status", 
                         label = h5("Status:"),
                         choices = list("single","joint"),
                         selected = "single")),
      column(width = 3.6, offset = 0,
             selectInput("state", 
                         label = h5("State:"),
                         choices = list("Alabama","Alaska","Arizona",
                                        "Arkansas",
                                        "California","Connecticut","Delaware",
                                        "Georgia","Hawaii","Idaho",
                                        "Illinois","Indiana","Iowa",
                                        "Kansas","Kentucky","Louisiana",
                                        "Maine","Maryland","Mass.",
                                        "Michigan","Minn.","Mississippi",
                                        "Missouri","Montana","Nebraska",
                                        "New Hampshire","New Jersey","New Mexico",
                                        "New York","North Carolian", "North Dakota",
                                        "Ohio","Oklahoma","Oregon",
                                        "Pennsylvania","Rhode Island","South Carolina",
                                        "Tenn.","Utah","Vermont",
                                        "Virginia","West Virginia","Wisconsin",
                                        "D.C."),
                         selected = "Alabama"))      
    )
  ),
  mainPanel(textOutput("text1")
  )
))