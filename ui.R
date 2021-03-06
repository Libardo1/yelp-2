library(shiny)
library(ggplot2)

yelp_ads<-read.csv('~/yelp_ads_new.csv')
dataset <- yelp_ads
holder<-names(dataset)
shinyUI(pageWithSidebar(
 
  headerPanel("Yelp Plots!"),
  
  sidebarPanel(
 
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(1000, nrow(dataset)), step=50, round=0),
    
    selectInput('x', 'X', holder, selected='ctr'),
    selectInput('y', 'Y', holder, selected='impressions'),
    selectInput('color', 'Color', 
      list('CTR class'='ctr_class',
                'Cost per click'='cpc_class'),selected='ctr_class'),
    
    checkboxInput('jitter', 'Jitter'),
    checkboxInput('smooth', 'Smooth'),
    checkboxInput('fill', 'Fill (for hist/boxplot/density'),

    selectInput('plot.type','Plot Type:', c('Box'='boxplot','Scatter'='point','Histogram'='hist', 'Density'='dens'),
      selected='Scatter'),
    
    submitButton('Update Settings:')
    
  ),
 
  mainPanel(
    h3(textOutput('caption')),
    plotOutput('plot')
  )
))