
library(shiny)        # to run the app
library(ggplot2)      # to make graph
library(apexcharter)  # to make good graph
library(DT)           # to print data
library(dplyr)        # to manupulate dataset
library(datasets)     # to get the dataset mtcars
library(markdown)     # markdown


# Define server logic required to draw appropriate graphs
function(input, output, session) {
  
  ## getting the dataset
  dataset <- reactive({
    switch(input$dataset,
           "cars" = datasets::cars,
           "mtcars" = datasets::mtcars  
           )
  })
  
  output$plot <- renderPlot({
    plot(dataset())
  })
  
  output$summary <- renderPrint({
    summary(dataset())
  })
  
  output$table <- DT::renderDataTable({
    DT::datatable(dataset())
  })
  
  
  
  
  
}








