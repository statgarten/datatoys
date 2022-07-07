library(tidyverse)
library(lubridate)

file <- "국토교통부_전국 법정동.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

legalDong <- df

usethis::use_data(legalDong, overwrite = TRUE)
