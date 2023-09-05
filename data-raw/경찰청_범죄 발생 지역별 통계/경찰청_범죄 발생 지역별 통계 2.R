library(tidyverse)
library(lubridate)

guess_encoding("경찰청_범죄 발생 지역별 통계_20151231.csv")

crime <- read.csv("경찰청_범죄 발생 지역별 통계_20151231.csv", fileEncoding = "euc-kr")

crime

glimpse(crime)


crime <- crime %>%
  tibble() 

usethis::use_data(crime, overwrite = TRUE)
