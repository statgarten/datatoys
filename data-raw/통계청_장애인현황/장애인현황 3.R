library(tidyverse)

getwd()
setwd("../통계청_장애인현황//")

pwd <- readxl::read_excel("장애인현황.xlsx")

pwd <- pwd %>%
  mutate(
    시점 = as.integer(시점),
    `청각` = as.double(`청각`),
    `언어` = as.double(`언어`),
    `호흡기` = as.double(`호흡기`),
    `간` = as.double(`간`),
    `안면` = as.double(`안면`),
    `장루ㆍ요루` = as.double(`장루ㆍ요루`),
    `뇌전증` = as.double(`뇌전증`)
  ) %>%
  pivot_longer(cols = 3:17, values_to = "인구수", names_to = "장애분류")

dplyr::glimpse(pwd)

usethis::use_data(pwd, overwrite = TRUE)
