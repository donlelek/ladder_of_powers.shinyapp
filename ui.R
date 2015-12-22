library(shiny)

shinyUI(fluidPage(
      titlePanel("Ladder of Powers"),
      sidebarLayout(
        sidebarPanel(
          selectInput("data",
                      "Select variable:",
                      choices = names(mtcars),
                      selected = mtcars[,1]),

          selectInput("power",
                      "Power transformation:",
                      choices = list("Reciprocal of quadratic" = -2,
                      "Reciprocal" = -1,
                      "Reciprocal of Square root" = -0.5,
                      "Natural logarithm (ln)" = 0,
                      "Square root (0.5)" = 0.5,
                      "Identity" = 1,
                      "Quadratic" = 2),
                      selected = 1),
          
          p("This is simple graphical implementation of Tukey's ladder of powers tranformation."),
          p("I used the variables from the r-base 'mtcars' dataset as example.")
        ),

        mainPanel(
          plotOutput("histPlot", height = "300px"),
          plotOutput("qnormPlot", height = "300px")
          )
      ))
)
