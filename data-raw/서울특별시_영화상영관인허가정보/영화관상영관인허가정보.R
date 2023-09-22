library(tidyverse)
setwd("../서울특별시_영화상영관인허가정보/")

df <- read.csv("./서울시 영화상영관 인허가 정보.csv", fileEncoding = "utf-8", header = T)


unique(df$영업상태코드)
unique(df$사업장명)
cinema <- df %>%
  select(c(사업장명, 관리번호, 영업상태명, 폐업일자, 전화번호, 지번주소, 도로명주소, 도로명우편번호, 좌표정보.X., 좌표정보.Y., 총층수, 지상층수, 지하층수)) %>%
  rename(
    `상영관명` = `사업장명`,
    `상영관 X좌표` = `좌표정보.X.`,
    `상영관 Y좌표` = `좌표정보.Y.`,
    `총 층수` = `총층수`,
    `지상 층수` = `지상층수`,
    `지하 층수` = `지하층수`
  )

dplyr::glimpse(cinema)

usethis::use_data(cinema, overwrite = TRUE)
