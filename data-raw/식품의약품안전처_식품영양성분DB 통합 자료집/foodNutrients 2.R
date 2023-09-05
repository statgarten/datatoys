library(tidyverse)
library(lubridate)

file <- "통합 식품영양성분DB_농축산물_20220718.xlsx"
readr::guess_encoding(file)

df <- tibble::tibble(readxl::read_excel(file))
# df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

df <- janitor::clean_names(df, ascii = FALSE)

dplyr::glimpse(df)

foodNutrients <- df

usethis::use_data(foodNutrients, overwrite = TRUE)
