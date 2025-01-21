#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#if you do not have theses packages below, please install it : click on packages, install

library(shiny)        # pour run l'app
library(ggplot2)      # faire un graph
library(apexcharter)  # faire un graph mieux que celui de ggplot2 
library(DT)           # print le dataset
library(dplyr)        # pour manipuler le jeu de données
library(datasets)     # la biblio contenant le dataset
library(markdown)     # pour notre fichier about.md


# Define UI for application that draws a histogram
# ici on ira directement sur un navbarPage au lieu de faire intervenir le fluidpage
navbarPage(

  title = NULL,
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),   ## on va utiliser un style css pour cette application,le fichier est dans le dossier www
  header = div(
    style = "display: flex; align-items: center; padding: 10px;",
    h1("Comparaison de la consommation moyenne (mpg) selon le type de transmission : données de mtcars", style = "margin-right: 20px;"),
    img(src = "Logo-Normal-SD.png", height = "100px", style = "margin-left: 15px;")
  ),
  # simple ainsi, on fait un navbarpage puis des tabpanel pour les onglets
  # dans lesquels on met tout ce qu'on a appris
  tabPanel("Statistiques descriptives",
           fluidPage(
             sidebarLayout(
               sidebarPanel(
                 h4("Choisir le type de transmission :"),
                 selectInput(
                   inputId = "transmission", 
                   label = "Transmission :",
                   choices = list("Automatique (am = 0)" = 0, 
                                  "Manuelle (am = 1)" = 1),
                   selected = 0
                 )
               ),
               mainPanel(
                 h3("Graphique : mpg par type de transmission"),
                 plotOutput(outputId = "mpg_plot"),
                 h3("Résumé statistique"),
                 verbatimTextOutput("summary_output")

               )
             )
           )),
  
  # Onglet Régression
  tabPanel("Régression",
           fluidPage(
             sidebarLayout(
               sidebarPanel(
                 h4("Paramètres pour la régression"),
                 selectInput("x_var", "Variable X", choices = names(mtcars), selected = "mpg"),
                 selectInput("y_var", "Variable Y", choices = names(mtcars), selected = "hp"),
                 actionButton("plot_regression", "Tracer la régression")
               ),
               mainPanel(
                 h3("Graphique de régression"),
                 plotOutput("regression_plot")
               )
             )
           )),
  
  # Onglet Test d'hypothèse
  tabPanel("Test d'hypothèse",
           fluidPage(
             sidebarLayout(
               sidebarPanel(
                 h4("Paramètres pour le test"),
                 selectInput("var1", "Variable 1", choices = names(mtcars), selected = "mpg"),
                 selectInput("var2", "Variable 2", choices = names(mtcars), selected = "hp"),
                 actionButton("run_test", "Effectuer le test")
               ),
               mainPanel(
                 h3("Résultats du test d'hypothèse"),
                 verbatimTextOutput("test_output")
               )
             )
           )),
  
  # Onglet Tableau des données
  tabPanel("Tableau des données",
           fluidPage(
             h3("Jeu de données mtcars"),
             DTOutput("data_table")
           )),
  tabPanel("About",
           fluidRow(
             column(6,
                    includeMarkdown("about.md")
                    ),
             column(3,
                    img(class="img-polaroid",
                        src=paste0("http://upload.wikimedia.org/",
                                   "wikipedia/commons/9/92/",
                                   "1919_Ford_Model_T_Highboy_Coupe.jpg"
                                   )
                        ),
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