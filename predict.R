install.packages(c("tidyverse", "caret", "xgboost"))

library(tidyverse)
library(caret)
library(xgboost)
source("code/utilities.R")

model <- readRDS('data/model.rds')
data <- read_csv('data/sample_input.csv') %>%
  convert_feature_names_to_id()

prediction <- predict(model, newdata = data, type = 'prob')

export_prediction(prediction, data)
