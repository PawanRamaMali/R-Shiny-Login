# * Load libraries ----
source('global.R')

# * Load functions ----
source('functions/greetings.R')

# * Load UI ----
source('ui.R')

# * Load Server ----
source('server.R')

# Run App ----
shinyApp(ui = ui, server = server)
