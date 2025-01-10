#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
fluidPage(
  titlePanel("Visualisation des jeux de données de ggplot2"), 
  sidebarLayout(
    sidebarPanel( 
      selectInput("dataset", "Dataset", choices = c("economics", "faithfuld", "seals")),
      
      ),
    
    mainPanel(
      verbatimTextOutput("summary"),
      plotOutput("le_graphe")
    )
  )

)