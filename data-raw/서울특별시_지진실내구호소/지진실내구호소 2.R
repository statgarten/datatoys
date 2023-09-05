library(tidyverse)
setwd("../서울특별시_지진실내구호소/")

df <- read.csv('./서울시 지진실내구호소.csv', fileEncoding = 'utf-8', header = T)

earthquakeShelter <- df %>% 
  select(c(-1:-4, -8, -9)) %>% 
  rename(
    `시,군,구 명` = `시군구명`,
    `수용시설 명` = `수용시설명`
  )

dplyr::glimpse(earthquakeShelter)

usethis::use_data(earthquakeShelter, overwrite = TRUE)