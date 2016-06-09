library(shiny)
data("mtcars")

shinyServer(
  function(input, output) {
    
    modelFit <- reactive({
      f <- paste("mpg ~ ",gsub(", ","+",toString(input$vars)))
      lm(f,data = mtcars)
    })
    
    output$theModel <- renderText(paste("mpg ~ ",gsub(", ","+",toString(input$vars))))
    output$summ <- renderPrint({
      summary(modelFit())
    })
    
    output$myplot <- renderPlot({
      plot(modelFit(),which=2)
    })
  }
)