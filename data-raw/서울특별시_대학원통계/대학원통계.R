library(tidyverse)
library(dplyr)

df <- readxl::read_excel("대학원_20230831213041.xlsx")

seoulGraduate <- df %>% 
  rename(
    구분_1 = `구분별(1)`,
    구분_2 = `구분별(2)`,
    수 = 데이터
  )

usethis::use_data(seoulGraduate, overwrite = TRUE)


