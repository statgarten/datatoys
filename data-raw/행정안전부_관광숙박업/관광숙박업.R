library(tidyverse)

setwd("../행정안전부_관광숙박업/")

df <- read.csv('fulldata_03_11_01_P_관광숙박업.csv', fileEncoding = 'utf-8', header = T)

accom <- df %>% 
  select(c(9,12,16:22,27:28,32,37:39,41)) %>% 
  rename(
    `경도` = `좌표정보.x.`,
    `위도` = `좌표정보.y.`,
    `전화번호` = `소재지전화`
  )

accom$경도[is.na(accom$경도)] <- 0
accom$위도[is.na(accom$위도)] <- 0

library(sf)

sf_accom <- st_as_sf(accom, coords = c("경도", "위도"), crs = 2097)

sf_accom_wgs84 <- st_transform(sf_accom, crs = 4326)

accom$경도 <-  st_coordinates(sf_accom_wgs84)[, 1] 
accom$위도 <-  st_coordinates(sf_accom_wgs84)[, 2]

usethis::use_data(accom, overwrite = TRUE)




