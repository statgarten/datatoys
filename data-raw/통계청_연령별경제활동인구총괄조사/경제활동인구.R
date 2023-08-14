library(tidyverse)

getwd()
setwd("../통계청_연령별경제활동인구총괄조사//")

economyPeople <- readxl::read_excel("연령별_경제활동인구_총괄_20230812220037.xlsx")

dplyr::glimpse(economyPeople)

usethis::use_data(economyPeople, overwrite = TRUE)

