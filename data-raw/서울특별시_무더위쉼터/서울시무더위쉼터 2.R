
library(tidyverse)
setwd("../서울특별시_무더위쉼터/")

df <- read.csv('./서울시 무더위쉼터.csv', fileEncoding = 'utf-8', header = T)
View(df)
coolCenter <- df %>% 
  select(c(-1:-4,-15,-16))

dplyr::glimpse(coolCenter)

usethis::use_data(coolCenter, overwrite = TRUE)