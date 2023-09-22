library(tidyverse)
library(lubridate)

## 비례대표
list <- list.files(file.path("data/비례대표"))
list_비례이름 <- purrr::map(paste0("data/비례대표/", list), function(x) {
  paste0(list.files(file.path(x)))
}) %>%
  purrr::reduce(c) %>%
  str_extract("(?<=_).*") %>%
  str_remove(".xlsx")
list_비례 <- purrr::map(paste0("data/비례대표/", list), function(x) {
  paste0(x, "/", list.files(file.path(x)))
}) %>% purrr::reduce(c)

read <- function(list, name) {
  df <- readxl::read_excel(list, skip = 3)
  colnames(df)[-c(1:4)] <- df[1, -c(1:4)]
  df <- df[-1, ]
  df <- df %>%
    janitor::clean_names(ascii = FALSE) %>%
    select(!starts_with("na")) %>%
    tidyr::fill(읍면동명) %>%
    mutate(투표구명 = ifelse(is.na(투표구명), 읍면동명, 투표구명)) %>%
    dplyr::filter(읍면동명 != "합계") %>%
    filter(투표구명 != "소계") %>%
    mutate_at(vars(-c(1:2)), as.numeric) %>%
    pivot_longer(cols = -c(1:4), names_to = "정당", values_to = "득표") %>%
    filter(정당 != "계") %>%
    mutate(지역구명 = name) %>%
    select(지역구명, everything())
  return(df)
}

df_비례대표 <- purrr::map2(list_비례, list_비례이름, function(x, y) read(x, y)) %>% bind_rows()
str(df_비례대표)

df_비례대표 %>%
  group_by(정당) %>%
  summarise(득표 = sum(득표)) %>%
  arrange(desc(득표)) %>%
  View()

## 지역구 ----
list <- list.files(file.path("data/지역구"))
list_지역구이름 <- purrr::map(paste0("data/지역구/", list), function(x) {
  paste0(list.files(file.path(x)))
}) %>%
  purrr::reduce(c) %>%
  str_extract("(?<=_).*") %>%
  str_remove(".xlsx")
list_지역구 <- purrr::map(paste0("data/지역구/", list), function(x) {
  paste0(x, "/", list.files(file.path(x)))
}) %>% purrr::reduce(c)

df_지역구 <- purrr::map2(list_지역구, list_지역구이름, function(x, y) read(x, y)) %>% bind_rows()


## 보궐 ----

list <- list.files(file.path("data/재보궐"))
list_재보궐이름 <- purrr::map(paste0("data/재보궐/", list), function(x) {
  paste0(list.files(file.path(x)))
}) %>%
  purrr::reduce(c) %>%
  str_extract("(?<=_).*") %>%
  str_remove(".xlsx")
list_재보궐 <- purrr::map(paste0("data/재보궐/", list), function(x) {
  paste0(x, "/", list.files(file.path(x)))
}) %>% purrr::reduce(c)

df_재보궐 <- purrr::map2(list_재보궐, list_재보궐이름, function(x, y) read(x, y)) %>% bind_rows()

## bind ----

election2020 <- rbind(
  df_비례대표 %>% mutate(구분 = "비례대표"),
  df_지역구 %>% mutate(구분 = "지역구"),
  df_재보궐 %>% mutate(구분 = "지역구") %>% select(-투표용지_교부수)
) %>% select(구분, everything())

rio::export("election2020", file = "election2020.rda")

usethis::use_data(election2020, overwrite = TRUE)
