library(tidyr)
library(dplyr)
library(lubridate)
library(ggplot2)

df <- readxl::read_excel("내국인출국연령별_20230826172350.xlsx")
View(df)
departure <- df %>% 
  rename(
    연령별 = `연령별(1)`,
    `출국객 수` = 데이터
  )

glimpse(departure)
usethis::use_data(departure, overwrite = TRUE)



