library(tidyverse)
library(lubridate)

file <- "전국버스정류장 위치정보.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

busStation <- df

usethis::use_data(busStation, overwrite = TRUE)
