server <- function(input, output, session) {
  
  # * Login Functionality ----
  source('./srv/login.R', local = TRUE)
  
  # * Hashing Functionality ----
  source('./srv/hash.R', local = TRUE)
  
  
}
