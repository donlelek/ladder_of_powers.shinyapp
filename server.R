library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  output$histPlot <- renderPlot({
   
    if (input$power == 0)
    x <- log(mtcars[,input$data])

    if (input$power != 0)
    x <- mtcars[,input$data]^as.numeric(input$power)
  
    qplot( x,
           main = paste("Histogram of: ", input$data, " ^ " , input$power),
           xlab = "") + theme_bw()
  
  })

  output$qnormPlot <- renderPlot({
    
    if (input$power == 0)
    x <- log(mtcars[,input$data])
    
    if (input$power != 0)
    x <- mtcars[,input$data]^as.numeric(input$power)
        
    qplot(sample = x,
          main = paste("QQ plot of", input$data, " ^ ", input$power),
          xlab = "") + theme_bw()
    
  })
})