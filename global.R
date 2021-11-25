# global.R

rm(list = ls())
gc(verbose=TRUE)

# LIBRARIES ----

# Shiny
library(shiny)
library(bslib)

#if (!require("DT")) install.packages('DT')


library(shinydashboard)
library(shinyAce)
library(shinyWidgets)


library(shinythemes)
library(shinyanimate)
library(shinyjs)
library(shinyBS)


library(dplyr)
library(glue)

## Setting Upload Size 
options(shiny.maxRequestSize=30*1024^2)
options(shiny.error = traceback)
Logged = FALSE



# * Load functions ----
source('functions/navbarPageWithInputs.R', local = TRUE)
source('functions/login_functions.R', local = TRUE)$value





