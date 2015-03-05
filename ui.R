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
<<<<<<< HEAD
             selectInput("status", 
                         label = h5("Status:"),
                         choices = list("single","joint"),
                         selected = "single")),
      column(width = 3.6, offset = 0,
             selectInput("state", 
                         label = h5("State:"),
                         choices = list("Alabama","Arizona","Arkansas",
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
=======
             selectInput("state", 
                         label = h5("State:"),
                         choices = list("AK","CO","IL","IN","FL","MD","NV",
                                        "NH","SD","TN","TX","WA","WY"),
                         selected = "MD"))
>>>>>>> 0db0cfa1bb8018c49c828092d54f2a6d2f7ca2fd
      
    )
  ),
  mainPanel(textOutput("text1")
  )
))