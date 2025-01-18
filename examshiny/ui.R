#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#if you do not have theses packages below, please install it : click on packages, install

library(shiny)        # to run the app
library(ggplot2)      # to make graph
library(apexcharter)  # to make good graph
library(DT)           # to print data
library(dplyr)        # to manupulate dataset
library(datasets)     # to get the dataset mtcars
library(markdown)     # markdown


# Define UI for application that draws a histogram
fluidPage(
  # here is the DOM of our app
  # a header, a body et a footer
  # a header is in titlePanel
  titlePanel(
    div(
      style = "display: flex; align-items: center;",
      h1("Analyse des données : mtcars et cars"),
      img(src = "Logo-Normal-SD.png", height = "100px", style = "margin-left: 15px;")
    )
  ),
  # we wanna have several pages so we gonna use navbarPage
  # in theses pages, we're gonna present statistics : from descriptive analysis till regression
  navbarPage("Pages",
             tabPanel("dataset",
                      sidebarLayout(
                        sidebarPanel(
                          radioButtons("dataset", "Choose a dataset",
                                       c("Mtcars"="mtcars", "Cars"="cars")
                          )
                        ),
                        mainPanel(
                          plotOutput("plot")
                        )
                      )
             ),
             tabPanel("Summary",
                      verbatimTextOutput("summary")
             ),
             navbarMenu("More",
                        tabPanel("Table",
                                 DT::dataTableOutput("table")
                        ),
                        tabPanel("About",
                                 fluidRow(
                                   column(6,
                                          includeMarkdown("about.md")
                                   ),
                                   column(3,
                                          img(class="img-polaroid",
                                              src=paste0("http://upload.wikimedia.org/",
                                                         "wikipedia/commons/9/92/",
                                                         "1919_Ford_Model_T_Highboy_Coupe.jpg")),
                                          tags$small(
                                            "Source: Photographed at the Bay State Antique ",
                                            "Automobile Club's July 10, 2005 show at the ",
                                            "Endicott Estate in Dedham, MA by ",
                                            a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
                                              "User:Sfoskett")
                                          )
                                   )
                                 )
                        )
             )
  )
  

)