library(tidyverse)



df <- read.csv('./서울시립미술관 소장품 정보.csv', fileEncoding = 'utf-8', header = T)
Artmuseum <- df %>% 
  select(1:10) %>% 
  rename(
    `작품명(국문)` = `작품명.국문.`,
    `작품명(영문)` = `작품명.영문.`,
    `재료(기법)` = `재료.기법`,
    `이미지` = `메인이미지`
  )

Artmuseum$제작년도 <-  as.integer(Artmuseum$제작년도)

usethis::use_data(Artmuseum, overwrite = TRUE)
