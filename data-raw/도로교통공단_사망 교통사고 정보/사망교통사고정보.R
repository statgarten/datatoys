library(tidyverse)
library(lubridate)

guess_encoding("도로교통공단_사망 교통사고 정보_20201231.csv")

accident <- read.csv("도로교통공단_사망 교통사고 정보_20201231.csv", fileEncoding = "euc-kr")

glimpse(accident)

accident$발생년월일시

accident <- accident %>%
  tibble() %>%
  mutate(
    발생년 = factor(발생년),
    발생년월일시 = paste0(발생년월일시, ":00"),
    발생년월일시 = lubridate::ymd_hm(발생년월일시, tz = "UTC")
  )

accident

usethis::use_data(accident, overwrite = TRUE)
