library(tidyverse)
library(lubridate)

file <- "petNames.xlsx"
readr::guess_encoding(file)

df <- tibble::tibble(readxl::read_excel(file))
# df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

petNames <- df %>% select(-1)

usethis::use_data(petNames, overwrite = TRUE)
