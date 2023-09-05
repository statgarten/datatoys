library(tidyverse)
library(lubridate)

file <- "경찰청_음주운전 적발 기록 현황_20220731.csv"
readr::guess_encoding(file)

data.table::fread(file)

df <- tibble::tibble(read.csv(file, fileEncoding = "UTF-16", sep = "\t")) %>% 
  mutate(
    성별 = factor(성별),
    나이불명 = ifelse(나이 == "불명", "나이불명", "정상"),
    나이 = parse_number(나이),
    측정 = ifelse(알콜농도 == "측정거부", "거부", "측정"),
    알콜농도 = parse_number(알콜농도),
    측정일시 = ymd_hm(측정일시)
  )

df

drunkdrive <- df
table(drunkdrive$측정)
table(drunkdrive$나이불명)

dplyr::glimpse(drunkdrive)

usethis::use_data(drunkdrive, overwrite = TRUE)




drunkdrive %>%
  mutate(
    적발요일 = lubridate::wday(측정일시, label = TRUE)
  ) %>% 
  group_by(적발요일) %>% 
  summarise(n = n()) %>% 
  ggplot(aes(적발요일, n)) +
  geom_col() +
  ggthemes::theme_fivethirtyeight(base_family = "NanumGothic")
