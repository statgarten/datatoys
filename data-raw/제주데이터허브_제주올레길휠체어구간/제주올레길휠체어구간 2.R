library(tidyverse)
library(lubridate)

olle_1 <- read.csv("제주특별자치도_제주올레길1코스(휠체어구간)종달리_무장애여행위치정보.csv", fileEncoding = "utf-8", header = T)
olle_10 <- read.csv("제주특별자치도_무장애여행정보_19-올레길10코스휠체어올레길_20201222.csv", fileEncoding = "utf-8", header = T)
olle_14 <- read.csv("제주특별자치도_제주올레길14코스(휠체어구간)금능리_무장애여행위치정보.csv", fileEncoding = "utf-8", header = T)

olle_10 <- olle_10 %>%
  select(1:5) %>%
  mutate(
    코스 = 10
  ) %>%
  rename(
    구분 = 장소명칭,
    설명 = 장소상세정보,
    상세정보 = 무장애관광정보
  ) %>%
  relocate(구분)

olle_1 <- olle_1 %>%
  select(c(2:5, 7)) %>%
  mutate(
    코스 = 1
  ) %>%
  relocate(구분)

olle_14 <- olle_14 %>%
  select(c(2:5, 7)) %>%
  mutate(
    코스 = 14
  ) %>%
  relocate(구분)

olleWheelchair <- rbind(olle_1, olle_10, olle_14)

usethis::use_data(olleWheelchair, overwrite = TRUE)
