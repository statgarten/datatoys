library(tidyverse)
library(lubridate)

df <- read.csv('fulldata_02_04_04_P_부화업.csv', fileEncoding = 'utf-8', header = T)
library(sf)

glimpse(df)

hatching <- df %>% janitor::clean_names(ascii = FALSE) %>% 
  filter(영업상태명 == "영업/정상") %>% 
  select(c(16,17:22,27:28)) %>% 
  rename(
    `경도` = `좌표정보_x`,
    `위도` = `좌표정보_y`,
    `전화번호` = `소재지전화`
  )  %>% 
  filter(!is.na(위도)) %>% 
  relocate(`사업장명`)

sf_hatching <- st_as_sf(hatching, coords = c("경도", "위도"), crs = 2097)

sf_hatching_wgs84 <- st_transform(sf_hatching, crs = 4326)

hatching$경도 <-  st_coordinates(sf_hatching_wgs84)[, 1] 
hatching$위도 <-  st_coordinates(sf_hatching_wgs84)[, 2]

usethis::use_data(hatching, overwrite = TRUE)

