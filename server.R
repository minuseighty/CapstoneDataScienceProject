library(shiny)
library(tm)
library(hash)

##read in data
source("global.R")


# Define server logic required to give prediction
shinyServer(function(input, output) {
    
    ##print the text given by the user
    output$user <- renderText({
              input$text
    })
    
    output$predict <- renderText({
        ## display in a numbered list
        prediction <- paste("<li>", predict.word(input$text), collapse="")        
        prediction <- paste("<ol>", prediction, "</ol>")
        print(prediction)
    })
    
})
