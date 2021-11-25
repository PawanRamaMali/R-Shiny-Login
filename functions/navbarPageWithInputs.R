# Function to customize Navigation bar

navbarPageWithInputs <- function(..., inputs) {
  navbar <- navbarPage(...)
  form <- tags$form(class = "navbar-form", inputs)
  navbar[[3]][[1]]$children[[1]] <- htmltools::tagAppendChild(
    navbar[[3]][[1]]$children[[1]], form)
  navbar
}


allThemes <- function ()
{
  themes <-
    dir(system.file("shinythemes/css", package = "shinythemes"),
        "*.min.css")
  sub(".min.css", "", themes)
}
