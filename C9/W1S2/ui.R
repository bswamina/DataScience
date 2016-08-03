library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel('Simple App 2'),
    sidebarPanel(
      h1('H1 Level'),
      h2('H2 Level'),
      h3('H3 Level')
    ),
    mainPanel(
      h3('Main Panel'),
      p('Some paragraph text ...'),
      code('Some code text - function(x,y) {}')
    )
  )
)