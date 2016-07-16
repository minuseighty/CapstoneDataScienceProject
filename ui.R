library(shiny)
library(shinydashboard)
require(markdown)

shinyUI(
    dashboardPage(
        dashboardHeader(
            title = "Predictive Text Application: Capstone Poject",
            titleWidth = 600
        ),
        dashboardSidebar(
            sidebarMenu(
                menuItem("Application", tabName = "application", icon = icon("dashboard"),
                         badgeLabel = "app", badgeColor = "green"),
                menuItem("Documentation", icon = icon("th"), tabName = "documentation",
                         badgeLabel = "docs", badgeColor = "blue")
            )
        ),
        dashboardBody(
            tags$head(tags$style(HTML(".main-header .logo {
                                      font-family: 'Lobster', cursive;
                                      font-weight: bold;
                                      font-size: 24px;
                                      }
                                      "))),
            tabItems(
                tabItem(tabName = "application",
                        h2("Application", align = "left"),
                        fluidRow(
                            box(
                                title = "Prediction(s)",
                                solidHeader = TRUE,
                                status = "success",
                                htmlOutput("predict")
                            ),
                            box(
                                title = "Inputs",
                                solidHeader = TRUE,
                                status = "info",
                                helpText("Input a phrase and choose the number of predictions."),
                                sliderInput("slider",
                                            label = NULL,
                                            min = 1,
                                            max = 5,
                                            value = 3),
                                textInput(inputId = "text",
                                          label = NULL,
                                          value = "Enter text..."),
                                submitButton("Predict")
                            )
                            
                        )
                ),
                
                tabItem(tabName = "documentation",
                        h2("Documentation", align = "left"),
                        mainPanel(
                            includeMarkdown("documentation.md")
                        )
                )
            )
            
        )
        
        
    )
)
    
        