## code to prepare `DATASET` dataset goes here


library(readr)

InauguralSpeeches <- read_csv("data-raw/InauguralSpeeches.csv")


usethis::use_data(InauguralSpeeches, overwrite = TRUE)

NULL
