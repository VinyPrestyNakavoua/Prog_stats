#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Mon application Shiny"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          h1("Mon titre"),
          h3("Mon sous titre"),
          em("Ici j'écris du texte")
        ),

        # Show a plot of the generated distribution
        mainPanel(
          h3("Ceci est la zone principale d'affichage"),
          code("print('La vie est belle!')"),
          textOutput("value")
        )
    )
)
