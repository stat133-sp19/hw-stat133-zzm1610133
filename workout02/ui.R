library(shiny)
library(ggplot2)
ui <- fluidPage(
  
  #Title of the app
  titlePanel('Investment Helper'),
  
  # *Input() functions
  fluidRow(
    column(4,sliderInput(inputId = "amount",
                         label = "Initial Amount",
                         value = 1000, min = 0, max = 100000,pre='$',sep=',',step=500)),
    column(4,sliderInput(inputId = "return_rate",
                         label = "Return Rate (in %)",
                         value = 5, min = 0, max = 20,step=0.1)),
    column(4,sliderInput(inputId = "year",
                         label = "Years",
                         value = 10, min = 0, max = 50,step=1)),
    column(4,sliderInput(inputId = "contribution",
                         label = 'Annual Contribution',
                         value = 2000, min = 0, max = 50000,pre='$',sep=',',step=500)),
    column(4,sliderInput(inputId = "growing_rate",
                         label = 'Growth Rate (in %)',
                         value = 2, min = 0, max = 20,step=0.1)),
    column(4,selectInput( 'facet',"Facet?",
                          choices = c("Yes","No"),selected='No'))
  ),
  
  # *Output() functions
  
  mainPanel(
    titlePanel(h3('Timelines')),
    plotOutput('Timelines',width=1200,height=500),
    titlePanel(h3('Balances')),
    verbatimTextOutput('Balances')
  )
  
)

