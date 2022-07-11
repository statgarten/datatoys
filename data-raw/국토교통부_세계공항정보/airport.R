library(tidyverse)
library(lubridate)

file <- "국토교통부_세계공항_정보_20211231.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

airport <- df

usethis::use_data(airport, overwrite = TRUE)
