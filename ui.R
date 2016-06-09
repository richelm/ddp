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
                  selectize = TRUE),
      helpText(h3("Help Text"),"Put help here",
               "You can have mulitple lines.",
               "Do long line wrap around? That would be nice if they did. Would make it easier.",
               br(),br(),
               "It seems they do.")
    ),
    
    # main panel
    mainPanel(
      tabsetPanel(
        tabPanel("modelFormula",
                 tags$div(style="margin: auto;padding: 50px 50px 50px 50px",
                          textOutput("theModel"))),
        tabPanel("Model Summary",
                 verbatimTextOutput("summ")),
        tabPanel("Plot",
                 plotOutput("myplot"))
      )
    )
  )
  
))