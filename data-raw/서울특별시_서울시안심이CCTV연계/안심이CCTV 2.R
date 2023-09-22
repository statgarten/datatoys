library(tidyverse)
library(lubridate)
seoulCCTV <- read.csv("서울시 안심이 CCTV 연계 현황.csv", fileEncoding = "utf-8", header = T)

seoulCCTV <- seoulCCTV %>%
  rename(
    수량 = CCTV.수량,
    주소 = 안심.주소
  ) %>%
  select(-수정.일시)

usethis::use_data(seoulCCTV, overwrite = TRUE)
