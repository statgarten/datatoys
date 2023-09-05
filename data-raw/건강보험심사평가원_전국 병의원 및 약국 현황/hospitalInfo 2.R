library(tidyverse)
library(lubridate)

file <- "1. 병원정보서비스 2022.3.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

hospitalInfo <- df

usethis::use_data(hospitalInfo, overwrite = TRUE)




file <- "2. 약국정보서비스 2022.3.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

pharmacyInfo <- df

usethis::use_data(pharmacyInfo, overwrite = TRUE)
