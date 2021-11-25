

user_base <- data_frame(
  user = c("user1", "user2"),
  password = c("pass1", "pass2"),
  password_hash = sapply(c("pass1", "pass2"), sodium::password_store),
  permissions = c("admin", "standard"),
  name = c("User One", "User Two")
)


credentials <- callModule(
  login,
  "login",
  data = user_base,
  user_col = user,
  pwd_col = password_hash,
  sodium_hashed = TRUE,
  log_out = reactive(logout_init())
)

logout_init <-
  callModule(logout, "logout", reactive(credentials()$user_auth))



user_info <- reactive({
  credentials()$info
})



output$home_page <- renderUI({
  req(credentials()$user_auth)
  
  if (user_info()$permissions == 'admin') {
    # Admin Page ----
    source('ui/admin/admin_page.R', local = TRUE)$value
    
  }
  
  else
    
  {
    # User Page ----
    source('ui/user/user_page.R', local = TRUE)$value
    
  }
  
  
})
