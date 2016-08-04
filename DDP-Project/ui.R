library(shiny)

shinyUI(
  navbarPage('Motor Trend Cars',
    ### Main tab
    tabPanel('Main',
      ### Side panel
      sidebarPanel(
        checkboxGroupInput('trans',
                           label = strong(h4('Transmission:', style = 'color:blue')), 
                           choices = list('Automatic' = 0, 'Manual' = 1),
                           selected = c(0, 1)),
        
        numericInput('cyl',
                     label = strong(h4('No. of Cylinders:', style = 'color:blue')),
                     value = 4,
                     min = 4,
                     max = 8,
                     step = 2),
        
        uiOutput('mpg'),
        
        sliderInput('hp',
                    label = strong(h4('Horsepower:', style = 'color:blue')),
                    min = 50,
                    max = 350,
                    value = 100,
                    step = 5)
      ), ### End of side panel
      
      ### Main panel
      mainPanel(
        strong(h3('Summary Statistics:', style = 'color:blue')),
        verbatimTextOutput('summary'),
        strong(h3('Plots:', style = 'color:blue')),
        fluidRow(
          splitLayout(
            cellWidths = c('50%', '50%'),
            plotOutput('plot1'),
            plotOutput('plot2')
          )
        ),
        strong(h3('Recommended Cars:', style = 'color:blue')),
        tableOutput('table')
      ) ### End of main panel
    ), ### End of main tab
    
    ### Help tab
    tabPanel('Help',
      mainPanel(
        includeMarkdown('help.md')
      )
    ) ### End of help tab
  )
)