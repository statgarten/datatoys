library(tidyverse)

guess_encoding("한국국제협력단_ODA 실적보고 로데이터_20191231.csv")

odaKRraw <- read.csv("한국국제협력단_ODA 실적보고 로데이터_20191231.csv", fileEncoding = "euc-kr")

names(odaKRraw)
glimpse(odaKRraw)

odaKRraw <- odaKRraw %>%
  tibble()

usethis::use_data(odaKR, overwrite = TRUE)