library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel('Header'),
    sidebarPanel(
      h3('Sidebar')
    ),
    mainPanel(
      h3('Main')
    )
  )
)