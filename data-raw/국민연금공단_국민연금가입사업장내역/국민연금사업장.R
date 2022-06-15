library(tidyverse)
library(lubridate)

readr::guess_encoding("국민연금사업장_20220430.csv")
nationalPension <- tibble::tibble(read.csv("국민연금사업장_20220430.csv", fileEncoding = "euc-kr"))
dplyr::glimpse(nationalPension)

nationalPension

usethis::use_data(nationalPension, overwrite = TRUE)
