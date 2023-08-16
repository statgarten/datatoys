library(tidyverse)
library(lubridate)

df <- read.csv('fulldata_01_01_04_P_산후조리업.csv', fileEncoding = 'utf-8', header = T)
library(sf)

postnatal <- df %>% janitor::clean_names(ascii = FALSE) %>% 
  filter(영업상태명 == "영업/정상") %>% 
  select(c(16,18:22,27:47)) %>% 
  rename(
    `경도` = `좌표정보_x`,
    `위도` = `좌표정보_y`,
    `전화번호` = `소재지전화`
  )  %>% 
  filter(!is.na(위도)) %>% 
  relocate(`사업장명`)

sf_postnatal <- st_as_sf(postnatal, coords = c("경도", "위도"), crs = 2097)

sf_postnatal_wgs84 <- st_transform(sf_postnatal, crs = 4326)

postnatal$경도 <-  st_coordinates(sf_postnatal_wgs84)[, 1] 
postnatal$위도 <-  st_coordinates(sf_postnatal_wgs84)[, 2]

usethis::use_data(postnatal, overwrite = TRUE)
