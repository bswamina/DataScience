library(shiny)

shinyServer(
  function(input, output) {
    output$on1 <- renderPrint({input$n1})
    output$od1 <- renderPrint({input$d1})
  }
)