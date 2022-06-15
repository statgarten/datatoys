library(tidyverse)
library(lubridate)

readr::guess_encoding("맛집현황.txt")
restaurant <- tibble::tibble(readxl::read_excel("맛집현황.xls"))
dplyr::glimpse(restaurant)

restaurant

usethis::use_data(restaurant, overwrite = TRUE)
