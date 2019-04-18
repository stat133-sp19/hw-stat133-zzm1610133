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
                         value = 20, min = 0, max = 50,step=1)),
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

server <- function(input, output) {
  output$Timelines<-renderPlot({
    no_contrib<-c()
    for(i in 0:input$year) no_contrib[i+1]<-input$amount*(1+input$return_rate/100)^i
    fixed_contrib<-c(input$amount)
    for(i in 1:input$year) fixed_contrib[i+1]<-fixed_contrib[i]*(1+input$return_rate/100)+input$contribution
    growing_contrib<-c(input$amount)
    for(i in 1:input$year) growing_contrib[i+1]<-growing_contrib[i]*(1+input$return_rate/100)+input$contribution*(1+input$growing_rate/100)^(i-1)
    table<-data.frame(year=rep(0:input$year,3),value=c(no_contrib,fixed_contrib,growing_contrib),model=as.factor(rep(c('no_contrib','fixed_contrib','growing_contrib'),each=input$year+1)),ncol=3)
    if(input$facet=='No'){  
      ggplot(table)+
        geom_point(aes(x=year,y=value,col=model))+
        geom_line(aes(x=year,y=value,col=model))+
        labs(title = 'Three models of investing')+
        scale_x_continuous(breaks=seq(0,input$year,2))
    }
    else{ 
      ggplot(table)+
        geom_point(aes(x=year,y=value,col=model))+
        geom_line(aes(x=year,y=value,col=model))+
        geom_area(aes(x=year,y=value,fill=model),alpha=0.5)+
        scale_x_continuous(breaks=seq(0,input$year,2))+
        labs(title = 'Three models of investing')+
        facet_grid(~model)
    }
  })
  
  output$Balances<-renderPrint({
    no_contrib<-c()
    for(i in 0:input$year) no_contrib[i+1]<-input$amount*(1+input$return_rate/100)^i
    fixed_contrib<-c(input$amount)
    for(i in 1:input$year) fixed_contrib[i+1]<-fixed_contrib[i]*(1+input$return_rate/100)+input$contribution
    growing_contrib<-c(input$amount)                          
    for(i in 1:input$year) growing_contrib[i+1]<-growing_contrib[i]*(1+input$return_rate/100)+input$contribution*(1+input$growing_rate/100)^(i-1)
    table<-data.frame(year=0:input$year,no_contrib=round(no_contrib,3),fixed_contrib=round(fixed_contrib,3),growing_contrib=round(growing_contrib,3))
    table
  })
}

shinyApp(ui = ui, server = server)
