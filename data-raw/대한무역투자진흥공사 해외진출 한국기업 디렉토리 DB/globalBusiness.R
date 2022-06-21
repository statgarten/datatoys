library(tidyverse)
library(lubridate)

file <- "해외진출한국기업DB.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
globalBusiness <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(globalBusiness)

globalBusiness

usethis::use_data(globalBusiness, overwrite = TRUE)
