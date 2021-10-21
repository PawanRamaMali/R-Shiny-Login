# body.R

body <- dashboardBody(tabItems( 
  # # Dashboard Tab ----
  
 
  
  
  # Settings Tab ----
  # 
  tabItem(tabName = "tab_app_settings",
          fluidPage(
            title = "Settings",
            
            mainPanel(
              h1("Custom Settings"),
              hr(),
              checkboxInput("show_rownames",
                            label = "Show row numbers"),
              checkboxInput("show_features_responsive",
                            label = "Responsive Layout")
              
            )
            
            
            
          )),
  
  
  # About Me Tab ----
  
  
  tabItem(tabName = "tab_about_me",
          fluidPage(sidebarPanel(
            width = 3,
            h2("About Me"),
            
            hr(),
            h5(" I am Pawan Rama Mali"),
            h6(" I'm currently working on Software Development"),
            h6(" Also, I'm currently learning Artificial Intelligence"),
            h5(
              tags$a(href = "https://www.github.com/PawanRamaMali", "GitHub Link")
            ),
            h5(
              tags$a(href = "https://pawanramamali.github.io/", "Website Link")
            )
          ))),
  
  # Logout Tab ---- 
  # 
  tabItem(tabName = "tab_logout",
          fluidPage(sidebarPanel(
            width = 3,
            h2("Logout"),
            
            hr(),
            h5(" Make sure you have saved your changes before logout. "),
            h5(" Have a great day !"),
            br(),
            br(),
            tags$div(
              tags$a(
                href = "javascript:history.go(0)",
                bsButton(
                  "logoutadmin",
                  label = "Logout",
                  icon =   icon("repeat", lib = "glyphicon"),
                  block = F,
                  style = "success"
                ),
                style = "text-align:center"
              ),
              align = "center"
            ),
            br()
            
          )))
  
  
  
))