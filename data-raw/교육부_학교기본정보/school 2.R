library(tidyverse)
library(lubridate)

file <- ".csv"
readr::guess_encoding(file)

df <- tibble::tibble(readxl::read_excel("학교기본정보(초).xlsx")) %>% janitor::clean_names(ascii = FALSE) %>% mutate(구분 = "초등학교")
df1 <- tibble::tibble(readxl::read_excel("학교기본정보(중).xlsx")) %>% janitor::clean_names(ascii = FALSE) %>% mutate(구분 = "중학교")
df2 <- tibble::tibble(readxl::read_excel("학교기본정보(고).xlsx")) %>% janitor::clean_names(ascii = FALSE) %>% mutate(구분 = "고등학교")
df3 <- tibble::tibble(readxl::read_excel("학교기본정보(특).xlsx")) %>% janitor::clean_names(ascii = FALSE) %>% mutate(구분 = "특수학교")
df4 <- tibble::tibble(readxl::read_excel("학교기본정보(그외).xlsx")) %>% janitor::clean_names(ascii = FALSE) %>% mutate(구분 = "그외")
# df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))


school <- df %>% bind_rows(df2, df3, df4)
table(school$구분)

dplyr::glimpse(school)

usethis::use_data(school, overwrite = TRUE)
