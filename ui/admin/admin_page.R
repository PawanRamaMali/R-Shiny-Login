library(shinydashboard)

Build <-
  source('./ui/admin/build_page.R', local = TRUE)

About <-
  source('./ui/admin/about_page.R', local = TRUE)

LogoutButton <- source('./functions/logout.R', local = TRUE)$value


fluidPage(
  theme = shinythemes::shinytheme("sandstone"),
  useShinyjs(),
  
  includeCSS("style.css"),
  
  tags$head(tags$style(
    HTML(".navbar .navbar-header {float: left;margin-right: 20px}")
  )),
  tags$head(tags$style(
    HTML('.content-wrapper,
          .right-side {background-color: white;}')
  )),
  
  
  
  div(
    id = "main_content",
    navbarPageWithInputs(
      windowTitle = "App",
      title = div(
        a(
          "App",
          href = "#",
          target = "_blank",
          style = "color:white;text-decoration:none;padding-left:20px;"
        ),
        
        
        tags$div(
          style = "margin-left:25px;margin-top: 8px; display:inline-block;",
          HTML(
            "<a href='#' class='sidebar-toggle' style='color:#fff;', data-toggle='offcanvas' role='button'><em class='fa fa-bars'></em><span class='sr-only'>Toggle navigation</span></a>"
          )
        )
      ),
      id = "Front",
      
      
      # Build Page ----
      Build$value,
      
      
      
      # About Page ----
      About$value
      
      ,
      inputs = LogoutButton
    )
  )
  
)
