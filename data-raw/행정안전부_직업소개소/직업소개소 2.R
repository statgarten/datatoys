library(tidyverse)
library(lubridate)

free_job <- read.csv('무료직업소개소.csv', fileEncoding = 'utf-8', header = T)
nfree_job <- read.csv('유료직업소개소.csv', fileEncoding = 'utf-8', header = T)

jobMating <- rbind(free_job, nfree_job)

jobMating <- jobMating %>% janitor::clean_names(ascii = FALSE) %>% 
  filter(영업상태명 == "영업/정상") %>% 
  select(c(16,18:22,27:28,30)) %>% 
  rename(
    `경도` = `좌표정보_x`,
    `위도` = `좌표정보_y`,
    `전화번호` = `소재지전화`,
    `유무료` = `구분명`
  )  %>% 
  filter(!is.na(위도)) %>% 
  filter(!is.na(유무료) & `유무료` != "") %>% 
  relocate(`사업장명`)

sf_jobMating <- st_as_sf(jobMating, coords = c("경도", "위도"), crs = 2097)

sf_jobMating_wgs84 <- st_transform(sf_jobMating, crs = 4326)

jobMating$경도 <-  st_coordinates(sf_jobMating_wgs84)[, 1] 
jobMating$위도 <-  st_coordinates(sf_jobMating_wgs84)[, 2]

usethis::use_data(jobMating, overwrite = TRUE)

