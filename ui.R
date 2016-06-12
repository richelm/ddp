library(shiny)

shinyUI(fluidPage(
  # application header
  titlePanel(title = h3("Expoloring Linear Models with MTCARS Dataset")),

  column(4, wellPanel(
    checkboxGroupInput("vars", "Choose Variables for Model",
                       c("Number of cylinders" = "cyl",
                         "Displacement (cu.in.)" = "disp",
                         "Gross horsepower" = "hp",
                         "Rear axle ratio" = "drat",
                         "Weight (1000 lbs)" = "wt",
                         "1/4 mile time" = "qsec",
                         "Cylinder alignment (0 - V; 1 - straight)" = "vs",
                         "Number of forward gears" = "gear",
                         "Number of carburetors" = "carb")),
    hr(),
    radioButtons("view",
                 "Review Model Summary and Plots",
                 c("Summary" = "summary",
                   "Residuals vs Fitted" = "ResidualsFitted",
                   "Normal Q-Q" = "NormalQQ",
                   "Scale-Location" = "ScaleLocation",
                   "Cook's distance" = "CooksDistance",
                   "Residuals vs Leverage" = "ResidualsLeverage",
                   "Cook's dist vs Leverage" = "CooksdistLeverage")
    )
  )),
  
  column(8,
         tabsetPanel(
           tabPanel("Output",
             h4(textOutput("theModel")),
             hr(),
             conditionalPanel(
               "input.view == 'summary'",
               h4("Model Summary"),
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
           ),
           tabPanel("Help",
                    br(),
                    h4("Building Your Model"),
                    p("It has been shown that the type of transmission (am), automatic ",
                      "or manual, impacts the miles per gallon a car will get."),
                    p("Review the variables of the mtcars dataset and correlation of variables with mpg ",
                      "before you begin building your model. In addition to transmisssion, which variables ",
                      "are good predictors for mpg outcome variable?"),
                    p("Select additional variables that may impact mgp to create linear models. Review ",
                      "summary and plots to see which variables give the best model fit for predicting",
                      "mpg."),
                    h4("MTCARS Dataset Variables"),
                    pre(
                    "mpg         Miles/(US) gallon",
                    "cyl         Number of cylinders",
                    "disp        Displacement (cu.in.)",
                    "hp          Gross horsepower",
                    "drat        Rear axle ratio",
                    "wt          Weight (1000 lbs)",
                    "qsec        1/4 mile time",
                    "vs          Cylinder alignment (0 - V; 1 - straight)",
                    "am          Transmission type (0 = automatic, 1 = manual)",
                    "gear        Number of forward gears",
                    "carb        Number of carburetors"),

                    p("The output below shows the correlation among the variables in the mtcars dataset ",
                      "with the mpg. Ones with a high correlation with mpg are good canidates for your model."),
                    verbatimTextOutput("corVars"))
  ))
))