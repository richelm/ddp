library(shiny)

shinyUI(fluidPage(
  # application header
  titlePanel(title = h3("Expoloring Linear Models with MTCARS Dataset")),

  column(4, wellPanel(
    selectInput("vars", "Choose Variables for Model",
                c("Cylinders" = "cyl",
                  "Displacement" = "disp",
                  "Horsepower" = "hp",
                  "Weight" = "wt"),
                selected = "",
                multiple = TRUE,
                selectize = TRUE),
    hr(),
    radioButtons("view",
                 "",
                 c("Summary" = "summary",
                   "Residuals vs Fitted" = "ResidualsFitted",
                   "Normal Q-Q" = "NormalQQ",
                   "Scale-Location" = "ScaleLocation",
                   "Cook's distance" = "CooksDistance",
                   "Residuals vs Leverage" = "ResidualsLeverage",
                   "Cook's dist vs Leverage" = "CooksdistLeverage")),
    helpText("Choose variables from selection above to use in your model. ",
             "Use the radio buttons to select among model summary and plots.")
  )),
  
  column(8,
         h4(textOutput("theModel")),
         hr(),
         conditionalPanel(
           "input.view == 'summary'",
           verbatimTextOutput("summ")
         ),
         conditionalPanel(
           "input.view == 'ResidualsFitted'",
           plotOutput("ResidualsFitted")
         ),
         conditionalPanel(
           "input.view == 'NormalQQ'",
           plotOutput("NormalQQ")
         ),
         conditionalPanel(
           "input.view == 'ScaleLocation'",
           plotOutput("ScaleLocation")
         ),
         conditionalPanel(
           "input.view == 'CooksDistance'",
           plotOutput("CooksDistance")
         ),
         conditionalPanel(
           "input.view == 'ResidualsLeverage'",
           plotOutput("ResidualsLeverage")
         ),
         conditionalPanel(
           "input.view == 'CooksdistLeverage'",
           plotOutput("CooksdistLeverage")
         )
  )
))