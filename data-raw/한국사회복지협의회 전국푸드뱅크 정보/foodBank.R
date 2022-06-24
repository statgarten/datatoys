library(tidyverse)
library(lubridate)

file <- "2021기부자통계.xlsx"
readr::guess_encoding(file)

df <- tibble::tibble(readxl::read_excel(file))
# df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

foodBank <- df

usethis::use_data(foodBank, overwrite = TRUE)
