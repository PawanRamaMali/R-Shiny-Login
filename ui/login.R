# Login Page ----
login_page <- function() {
  fluidPage(includeCSS("style.css"),
            tagList(
              div(
                id = "container",
                align = "center",
                div(
                  id = "login",
                  # * Login Panel ----
                  wellPanel(
                    id = "well",
                    HTML( paste0('<h2> Hello, ',
                        good_time(),
                        '</h2>',
                        '<h3> <br> Login</br></h3>'
                      )
                    ),
                    br(),
                    br(),
                    tags$div(textInput("userName",
                                       "Username",
                                       width = "100%"),
                             align = "left"),
                    br(),
                    tags$div(passwordInput("passwd",
                                           "Password",
                                           width = "100%"),
                             align = "left"),
                    br(),
                    # * Login button ---- 
                    tags$div(actionButton("Login",
                                          "Log in"), 
                             align = "center"),
                    # * Login error ----
                    div(uiOutput("message"),
                             align = "center")
                  )  
                )
              )
            ))
}