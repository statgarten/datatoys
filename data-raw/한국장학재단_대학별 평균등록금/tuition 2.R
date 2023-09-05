library(tidyverse)
library(lubridate)

file <- "한국장학재단_대학별 평균등록금_20220430.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

tuition <- df

usethis::use_data(tuition, overwrite = TRUE)
