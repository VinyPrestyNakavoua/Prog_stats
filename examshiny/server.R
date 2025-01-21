  
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
      mtcars[mtcars$hp >= as.numeric(input$hp_min) & mtcars$hp <= as.numeric(input$hp_max), ]
    })
    
    # ouput pour le hist_mpg
    output$hist_mpg <- renderPlot({
      data <- filtered_data()
      hist(data$mpg, main="Histogramme de MPG", xlab="Miles Per Gallon", col="blue")
      
    })
    
    
    # Output pour le graphique
    output$mpg_plot <- renderPlot({
      data <- filtered_data()
      plot(
        data$hp, data$mpg, 
        main = "Consommation (mpg) en fonction de la puissance (hp)",
        xlab = "Puissance (hp)",
        ylab = "Consommation (mpg)",
        pch = 19, col = "blue"
      )
    })
  
    
    
    
      
    # Résumé statistique
    output$summary_output <- renderPrint({
      summary(filtered_data())
    })
    
    
    # Graphique de régression (mpg en fonction de hp)
    output$regression_plot <- renderPlot({
      ggplot(filtered_data(), aes(x = hp, y = mpg)) +
        geom_point(color = "blue") +
        geom_smooth(method = "lm", color = "red") +
        labs(
          title = "Consommation (mpg) en fonction de la puissance (hp)",
          x = "Puissance (hp)",
          y = "Consommation (mpg)"
        ) +
        theme_minimal()
    })
    
    # Test d'hypothèse : Comparaison des moyennes de mpg en fonction de hp
    output$test_output <- renderPrint({
      test_result <- cor.test(as.numeric(mtcars$mpg), as.numeric(mtcars$hp), data = mtcars, method = "kendall", alternative=input$alternative)
      test_result
      
    })

    
    # Tableau interactif basé sur les colonnes sélectionnées
    output$data_table <- renderDT({
      datatable(mtcars, options = list(pageLength = 10))
    })
  }
  



  
    
  
  
  
  
  
  
  
  
