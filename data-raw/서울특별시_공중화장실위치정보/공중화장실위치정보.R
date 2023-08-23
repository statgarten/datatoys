library(tidyverse)
library(lubridate)

df <- read.csv('서울시 공중화장실 위치정보 (좌표계_ WGS1984).csv', fileEncoding = 'utf-8', header = T)

glimpse(seoulRestroom)

seoulRestroom <- df %>% 
  select(c(2:3,9:10)) %>% 
  rename(
    `주소(구)` = `구명`,
    `주소(동)` = `법정동명`
  )

usethis::use_data(seoulRestroom, overwrite = TRUE)
