library(tidyverse)
library(lubridate)

file <- "childAbuse_20181231.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

childAbuse <- df %>%
  pivot_longer(cols = 3:46, names_to = "신고자", values_to = "신고건수")

usethis::use_data(childAbuse, overwrite = TRUE)
