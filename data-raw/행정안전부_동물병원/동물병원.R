library(tidyverse)

setwd("Desktop/Antller/datatoys/data-raw/행정안정부_동물병원/")

df <- read.csv("./fulldata_02_03_01_P_동물병원.csv", fileEncoding = "utf-8", header = T)

animalHospital <- df %>%
  select(c(-1:-8, -10:-11, -13:-15, -18, -23:-26, -29:-31)) %>%
  rename(
    `경도` = `좌표정보.x.`,
    `위도` = `좌표정보.y.`,
    `전화번호` = `소재지전화`
  )

animalHospital$경도[is.na(animalHospital$경도)] <- 0
animalHospital$위도[is.na(animalHospital$위도)] <- 0

library(sf)

sf_animalHospital <- st_as_sf(animalHospital, coords = c("경도", "위도"), crs = 2097)

sf_animalHospital_wgs84 <- st_transform(sf_animalHospital, crs = 4326)

animalHospital$경도 <- st_coordinates(sf_animalHospital_wgs84)[, 1]
animalHospital$위도 <- st_coordinates(sf_animalHospital_wgs84)[, 2]

dplyr::glimpse(animalHospital)

usethis::use_data(animalHospital, overwrite = TRUE)
