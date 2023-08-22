library(tidyverse)
library(lubridate)
seoulStatue <- read.csv('서울특별시_동상현황.csv', fileEncoding = 'utf-8', header = T)

seoulStatue <- seoulStatue %>% 
  select(c(1:2,4:8)) %>% 
  rename(
    작품설치장소 = 기관2,
    작품관리기관 = 기관3
  )
glimpse(seoulStatue)

usethis::use_data(seoulStatue, overwrite = TRUE)



