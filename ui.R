library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Training model using classification tree on IRIS dataset"),
  
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("variable", "Variables to include for prediction:",
                         c("Sepal Length" = "Sepal.Length",
                           "Petal Length" = "Petal.Length",
                           "Petal Width" = "Petal.Width",
                           "Sepal Width" = "Sepal.Width"))
    ),
   
    # Show a plot of the generated distribution
    mainPanel(
      p("This model uses caret package to training prediction on IRIS dataset."),
      p("By default all the four features are used on predicting the species."),
      div("User can select the features manually to include in training the dataset. For every selection the model is retrained with the selected features", style = "color:blue"),
      br(),
      p("Accuracy is printed below for the features included in training"),
      
      
      textOutput("distPlot")
    )
  )
  
))