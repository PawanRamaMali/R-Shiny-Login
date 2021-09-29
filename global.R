# global.R

rm(list = ls())
gc(verbose=TRUE)

# LIBRARIES ----

# Shiny
library(shiny)
library(bslib)

# Modeling

# Core

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

Logged = FALSE

# LOAD DATASETS ----

