library(tidyverse)
setwd("../서울특별시_공공도서관현황정보/")
df <- read.csv('./서울시 공공도서관 현황정보.csv', fileEncoding = 'utf-8', header = T)

seoulLibrary <- df %>% 
  select(c(-1,-10)) %>% 
  rename(
    `정기휴관일` = `정기.휴관일`,
    `홈페이지(URL)` = `홈페이지.URL`,
    `도서관구분` = `도서관.구분명`,
    `구(코드)` = `구.코드`
  )

dplyr::glimpse(seoulLibrary)

usethis::use_data(seoulLibrary, overwrite = TRUE)


