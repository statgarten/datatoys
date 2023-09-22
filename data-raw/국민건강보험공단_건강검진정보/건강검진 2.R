library(tidyverse)
library(lubridate)

guess_encoding("건강검진_20211229.csv")
medicalCheckup <- read.csv("건강검진_20211229.csv", fileEncoding = "euc-kr") %>% tibble()

glimpse(medicalCheckup)

usethis::use_data(medicalCheckup, overwrite = TRUE)
