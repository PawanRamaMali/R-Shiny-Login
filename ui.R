ui <- 
  fluidPage(title = "Login Page",
          
            shinyjs::useShinyjs(),
            fluidRow(
              tags$div(class = "logout-action-button",
                       logoutUI("logout"))),
            includeScript("functions/returnClick.js"),
            loginUI("login", title = "Login",),
            uiOutput("home_page")
  )