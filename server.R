server <- function(input, output, session) {
  
  #* Login Functionality ----
  source('./server/login.R', local = TRUE)

  # * Hashing Functionality ----
  source('./server/hash.R', local = TRUE)
  
  
}
