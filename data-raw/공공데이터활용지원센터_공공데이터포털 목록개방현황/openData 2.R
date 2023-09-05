library(tidyverse)
library(lubridate)

file <- "공공데이터활용지원센터_공공데이터포털 목록개방현황_20220630.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
# df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

openData <- df

usethis::use_data(openData, overwrite = TRUE)
