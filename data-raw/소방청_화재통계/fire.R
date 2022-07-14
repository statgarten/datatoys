library(tidyverse)
library(lubridate)

file <- "화재통계(2015).csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

fire <- df

usethis::use_data(fire, overwrite = TRUE)
