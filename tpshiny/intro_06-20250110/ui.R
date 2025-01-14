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
  titlePanel(
    div(
      style = "display: flex; align-items: center;",
      h1("Visualisation des jeux de données de ggplot2"),
      img(src = "Logo-Normal-SD.png", height = "100px", style = "margin-left: 15px;")
    )
  ),
  sidebarLayout(
    sidebarPanel( 
      selectInput("dataset", "Dataset", choices = c("economics", "faithfuld", "seals")),
      uiOutput("dynamicinput"),
      sliderInput(inputId="bins", label = "Nombre de classes", min=2, max=30, value=10),
      radioButtons("color", "Couleur de l'histogramme", 
                   choices = c("Bleu" = "blue", 
                               "Vert" = "green", 
                               "Rouge" = "red"), 
                   selected = "blue")
      
      ),
    
    
    
    mainPanel(
      
      verbatimTextOutput("summary"),
      plotOutput("le_graphe")
    )
  )

)