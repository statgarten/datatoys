library(tidyverse)
library(lubridate)

getwd()
df <- read.csv('fulldata_07_22_21_P_식용얼음판매업.csv', fileEncoding = 'utf-8', header = T)
library(sf)
glimpse(df)

iceMarket <- df %>% janitor::clean_names(ascii = FALSE) %>% 
  filter(영업상태명 == "영업/정상") %>% 
  select(c(16,17:22,27:28)) %>% 
  rename(
    `경도` = `좌표정보_x`,
    `위도` = `좌표정보_y`,
    `전화번호` = `소재지전화`
  )  %>% 
  filter(!is.na(위도)) %>% 
  relocate(`사업장명`)

sf_iceMarket <- st_as_sf(iceMarket, coords = c("경도", "위도"), crs = 2097)

sf_iceMarket_wgs84 <- st_transform(sf_iceMarket, crs = 4326)

iceMarket$경도 <-  st_coordinates(sf_iceMarket_wgs84)[, 1] 
iceMarket$위도 <-  st_coordinates(sf_iceMarket_wgs84)[, 2]

usethis::use_data(iceMarket, overwrite = TRUE)
