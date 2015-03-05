#server.R for Roth vs. Traditional

library(shiny)
source("helpers.R")
source("stateTax.R")

# Define server logic required to draw a histogram
shinyServer(
  function(input, output) {
    
    getFed <- reactive({
      fed_tax(as.numeric(input$income))
    })
    getState <- reactive({
        stateTax(input$state, input$status, as.numeric(input$income))
    })
#    getState <- reactive({
#      if(input$state=="AK"||input$state=="FL"||input$state=="NV"||
#           input$state=="NH"||input$state=="SD"||input$state=="TN"||
#           input$state=="TX"||input$state=="WA"||input$state=="WY"){
#        return(state_tax(as.numeric(input$income), "NT"))
#      }
#      state_tax(as.numeric(input$income), input$state)
#    })
    getFICA <- reactive({
      fica(input$income)
    })    
    getTotal <- reactive({
      total_tax(as.numeric(input$income), getState())
    })
    output$text1 <- renderText({
      paste("Based on an income of $",formatC(input$income,digits=2,
            format="f",big.mark=","),"and a standard deduction, your",
            "state taxes are $",formatC(getState(),digits=2,format="f",
            big.mark=","),",", "your federal taxes are $",formatC(getFed(),
            digits=2,format="f",big.mark=","),", and your FICA deductions",
            "are $",formatC(getFICA(),digits=2,format="f",big.mark=","),
            ".","Your total taxes are $",formatC(getTotal(),digits=2,
            format="f",big.mark=","),"and your post-tax pay is $",
            formatC(input$income - getTotal(),digits=2,format="f",
            big.mark=","), ".")
    })
    
    #output$plot <- renderPlot({    
      
      
      
    #  if(input$log ==TRUE){
    #    plot(years, assets, log = "y", type = "l", col = "blue",
    #        xlab = "Age", ylab = "Assets", main="Assets over Time")
    #  } else {
    #    plot(years, assets, log = "", type = "l", col = "blue",
    #         xlab = "Age", ylab = "Assets", main="Assets over Time")
    #  }
    #  abline(v=retire,col=3,lty=3)
    #})
    
  })