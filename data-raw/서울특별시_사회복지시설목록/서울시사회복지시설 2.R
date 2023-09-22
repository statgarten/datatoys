library(tidyverse)
setwd("../서울특별시_사회복지시설목록/")

df <- read.csv("./서울시 사회복지시설 목록.csv", fileEncoding = "utf-8", header = T)

socialCenter <- df %>%
  select(c(-2, -5, -7)) %>%
  rename(
    `시설유형` = `시설종류명.시설유형.`,
    `시설종류` = `시설종류상세명.시설종류.`,
    `수용가능인원` = `정원.수용인원.`,
    `이용인원` = `현인원`
  ) %>%
  mutate(`분류` = str_extract(`시설유형`, "\\((.*?)\\)"))
socialCenter$분류 <- gsub("\\((.*?)\\)", "\\1", socialCenter$분류)

dplyr::glimpse(socialCenter)

usethis::use_data(socialCenter, overwrite = TRUE)
