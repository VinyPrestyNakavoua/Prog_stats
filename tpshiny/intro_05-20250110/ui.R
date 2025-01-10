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
  selectInput("dataset", "Dataset", choices = c("economics", "faithfuld", "seals")),
  
  verbatimTextOutput("summary"),
  
  plotOutput("le_graphe")
)