library(tidyverse)
library(lubridate)

df <- read.csv("fulldata_03_09_01_P_노래연습장업.csv", fileEncoding = "utf-8", header = T)

library(sf)

singingRoom <- df %>%
  janitor::clean_names(ascii = FALSE) %>%
  filter(영업상태명 == "영업/정상") %>%
  select(c(16, 19:22, 27:28, 31, 40)) %>%
  rename(
    `경도` = `좌표정보_x`,
    `위도` = `좌표정보_y`,
    `전화번호` = `소재지전화`
  ) %>%
  filter(!is.na(위도)) %>%
  relocate(`사업장명`)

sf_singingRoom <- st_as_sf(singingRoom, coords = c("경도", "위도"), crs = 2097)

sf_singingRoom_wgs84 <- st_transform(sf_singingRoom, crs = 4326)

singingRoom$경도 <- st_coordinates(sf_singingRoom_wgs84)[, 1]
singingRoom$위도 <- st_coordinates(sf_singingRoom_wgs84)[, 2]

usethis::use_data(singingRoom, overwrite = TRUE)
