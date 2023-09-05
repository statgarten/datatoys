library(tidyverse)
library(lubridate)

file <- "carInspection_20210927.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

carInspection <- df

usethis::use_data(carInspection, overwrite = TRUE)
