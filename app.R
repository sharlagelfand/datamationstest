library(shiny)
library(datamations)
library(dplyr)

# Define UI for application that draws a histogram
ui <- fluidPage(

        # Show a plot of the generated distribution
        mainPanel(
           datamationSandDanceOutput("datamation")
        )
    )

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$datamation <- renderDatamationSandDance({
      "small_salary %>% group_by(Degree) %>% summarise(mean = mean(Salary))" %>%
        datamation_sanddance()
    })
}

# Run the application
shinyApp(ui = ui, server = server)
