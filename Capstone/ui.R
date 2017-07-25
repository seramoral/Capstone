#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(navbarPage("Coursera Data Science Capstone Final Project", 
  theme = shinytheme("flatly"),
  # Application title
  tabPanel("Next Word Prediction",
  
  sidebarPanel(
    h2("ENTER YOUR SENTENCE: "),
    helpText("Notes: ",hr(),"1. Only English words are allowed",hr(), "2. You enter a word",
             hr(),"3. After a few seconds the three predicted words are showed, in decreasing order
             of found frecuences", hr(), "4.  is understood that the predicted word is the one 
             that is more to the left",hr()),
    
    textInput("input_sentence", "YOUR TEXT:",value = "")
    
  ),
    # Show a plot of the generated distribution
    mainPanel(
       img(src = "coursera_logo.png", height = 200, width = 700),
       br(),
       h3("YOUR ENTERED SENTENCE: ", align = "center"),
       strong(span(textOutput("entered_sentence"), style="color:red"), align = "center"),
       br(),
       br(),
       h3("PREDICTED WORDS: ", align = "center"),
       strong(span(textOutput("predicted_words"), style = "color:blue"), align = "center")
    )
  ),
  
  tabPanel("Documentation",
     mainPanel(
        includeMarkdown("readme.md")
    )
  )
  
))
