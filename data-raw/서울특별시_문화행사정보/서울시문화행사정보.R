library(tidyverse)
getwd()

df <- read.csv('./서울시 문화행사 정보.csv', fileEncoding = 'utf-8', header = T)

dplyr::glimpse(seoulFestival)

seoulFestival <- df %>% 
  select(c(-1,-11,-15:-18,-22)) %>% 
  rename(
    `공연(행사)명` = `공연.행사명`,
    `일시` = `날짜.시간`,
    `홈페이지주소` = `홈페이지.주소`,
    `경도` = `경도.X좌표.`,
    `위도` = `위도.Y좌표.`
  )

usethis::use_data(seoulFestival, overwrite = TRUE)