#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
source("predict.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$entered_sentence <- renderText({
    text_input <- input$input_sentence
    
    return (text_input)
  });
  
  output$predicted_words <-  renderText({
    text_input <- input$input_sentence
    predictions <- predict_next_words(text_input)
    
    return (predictions)
  });
  
})
