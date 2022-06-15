library(tidyverse)
library(lubridate)

readr::guess_encoding("2021주택가격.csv")
housingPrice <- read.csv("2021주택가격.csv", fileEncoding = "euc-kr") %>% tibble()

glimpse(housingPrice)

usethis::use_data(housingPrice, overwrite = TRUE)