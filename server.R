library(shiny)
library(datasets)
library(caret)
library(e1071)

shinyServer(function(input,output){
  output$distPlot <- renderText({
    predic <- paste(input$variable,collapse = "+")
    printvar <- paste(input$variable,collapse = " + ")
    
    if(predic==""){
     predic <- "."
     printvar <- "all"
    }
    
    data("iris")
    
    
    index <- createDataPartition(iris$Species, p=0.80, list=FALSE)
    # select 20% of the data for testing
    testset <- iris[-index,]
    # select 80% of data to train the models
    trainset <- iris[index,]
    
    #modFit <- train(Species ~., method = "rpart", data=trainset) #Fit model
    
    modFit <- train(as.formula(paste(colnames(iris)[5], "~",
                                     predic,
                                     sep = ""
    )), method = "rpart", data=trainset) #Fit model
    
    #modFit$results
    
    pred<-table(predict(object = modFit$finalModel,newdata = testset[,1:4],type="class"))
    paste("Accuracy of ",printvar," features :",modFit$results$Accuracy[1])
  })
})