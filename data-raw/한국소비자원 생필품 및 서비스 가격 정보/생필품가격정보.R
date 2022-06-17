library(tidyverse)
library(lubridate)

file <- "생필품가격정보.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

necessariesPrice <- df

usethis::use_data(necessariesPrice, overwrite = TRUE)
