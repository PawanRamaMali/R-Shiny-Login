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

## Setting Upload Size 
options(shiny.maxRequestSize=30*1024^2)
options(shiny.error = traceback)




# * Load functions ----
source('functions/greetings.R', local = TRUE)
source('functions/navbarPageWithInputs.R', local = TRUE)
# * Load Login UI ----

source('ui/login.R', local = TRUE)$value


Logged = FALSE

# LOAD DATASETS ----

