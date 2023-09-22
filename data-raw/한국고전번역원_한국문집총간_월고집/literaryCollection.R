library(tidyverse)
library(XML)

files <- dir("data_20210125")

guess_encoding(paste0("data_20210125/", files[1]))

files[2] %>%
  paste0("data_20210125/", .) %>%
  xmlParse() %>%
  xmlRoot() %>%
  getNodeSet("//메타정보") %>%
  xmlToDataFrame() %>%
  tibble()

files[2] %>%
  paste0("data_20210125/", .) %>%
  xmlParse() %>%
  xmlRoot() %>%
  getNodeSet("//본문정보") %>%
  xmlToDataFrame() %>%
  tibble()
