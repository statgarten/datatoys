library(tidyverse)
library(lubridate)

df_1 <- read.csv('fulldata_09_30_01_P_가축분뇨수집운반업.csv', fileEncoding = 'utf-8', header = T)
df_2 <- read.csv('fulldata_09_30_02_P_가축분뇨배출시설관리업사업장.csv', fileEncoding = 'utf-8', header = T)

df <- rbind(df_1, df_2)

glimpse(df)
unique(df$개방서비스명)
aniPollution <- df %>% janitor::clean_names(ascii = FALSE) %>% 
  filter(영업상태명 == "영업/정상") %>% 
  select(c(2, 16,18:22,27:28,30)) %>% 
  rename(
    `경도` = `좌표정보_x`,
    `위도` = `좌표정보_y`,
    `전화번호` = `소재지전화`,
    `구분` = `개방서비스명`
  )  %>% 
  filter(!is.na(위도)) %>% 
  relocate(`사업장명`) %>% 
  relocate(`구분`,  .after = last_col())

sf_aniPollution <- st_as_sf(aniPollution, coords = c("경도", "위도"), crs = 2097)

sf_aniPollution_wgs84 <- st_transform(sf_aniPollution, crs = 4326)

aniPollution$경도 <-  st_coordinates(sf_aniPollution_wgs84)[, 1] 
aniPollution$위도 <-  st_coordinates(sf_aniPollution_wgs84)[, 2]

usethis::use_data(aniPollution, overwrite = TRUE)






