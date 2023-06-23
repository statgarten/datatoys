library(tidyverse)
library(lubridate)
library(purrr)

## 통신정보 ----

list <- list.files(file.path("data"))

read <- function(list){
  df <- readxl::read_excel(list)
  df <- janitor::clean_names(df, ascii = FALSE)
  기준연 <- stringr::str_sub(list, 6, 9)
  기준월 <- stringr::str_extract(list, "(?<=\\d{4}\\.)(\\d+)(?=월)")
  df <- df %>% mutate(기준연 = as.integer(기준연), 기준월 = as.integer(기준월)) %>%
    select(기준연, 기준월, everything()) %>% arrange(기준연, 기준월)
  return(df)
}

purrr::map(paste0("data/", list[1]), function(x) read(x)) %>% bind_rows() %>% glimpse()

seoulCivic <- purrr::map(paste0("data/", list), function(x) read(x)) %>% bind_rows()
seoulCivic <- seoulCivic %>% mutate(기준연 = as.integer(기준연), 기준월 = as.integer(기준월)) %>% arrange(기준연, 기준월)
glimpse(seoulCivic)

usethis::use_data(seoulCivic, overwrite = TRUE)
