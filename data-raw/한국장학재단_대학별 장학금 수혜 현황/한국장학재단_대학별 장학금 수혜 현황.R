library(tidyverse)
library(lubridate)

guess_encoding("scholarship.csv")

scholarship <- read.csv("scholarship.csv", fileEncoding = "euc-kr") %>% tibble()

scholarship

glimpse(scholarship)

usethis::use_data(scholarship, overwrite = TRUE)
