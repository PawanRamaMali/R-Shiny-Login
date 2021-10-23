
## Temporary Credentials ----
cred <- read.csv("data/credentials/cred.csv")
users <- as.data.frame(cred)

## Login Set Value ----
USER <- reactiveValues(Logged = Logged)


## Validate Login ----
observeEvent(input$Login, {
  
  #* Login Error Message ----
  output$message <- renderUI({
    
    if (as.character(input$userName) == "" || as.character(input$passwd) == ""){
      HTML(
        "<div id='error-box'>
                Username or password cannot be blank !! 
                 </div>"
      )
    }
    
    else if (!is.null(input$Login)) {
      my_username <-
        length(users$User[grep(pattern = input$userName, x = users$User)])
      my_password <-
        length(users$User[grep(pattern = input$passwd, x = users$Password)])
      if (input$Login > 0) {
        if (my_username < 1 ||  my_password < 1) {
          HTML(
            "<div id='error-box'>
                 Incorrect Username or Password. Please,
                 try again. If you continue to have problems,
                 <a href='https://github.com/pawanramamali'>
                 <u>Contact Us..</u></a>
                 </div>"
          )
        }
      }
    }
    
  })
  
  # * Verify Input ----
  if (USER$Logged == FALSE) {
    if (!is.null(input$Login)) {
      if (input$Login > 0) {
        Username <- isolate(input$userName)
        Password <- isolate(input$passwd)
        Id.username <- which(users$User == Username)
        Id.password <- which(users$Password == Password)
        if (length(Id.username) > 0 & length(Id.password) > 0) {
          if (Id.username %in% Id.password) {
            USER$Logged <- TRUE
          }
        }
      }
    }
  }
})

## Display UI ----
observe({
  # * Logged Status False ----
  if (USER$Logged == FALSE) {
    output$page <- renderUI({
      div(class = "outer",
          do.call(bootstrapPage,
                  c("", login_page())))
    })
  }
  
  # * Logged Status True  ----
  if (USER$Logged == TRUE)
  {
    ## Current user's authorization level check
    uid <- which(users$User ==input$userName)
    user_dept <- users$Dep[uid]
    if (user_dept == "agent") {
      output$page <- renderUI({
        # User Page ----
        source('ui/admin/admin_page.R', local = TRUE)$value
      })
    }
    
    
    else if (user_dept == "admin") {
      output$page <- renderUI({
        # Admin Page ----
        source('ui/admin/admin_page.R', local = TRUE)$value
      })
    }
    
    # if user not assigned dept
    else{
      output$page <- renderUI({
        div(class = "outer",
            do.call(bootstrapPage,
                    c("", login_page())))
      })
    }
  }
})
