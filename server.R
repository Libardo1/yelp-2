library(shiny)
library(ggplot2)
 
yelp_ads<-read.csv('~/yelp_ads_new.csv')

shinyServer(function(input, output) {
 
  dataset <- reactive(function() {
    yelp_ads[sample(nrow(yelp_ads), input$sampleSize),]
  })
 
  formulaText<-reactive({
    paste(input$x, " vs ", input$y)
    })
  output$caption<-renderText({
    formulaText()
    })

  output$plot <- reactivePlot(function() {
    if (input$plot.type == 'point')
      p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
    
    else if (input$plot.type == 'boxplot')
      p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_boxplot()

    else if (input$plot.type == 'hist')
      p <- ggplot(dataset(), aes_string(x=input$x)) + geom_histogram()
    
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)
    
    
    if (input$jitter)
      p <- p + geom_jitter()
    if (input$smooth)
      p <- p + geom_smooth()

    
    print(p)
    
    
  }, height=700)
  
})