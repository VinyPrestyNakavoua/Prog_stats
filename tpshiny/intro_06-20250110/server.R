library(shiny)
library(ggplot2)

# Define server logic required to draw appropriate graphs
function(input, output, session) {
  
  ## Choisir le dataset
  dataset <- reactive({
    switch(input$dataset,
           "economics" = ggplot2::economics,
           "faithfuld" = ggplot2::faithfuld,
           "seals" = ggplot2::seals
    )
  })
  
  ## Choisir le choix dynamique
  output$dynamicinput <- renderUI({
    data <- dataset()  
    selectable_columns <- setdiff(names(data), "date") # Exclude the "date" column, we cannot plot it
    selectInput(
      inputId = "dynamicselect",
      label = "Choisissez la variable :",
      choices = selectable_columns
    )
  })
  
  output$summary <- renderPrint({
    data <- dataset()
    if (!is.null(input$dynamicselect)) {
      summary(data[[input$dynamicselect]])
    }
  })
  
  output$le_graphe <- renderPlot({
    data <- dataset()
    if (!is.null(input$dynamicselect)) {
      variable <- data[[input$dynamicselect]]
      
      if (is.numeric(variable)) {
        # Histogram for quantitative variables
        ggplot(data, aes(x = .data[[input$dynamicselect]])) +
          geom_histogram(binwidth = diff(range(variable)) / input$bins, fill = input$color, color = "white") +
          labs(title = paste("Histogramme de", input$dynamicselect), x = input$dynamicselect, y = "Fréquence") +
          theme_minimal()
      } else {
        # Bar plot for qualitative variables
        ggplot(data, aes(x = factor(.data[[input$dynamicselect]]))) +
          geom_bar(fill = input$color, color = "black") +
          labs(title = paste("Diagramme en barres de", input$dynamicselect), x = input$dynamicselect, y = "Nombre") +
          theme_minimal()
      }
    }
  }, res = 96)
}
