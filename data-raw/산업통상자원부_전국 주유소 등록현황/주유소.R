library(tidyverse)
library(lubridate)

guess_encoding("주유소_20211231.csv")
gasStation <- read.csv("주유소_20211231.csv", fileEncoding = "euc-kr") %>% tibble() 
glimpse(gasStation)

gasStation

usethis::use_data(gasStation, overwrite = TRUE)
