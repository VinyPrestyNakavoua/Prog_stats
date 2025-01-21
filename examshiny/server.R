  
  library(shiny)        # pour run l'app
  library(ggplot2)      # faire un graph
  library(apexcharter)  # faire un graph mieux que celui de ggplot2 
  library(DT)           # print le dataset
  library(dplyr)        # pour manipuler le jeu de données
  library(datasets)     # la biblio contenant le dataset
  library(markdown)     # pour notre fichier about.md
  
  
  # Define server logic required to draw appropriate graphs
  function(input, output, session) {
    
    # Reactive pour filtrer les données selon le type de transmission
    filtered_data <- reactive({
      mtcars[mtcars$am == as.numeric(input$transmission), ]
    })
    
    
    
    
    # Output pour le graphique
    output$mpg_plot <- renderPlot({
      data <- filtered_data()
      barplot(
        data$mpg,
        names.arg = rownames(data),
        col = ifelse(input$transmission == 0, "skyblue", "orange"),
        main = paste("Consommation (mpg) pour les transmissions",
                     ifelse(input$transmission == 0, "Automatiques", "Manuelles")),
        ylab = "mpg",
        xlab = "Voitures"
      )
    })
  
    
    
    
      
    # Résumé statistique
    output$summary_output <- renderPrint({
      summary(mtcars)
    })
    
    
    # Graphique de régression (mpg en fonction de am)
    output$regression_plot <- renderPlot({
        ggplot(mtcars, aes(x = factor(am), y = mpg, fill = factor(am))) +
          geom_col() +
          labs(
            title = "Consommation moyenne (mpg) par type de transmission",
            x = "Transmission (0 = Automatique, 1 = Manuelle)",
            y = "Consommation moyenne (mpg)"
          ) +
          theme_minimal()
    })
    
    # Test d'hypothèse : Comparaison des moyennes de mpg en fonction de am
    output$test_output <- renderPrint({
      test_result <- t.test(mpg ~ am, data = mtcars, alternative=input$alternative)
      test_result
    })
    
    # Tableau interactif basé sur les colonnes sélectionnées
    output$data_table <- renderDT({
      datatable(mtcars, options = list(pageLength = 10))
    })
  }
  



  
    
  
  
  
  
  
  
  
  
