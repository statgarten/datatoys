library(tidyverse)
library(lubridate)

## CSV로는 전체파일이 안읽어짐 --> xlsx로 변환해서 로딩

file <- "한국승강기안전공단 국내 승강기 보유 현황_20211231.xlsx"
readr::guess_encoding(file)

df <- tibble::tibble(readxl::read_excel(file))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

elevator <- janitor::clean_names(df, ascii = FALSE)


usethis::use_data(elevator, overwrite = TRUE)
