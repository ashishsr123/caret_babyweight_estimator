xgbtree <- readRDS(file.path(model_dir, model_name, "trained_model.rds"))

library(plumber)



#* @apiTitle Simple API

#* Echo provided text
#* @param text The text to be echoed in the response
#* @get /echo
function(text = "") {
  list(
    message_echo = paste("The text is:", text)
  )
}

#* @param
#* @get /hello
function(text = "") {
 return("hello World!")
}

#* @apiTitle predict API

#* @param
#* @get /estimate
estimate_babyweights <- function(instances_json){
  
  library("rjson")
  instances <- jsonlite::fromJSON(instances_json)
  df_instances <- data.frame(instances)
  # fix data types
  boolean_columns <- c("is_male", "mother_married", "cigarette_use", "alcohol_use")
  for(col in boolean_columns){
    df_instances[[col]] <- as.logical(df_instances[[col]])
  }
  
  estimates <- predict(xgbtree, df_instances)
  return(estimates) 
}

instances_json <- '
[
  {
  "is_male": "TRUE",
  "mother_age": 28,
  "mother_race": 8,
  "plurality": 1,
  "gestation_weeks":  28,
  "mother_married": "TRUE",
  "cigarette_use": "FALSE",
  "alcohol_use": "FALSE"
  },
  {
  "is_male": "FALSE",
  "mother_age": 38,
  "mother_race": 18,
  "plurality": 1,
  "gestation_weeks":  28,
  "mother_married": "TRUE",
  "cigarette_use": "TRUE",
  "alcohol_use": "TRUE"
  }
  ]
  '


  estimate <- round(estimate_babyweights(instances_json), digits = 2)
  print(paste("Estimated weight(s):", estimate))