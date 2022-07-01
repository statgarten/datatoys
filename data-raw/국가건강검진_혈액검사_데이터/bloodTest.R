library(tidyverse)
library(lubridate)

file <- "국가건강검진_혈액검사데이터.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "ascii"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

bloodTest <- df

usethis::use_data(bloodTest, overwrite = TRUE)
