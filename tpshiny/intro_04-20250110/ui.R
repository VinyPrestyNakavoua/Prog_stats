#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

  fluidPage(
      
      h1("Le Challenge du Curseur"),
      sliderInput("curseur", label = "Si x est ", min = 1, max = 100, value = 30 ), 
      sliderInput("multi", label = "Si y est ", min = 1, max = 100, value = 30 ), 
      "alors x multiplié par y est : ",
      textOutput("le_texte")
  )
    

