library(tidyverse)
library(lubridate)

guess_encoding("붙임1_18년기준_전국오염원조사자료_2. 축산계.csv")

pollution <- read.csv("붙임1_18년기준_전국오염원조사자료_2. 축산계.csv", fileEncoding = "euc-kr")

glimpse(pollution)


pollution <- pollution %>%
  tibble() 

table(pollution$축종)

usethis::use_data(pollution, overwrite = TRUE)
