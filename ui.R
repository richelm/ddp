library(shiny)

shinyUI(fluidPage(
  # application header
  titlePanel(title = h3("Expoloring Linear Models with MTCARS Dataset")),

  column(4, wellPanel(
    checkboxGroupInput("vars", "Choose Variables for Model",
                       c("Number of cylinders" = "cyl",
                         "Displacement (cu.in.)" = "disp",
                         "Rear axle ratio" = "drat",
                         "Gross horsepower" = "hp",
                         "Weight (1000 lbs)" = "wt",
                         "Number of forward gears" = "gear",
                         "Number of carburetors" = "carb")),
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
    radioButtons("showHelp",
                 "Show Help",
                 c("Yes" = "yes",
                   "No" = "no"),
                   selected = "no",
                   inline = TRUE),
    conditionalPanel(
      "input.showHelp == 'yes'",
      helpText("It has been shown that the type of transmission (am), automatic ",
               "or manual, impacts the miles per gallon a car will get.",
               " ",
               "Select additional variables that may impact mgp to create linear models. Review",
               "summary and plots to see which variable give the best model fit for predicting",
               "mpg.")
    )
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