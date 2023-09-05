library(tidyverse)
library(lubridate)

file <- "종관기상_시간단위_2020.csv"
file1 <- "종관기상_일단위_2020.csv"
file2 <- "종관기상_지점정보_2020.csv"

readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df1 <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
df2 <- tibble::tibble(read.csv(file1, fileEncoding = "euc-kr"))
df3 <- tibble::tibble(read.csv(file2, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)


weather_hour <- df1 %>% mutate(관측시각 = lubridate::ymd_h(관측시각))
weather_day <- df2 %>% mutate(관측시각 = ymd(관측시각))
weather_code <- df3

weather2020 <- list()
weather2020$code <- weather_code
weather2020$day <- weather_day
weather2020$hour <- weather_hour

usethis::use_data(weather2020, overwrite = TRUE)
