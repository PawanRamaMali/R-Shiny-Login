
logoutUI <- function(id, label = "Log out", icon = NULL, class = "btn-danger", style = "color: white;") {
  ns <- shiny::NS(id)
  
  shinyjs::hidden(
    shiny::actionButton(ns("button"), label, icon = icon, class = class, style = style)
  )
}


logout <- function(input, output, session, active) {
  
  shiny::observeEvent(active(), ignoreInit = TRUE, {
    shinyjs::toggle(id = "button", anim = TRUE, time = 1, animType = "fade")
  })
  
  # return reactive logout button tracker
  shiny::reactive({input$button})
}


loginUI <- function(id, title = "Please log in", user_title = "User Name", pass_title = "Password",
                    login_title = "Log in", error_message = "Invalid username or password!") {
  ns <- shiny::NS(id)
  
  shiny::div(id = ns("panel"), style = "width: 500px; max-width: 100%; margin: 0 auto; padding: 20px;",
             shiny::wellPanel(
               shiny::tags$h2(title, class = "text-center", style = "padding-top: 0;"),
               
               shiny::textInput(ns("user_name"), shiny::tagList(shiny::icon("user"), user_title)),
               
               shiny::passwordInput(ns("password"), shiny::tagList(shiny::icon("unlock-alt"), pass_title)),
               
               shiny::div(
                 style = "text-align: center;",
                 shiny::actionButton(ns("button"), login_title, class = "btn-primary", style = "color: white;")
               ),
               
               shinyjs::hidden(
                 shiny::div(id = ns("error"),
                            shiny::tags$p(error_message,
                                          style = "color: red; font-weight: bold; padding-top: 5px;", class = "text-center"))
               )
             )
  )
}


login <- function(input, output, session, data, user_col, pwd_col, sodium_hashed = FALSE, hashed, algo, log_out = NULL) {
  
  if (!missing(hashed)) {
    stop("in shinyauthr::login module call. Argument hashed is deprecated. shinyauthr now uses the sodium package for password hashing and decryption. If you had previously hashed your passwords with the digest package to use with shinyauthr, please re-hash them with sodium and use the sodium_hashed argument instead for decryption to work. Sorry for this breaking change but sodium hashing provides added protection against brute-force attacks on stored passwords.", 
         call. = FALSE)
  }
  
  credentials <- shiny::reactiveValues(user_auth = FALSE, info = NULL)
  
  shiny::observeEvent(log_out(), {
    credentials$user_auth <- FALSE
    credentials$info <- NULL
    shiny::updateTextInput(session, "password", value = "")
  })
  
  shiny::observeEvent(credentials$user_auth, ignoreInit = TRUE, {
    shinyjs::toggle(id = "panel")
  })
  
  users <- dplyr::enquo(user_col)
  pwds <- dplyr::enquo(pwd_col)
  
  # ensure all text columns are character class
  data <- dplyr::mutate_if(data, is.factor, as.character)
  # if password column hasn't been hashed with sodium, do it for them
  if (!sodium_hashed) data <- dplyr::mutate(data,  !!pwds := sapply(!!pwds, sodium::password_store))
  
  shiny::observeEvent(input$button, {
    
    # check for match of input username to username column in data
    row_username <- which(dplyr::pull(data, !!users) == input$user_name)
    
    if (length(row_username)) {
      row_password <- dplyr::filter(data,dplyr::row_number() == row_username)
      row_password <- dplyr::pull(row_password, !!pwds)
      password_match <- sodium::password_verify(row_password, input$password)
    } else {
      password_match <- FALSE
    }
    
    # if (hashed) {
    #   # check for match of hashed input password to hashed password column in data
    #   row_password <- which(dplyr::pull(data, !! pwds) == digest::digest(input$password, algo = algo))
    #   
    # } else {
    #   # if passwords are not hashed, hash them with md5 and do the same with the input password
    #   data <- dplyr::mutate(data,  !! pwds := sapply(!! pwds, digest::digest))
    #   row_password <- which(dplyr::pull(data, !! pwds) == digest::digest(input$password))
    # }
    
    # if user name row and password name row are same, credentials are valid
    if (length(row_username) == 1 && password_match) {
      credentials$user_auth <- TRUE
      credentials$info <- dplyr::filter(data, !!users == input$user_name)
    } else { # if not valid temporarily show error message to user
      shinyjs::toggle(id = "error", anim = TRUE, time = 1, animType = "fade")
      shinyjs::delay(5000, shinyjs::toggle(id = "error", anim = TRUE, time = 1, animType = "fade"))
    }
    
  })
  
  # return reactive list containing auth boolean and user information
  shiny::reactive({
    shiny::reactiveValuesToList(credentials)
  })
  
}

