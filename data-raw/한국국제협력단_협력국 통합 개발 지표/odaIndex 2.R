library(tidyverse)
library(lubridate)

file <- "한국국제협력단_협력국 통합 개발 지표_20201231.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

odaIndex <- df

usethis::use_data(odaIndex, overwrite = TRUE)
