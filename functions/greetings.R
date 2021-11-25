###################
# functions.R

require(lubridate)


## SIMPLE GREETING
good_time <- function() {
  ## LOAD PACKAGE
  require(lubridate, quietly = T)
  
  ## ISOLATE currHour
  currhour = hour(now())
  
  ## RUN LOGIC
  if (currhour < 12) {
    return(gm)
  }
  else if (currhour >= 12 & currhour < 17) {
    return(ga)
  }
  else if (currhour >= 17) {
    return(ge)
  }
}


process_data <- function(data) {
  if (is.null(data)) {
    return(NULL)
  }
  
  print("Processing data. . . ")
  
  
  
  data$Gender_1 <- ifelse(data$gender == "Male", 1, 0)
  
  data$partner_1 <- ifelse(data$Partner == "Yes", 1, 0)
  
  data$Dependents_1 <- ifelse (data$Dependents == "Yes", 1, 0)
  
  data$PhoneService_1 <- ifelse(data$PhoneService == "Yes", 1, 0)
  
  data$MultipleLines_1 <-
    
    revalue(data$MultipleLines,
            c(
              "Yes" = 1,
              "No" = 0,
              "No phone service" = 2
            ))
  data$InternetService_1 <- revalue(data$InternetService, c(
    "DSL" = 1,
    "Fiber optic" = 2,
    "No" = 0
  ))
  data$OnlineSecurity_1 <-
    revalue(data$OnlineSecurity,
            c(
              "Yes" = 1,
              "No" = 0,
              "No internet service" = 2
            ))
  data$OnlineBackup_1 <-
    revalue(data$OnlineBackup,
            c(
              "Yes" = 1,
              "No" = 0,
              "No internet service" = 2
            ))
  data$DeviceProtection_1 <-
    revalue(data$DeviceProtection,
            c(
              "Yes" = 1,
              "No" = 0,
              "No internet service" = 2
            ))
  data$TechSupport_1 <-
    revalue(data$TechSupport,
            c(
              "Yes" = 1,
              "No" = 0,
              "No internet service" = 2
            ))
  data$StreamingTV_1 <-
    revalue(data$StreamingTV,
            c(
              "Yes" = 1,
              "No" = 0,
              "No internet service" = 2
            ))
  data$StreamingMovies_1 <-
    revalue(data$StreamingMovies,
            c(
              "Yes" = 1,
              "No" = 0,
              "No internet service" = 2
            ))
  data$PaperlessBilling_1 <-
    revalue(data$PaperlessBilling, c("Yes" = 1, "No" = 0))
  data$Churn_1 <- revalue(data$Churn, c("Yes" = 1, "No" = 0))
  final_data <-
    data[-c(1, 2, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 21)]
  
  set.seed(1000000)
  pred <- data.frame(predict(rf,
                             data = final_data ,
                             type = "prob"))
  Prediction <- ifelse(pred[, 2] < 0.26, "Not_Churn", "Churn")
  probability <- round(pred[, 2], 3)
  final_tab <- data.frame(data[1], Prediction)
  return(final_tab)
}




gm = tags$h3(strong("Good Morning", style = "color:#446e9b"))
ga = tags$h3(strong("Good Afternoon", style = "color:#446e9b"))
ge = tags$h3(strong("Good Evening", style = "color:#446e9b"))
