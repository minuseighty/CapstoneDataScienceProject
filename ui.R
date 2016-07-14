library(shiny)
require(markdown)


shinyUI(
    navbarPage("Predictive Text Model Application: A Capstone Poject",
               tabPanel("Application",
                        sidebarPanel(
                            
                            ## create text input box
                            helpText("Input a word or phrase in order
                                     to recieve 3 possible next words"),
                            textInput(inputId = "text",
                                      label = NULL,
                                      value = "Enter text..."),
                            submitButton("Predict")
                            
                        ),
                        
                        ## deliver output based on input
                        mainPanel(
                            h4("User Input", align = "left"),
                            div(textOutput("user"), style = "color:blue"),
                            br(),
                            br(),
                            h4("Predictions", align = "left"),
                            div(htmlOutput("predict"), style = "color:red")
                        )),
               tabPanel("Documentation",
                        mainPanel(
                            includeMarkdown("documentation.md")
                        )
                        )
               )
)
