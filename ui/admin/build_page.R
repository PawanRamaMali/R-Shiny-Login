##  Tab Build New Test Case ----

tabPanel("Build",
         value = "Build",
         fluidPage
         (fluidRow(
           h3("Build you Hashed and Salted Password"),
           
           column(
             2,
             selectInput(
               inputId = "select_hash",
               label = "Select Hash Function",
               choices = c(
                 "md5",
                 "sha1",
                 "crc32",
                 "sha256",
                 "sha512",
                 "xxhash32",
                 "xxhash64",
                 "murmur32",
                 "spookyhash",
                 "blake3"
               ),
               selected = "sha512",
               multiple = FALSE
             ),
           ),
           
           column(
             2,
             textInput(
               inputId = "text_to_hash",
               value = "",
               label = "Enter Password to hash : "
             ),
             
             actionButton(
               inputId = "start_hash",
               label = "Submit",
               icon = NULL,
               width = "100%",
               class = "btn-success"
             )
           ),
           column(3,
                  fluidRow(
                    verbatimTextOutput(outputId = "hashed_output",
                                       placeholder = FALSE)
                  ))
           
         )))