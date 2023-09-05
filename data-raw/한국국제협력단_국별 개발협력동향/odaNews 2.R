library(tidyverse)
library(lubridate)

file <- "한국국제협력단_국별 개발협력동향_20220606.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
# df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

odaNews <- df

usethis::use_data(odaNews, overwrite = TRUE)
