library(tidyverse)

setwd("../행정안전부_안경업/")

df <- read.csv('fulldata_01_02_01_P_안경업.csv', fileEncoding = 'utf-8', header = T)

optician <- df %>% 
  select(c(9,12,16,18:22,27:28)) %>% 
  rename(
    `경도` = `좌표정보.x.`,
    `위도` = `좌표정보.y.`,
    `전화번호` = `소재지전화`
  ) %>% 
  relocate(`사업장명`)

optician$경도[is.na(optician$경도)] <- 0
optician$위도[is.na(optician$위도)] <- 0

library(sf)

sf_optician <- st_as_sf(optician, coords = c("경도", "위도"), crs = 2097)

sf_optician_wgs84 <- st_transform(sf_optician, crs = 4326)

optician$경도 <-  st_coordinates(sf_optician_wgs84)[, 1] 
optician$위도 <-  st_coordinates(sf_optician_wgs84)[, 2]

usethis::use_data(optician, overwrite = TRUE)


