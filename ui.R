#ui.R for Roth vs. Traditional

library(shiny)


# Define UI for application that takes inputs and draws plot
shinyUI(fluidPage(
  
  inputPanel(
    fixedRow(
      column(width = 3.6, offset = 0.0,
             numericInput("income", label = h5("Gross Income:"), 
                          value = 50000)),
      
      width = 3.6, offset = 0.0,
             selectInput("status", 
                         label = h5("Status:"),
                         choices = list("single","joint"),
                         selected = "single"),
      column(width = 3.6, offset = 0.0,
             selectInput("state", 
                         label = h5("State:"),
                         choices = list("Alabama","Alaska","Arizona",
                                        "Arkansas",
                                        "California","Colorado",
                                        "Connecticut","D.C.",
                                        "Delaware","Florida",
                                        "Georgia","Hawaii","Idaho",
                                        "Illinois","Indiana","Iowa",
                                        "Kansas","Kentucky","Louisiana",
                                        "Maine","Maryland","Massachusetts",
                                        "Michigan","Minnesota","Mississippi",
                                        "Missouri","Montana","Nebraska",
                                        "Nevada",
                                        "New Hampshire","New Jersey",
                                        "New Mexico",
                                        "New York","North Carolian", "North Dakota",
                                        "Ohio","Oklahoma","Oregon",
                                        "Pennsylvania","Rhode Island",
                                        "South Carolina","South Dakota",
                                        "Tennessee","Texas","Utah","Vermont",
                                        "Virginia","West Virginia",
                                        "Wisconsin"),
                         selected = "Alaska")),
      uiOutput("localityPanel")
#       conditionalPanel(
#           condition = "input.state == 'Alabama'",
#           selectInput("locality",
#                       label = h5("Locality:"),
#                       choices = localityList(state),
#                       ))
#       conditionalPanel(
#           condition = "input.state == 'Maryland'",
#           selectInput("locality",
#                       label = h5("Locality:"),
#                       choices = list("Allegany County","Anne Arundel County",
#                                      "Baltimore (city)","Baltimore County",
#                                      "Calvert County","Caroline Conty",
#                                      "Carroll County","Cecil County",
#                                      "Charles County","Dorchester County",
#                                      "Frederick County","Garrett County",
#                                      "Harford County","Howard County",
#                                      "Kent County","Montgomery County",
#                                      "Prince George's County",
#                                      "Queen Anne's County",
#                                      "St. Mary's County","Somerset County",
#                                      "Talbot County","Washington County",
#                                      "Wicomico County","Worcester County"),
#                       ))
    )
  ),
  mainPanel(textOutput("text1")
  )
))