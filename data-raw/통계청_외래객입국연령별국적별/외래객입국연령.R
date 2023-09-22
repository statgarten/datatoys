install.packages("lubridate")
library(tidyverse)
library(lubridate)

df_1 <- readxl::read_excel("외래객_입국연령별_국적별_20230825165908.xlsx")

df_2 <- readxl::read_excel("외래객_입국연령별_국적별_20230825170022.xlsx")

df <- rbind(df_1, df_2)

entrance <- df %>%
  rename(
    연령 = `항목`,
    대륙 = `국적별(1)`,
    국가 = `국적별(2)`,
    외래객 = 데이터
  )

usethis::use_data(entrance, overwrite = TRUE)
