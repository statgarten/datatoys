library(tidyverse)
library(lubridate)

Kcalendar <- read_csv("data-raw/한국천문연구원_특일 정보/korea-calendar.csv")

glimpse(Kcalendar)

Kcalendar <- Kcalendar %>%
  mutate(
    손있는날 = gsub(",", "", 손있는날)
  )

usethis::use_data(Kcalendar, overwrite = TRUE)

