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

