library(tidyverse)
library(lubridate)

readr::guess_encoding("서울시우체국정보.csv")
postOffice <- tibble::tibble(read.csv("서울시우체국정보.csv", fileEncoding = "euc-kr"))
dplyr::glimpse(postOffice)
postOffice

usethis::use_data(postOffice, overwrite = TRUE)
