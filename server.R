library(shiny)
data("mtcars")

shinyServer(
  function(input, output) {
    
    modelFit <- reactive({
      modelFormula <- as.formula(paste("mpg~",paste(input$vars,collapse="+")))
      lm(modelFormula,data = mtcars)
    })
    
    output$theModel <- renderText(paste("mpg~",paste(input$vars,collapse="+")))
    output$summ <- renderPrint({
      summary(modelFit())
    })
    
    output$myplot <- renderPlot({
      plot(modelFit(),which=2)
    })
  }
)