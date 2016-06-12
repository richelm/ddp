library(shiny)
data("mtcars")

shinyServer(
  function(input, output) {
    modelFit <- reactive({
      model <- as.formula(paste(c(c("mpg ~ am"),input$vars),collapse = "+"))
      lm(model,data = mtcars)
    })

    output$theModel <- renderText(paste(c(c("model: mpg ~ am"),input$vars),collapse = " + "))
    
    output$summ <- renderPrint({
      summary(modelFit())
    })
    
    output$ResidualsFitted <- renderPlot({
      plot(modelFit(),which=1)
    })
    
    output$NormalQQ <- renderPlot({
      plot(modelFit(),which=2)
    })
    
    output$ScaleLocation <- renderPlot({
      plot(modelFit(),which=3)
    })
    
    output$CooksDistance <- renderPlot({
      plot(modelFit(),which=4)
    })
    
    output$ResidualsLeverage <- renderPlot({
      plot(modelFit(),which=5)
    })
    
    output$CooksdistLeverage <- renderPlot({
      plot(modelFit(),which=6)
    })
    
  }
)