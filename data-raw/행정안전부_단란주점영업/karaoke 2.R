library(tidyverse)
library(lubridate)

file <- "fulldata_07_23_01_P_단란주점영업.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

karaoke <- df

usethis::use_data(karaoke, overwrite = TRUE)
