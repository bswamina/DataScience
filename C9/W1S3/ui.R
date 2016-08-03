library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel('Simple App 3'),
    sidebarPanel(
      h3('Sample Input'),
      numericInput('n1', 'Enter a positive number:', 1, min=1, max=10, step=1),
      dateInput('d1', 'Enter date:')
    ),
    mainPanel(
      h3('Main Panel'),
      p('You entered number:'),
      verbatimTextOutput('on1'),
      p('and date:'),
      verbatimTextOutput('od1')
    )
  )
)