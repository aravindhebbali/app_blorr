library(shiny)
library(shinyBS)
library(shinythemes)
library(descriptr)
library(dplyr)

shinyUI(
  
navbarPage(HTML("blorr"), id = 'mainpage',
             
  source('ui/ui_data.R', local = TRUE)[[1]],
  source('ui/ui_analyze.R', local = TRUE)[[1]]
             
))
