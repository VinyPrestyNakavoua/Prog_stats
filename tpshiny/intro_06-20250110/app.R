library(shiny)
library(ggplot2)

datasets <- c("economics", "faithfuld", "seals")

ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  tableOutput("le_graphe")
)

server <- function(input, output, session) {
  
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  
  output$summary <- renderPrint({
    summary(dataset())
  })
  
  output$le_graphe <- renderPlot({
    plot(dataset())
  }, res = 96)
}

shinyApp(ui, server)