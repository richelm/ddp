library(shiny)

shinyUI(fluidPage(
  # application header
  titlePanel(title = h3("Expoloring Linear Models with MTCARS Dataset")),
  sidebarLayout(
    # sidebar panel for user input
    sidebarPanel(
      selectInput("vars", "Choose Variables for Model",
                  c("Cylinders" = "cyl",
                    "Displacement" = "disp",
                    "Horsepower" = "hp",
                    "Weight" = "wt",
                    "Transmission" = "am"),
                  selected = "am",
                  multiple = TRUE,
                  selectize = TRUE)
    ),
    
    # main panel
    mainPanel(
      tabsetPanel(
        tabPanel("Model Summary",
                 verbatimTextOutput("summ")),
        tabPanel("Plot",
                 plotOutput("myplot")),
        tabPanel("Formula",
                 wellPanel(tags$div(style="text-align: center",textOutput("theModel"))))
      )
    )
  )
  
))