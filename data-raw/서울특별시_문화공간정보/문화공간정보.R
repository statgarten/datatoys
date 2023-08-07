
library(tidyverse)
setwd("../서울특별시_문화공간정보/")

df <- read.csv('./서울시 문화공간 정보.csv', fileEncoding = 'utf-8', header = T)

seoulCulture <- df %>% 
  select(c(-1,-8,-11,-16:-32)) %>% 
  rename(
    분류 = 주제분류
  ) %>% 
  filter(row_number() != 17)

colnames(seoulCulture)
View(seoulCulture)

seoulCulture$위도 <- as.double(seoulCulture$위도)
seoulCulture$경도 <- as.double(seoulCulture$경도)

usethis::use_data(seoulCulture, overwrite = TRUE)



