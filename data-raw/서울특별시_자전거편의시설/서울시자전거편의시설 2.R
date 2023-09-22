library(tidyverse)
setwd("../서울특별시_자전거편의시설/")

df <- read.csv("./서울시 자전거 편의시설.csv", fileEncoding = "utf-8", header = T)

bike <- df %>%
  select(c(-1, -4, -5, -8, -9, -10, -12, -14, -15:-47)) %>%
  rename(
    `편의시설명` = `시설ID`,
    `편의시설분류` = `컨텐츠.명`,
    `경도` = `x.좌표`,
    `위도` = `y.좌표`,
    `주소` = `새.주소`,
  )

dplyr::glimpse(bike)

usethis::use_data(bike, overwrite = TRUE)
