###################
# sidebar.R
sidebar <- dashboardSidebar(
  sidebarMenu(
    

    menuItem("App Settings", 
             tabName = "tab_app_settings",
             icon = icon("cog")),
    menuItem("About Me", 
             tabName = "tab_about_me",
             icon = icon("user")),
    menuItem("Logout", 
             tabName = "tab_logout",
             icon = icon("sign-out"))
    
  )
)
