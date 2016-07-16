library(shiny)
library(shinydashboard)
require(markdown)

shinyServer(function(input, output) {
    output$predict <- renderText({
        
        ##display in a ordered list
        
        prediction <- paste("<li>", predict.word(user = input$text, 
                                                 results = input$slider),
                            collapse="")        
        prediction <- paste("<ul><font color = 'darkgreen'>", prediction, "</ul></font>")
        print(prediction)
    })
})