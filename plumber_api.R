library(plumber)
print("inside plumber ")
r <- plumb("predict.R")
r$run(port=8080, host="0.0.0.0")
