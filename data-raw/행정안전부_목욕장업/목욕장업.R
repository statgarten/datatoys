library(tidyverse)
library(lubridate)

df <- read.csv('fulldata_11_44_01_P_목욕장업.csv', fileEncoding = 'utf-8', header = T)
library(sf)

bathHouse <- df %>% janitor::clean_names(ascii = FALSE) %>% 
  filter(영업상태명 == "영업/정상") %>% 
  select(c(16,17:22,26:28,30:31,36:37)) %>% 
  rename(
    `경도` = `좌표정보_x`,
    `위도` = `좌표정보_y`,
    `전화번호` = `소재지전화`
  )  %>% 
  filter(!is.na(위도)) %>% 
  relocate(`사업장명`)

sf_bathHouse <- st_as_sf(bathHouse, coords = c("경도", "위도"), crs = 2097)

sf_bathHouse_wgs84 <- st_transform(sf_bathHouse, crs = 4326)

bathHouse$경도 <-  st_coordinates(sf_bathHouse_wgs84)[, 1] 
bathHouse$위도 <-  st_coordinates(sf_bathHouse_wgs84)[, 2]

usethis::use_data(bathHouse, overwrite = TRUE)

