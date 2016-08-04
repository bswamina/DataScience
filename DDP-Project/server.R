library(shiny)
library(dplyr)
library(ggplot2)

dataInit <- function() {
  data(mtcars)
  mtcars$cars <- rownames(mtcars)
  mtcars <- mtcars[, c('cars', 'am', 'mpg', 'cyl', 'hp', 'wt')]
  return (mtcars)
}

mtcars <- dataInit()
mpg_choices <- sort(round(unique(mtcars$mpg)))

shinyServer(
  function(input, output) {
    output$mpg <- renderUI({
      selectInput('mpg',
                  label = strong(h4('Miles Per Gallon:', style = 'color:blue')),
                  selected = round(min(mtcars$mpg)),
                  choices = mpg_choices)
    })
    
    ### To debug using cat
    # observe({
    #   cat('Transmission:', input$trans, '\n')
    #   cat('Cylinders:', input$cyl, '\n')
    #   cat('Mileage:', input$mpg, '\n')
    #   cat('Horsepower:', input$hp, '\n')
    # })

    output$summary <- renderPrint({
      data <- mtcars
      if (! is.null(input$trans)) {
        data <- filter(mtcars, am %in% as.integer(input$trans))
      }
      summary(data)
    })
    
    output$plot1 <- renderPlot({
      ggplot(mtcars, aes(x = mpg, y = cyl, color = factor(cyl))) +
        geom_point() +
        geom_hline(yintercept = input$cyl, color = 'red') +
        theme(panel.grid.major = element_blank(),
              panel.grid.minor = element_blank()) +
        ggtitle('MPG vs CYL')
    })
    
    output$plot2 <- renderPlot({
      ggplot(mtcars, aes(x = mpg, y = hp, color = factor(cyl))) +
        geom_point() +
        geom_hline(yintercept = input$hp, color = 'red') +
        theme(panel.grid.major = element_blank(),
              panel.grid.minor = element_blank()) +
        ggtitle('MPG vs HP')
    })
    
    output$table <- renderTable({
      data <- mtcars %>%
        select(cars, mpg) %>%
        arrange(mpg)
      data <- data[data$mpg <= input$mpg,]
      rownames(data) <- NULL
      if (nrow(data) == 0) {
        data <- data.frame('cars' = 'None', 'mpg' = NA)
      }
      data
    })
  }
)