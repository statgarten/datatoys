library(tidyverse)
setwd("../서울특별시_한파쉼터/")

df <- read.csv("./서울시 한파쉼터.csv", fileEncoding = "utf-8", header = T)

warmingCenter <- df %>%
  select(c(-1:-8, -17:-25)) %>%
  rename(
    `난방기보유대수(열풍기)` = `난방기보유.열풍기.`,
    `난방기보유대수(히터)` = `난방기보유.히터.`,
    `난방기보유대수(난로)` = `난방기보유.난로.`,
    `난방기보유대수(라디에이터)` = `난방기보유.라디에이터.`
  )

dplyr::glimpse(warmingCenter)

usethis::use_data(warmingCenter, overwrite = TRUE)
