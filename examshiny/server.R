  
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
      isolate(summary(mtcars))
    })
    
    
    # Graphique de régression (mpg en fonction de am)
    output$regression_plot <- renderPlot({
      input$plot_regression  # Actualiser lors du clic sur le bouton
      isolate({
        ggplot(mtcars, aes(x = factor(mtcars$am), y = mtcars$mpg)) +
          geom_point(aes(color = factor(mtcars$am)), size = 3) +
          geom_smooth(method = "lm", se = FALSE, col = "blue") +
          labs(
            title = "Régression : mpg en fonction de la transmission",
            x = "Transmission (0 = Automatique, 1 = Manuelle)",
            y = "Consommation (mpg)"
          ) +
          theme_minimal()
      })
    })
    
    # Test d'hypothèse : Comparaison des moyennes de mpg en fonction de am
    output$test_output <- renderPrint({
      test_result <- t.test(mpg ~ am, data = mtcars)
      test_result
    })
    
    # Tableau interactif basé sur les colonnes sélectionnées
    output$data_table <- renderDT({
      datatable(selected_data(), options = list(pageLength = 10))
    })
  }
  
    
  
  
  
  
  
  
  
  
