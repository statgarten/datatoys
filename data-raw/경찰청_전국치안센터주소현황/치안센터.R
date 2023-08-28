library(tidyverse)
library(lubridate)

df <- read.csv('경찰청_전국 치안센터 주소 현황_20221231.csv', fileEncoding = 'utf-8', header = T)

policeBox <- df %>% 
  select(-1) %>% 
  rename(
    지역명 = 경찰서
  )

usethis::use_data(policeBox, overwrite = TRUE)

