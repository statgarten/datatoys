library(tidyverse)
library(lubridate)

df <- readxl::read_excel("02_04_01_P.xlsx")

farmGIS <- df %>% janitor::clean_names(ascii = FALSE)
str(farmGIS)

library(sf)
library(tidyverse)
library(leaflet)
library(inlmisc)

farm <- farmGIS %>%
  separate(col = "도로명전체주소", into = c("시도", "시군구"), sep = " ") %>%
  filter(주사육업종 == "한우") %>%
  filter(영업상태명 == "영업/정상") %>%
  mutate(
    x = as.numeric(좌표정보_x),
    y = as.numeric(좌표정보_y),
    idx = row_number()
  ) %>%
  select(사업장명, x, y, idx) %>%
  filter(!is.na(y)) %>%
  st_as_sf(coords = c("x", "y"), crs = 5174) %>%
  st_transform(4326)

leaflet() %>%
  addTiles() %>%
  addMarkers(data = farm, label = ~ as.character(사업장명), clusterOptions = markerClusterOptions(), group = "marker") %>%
  inlmisc::AddSearchButton(group = "marker", zoom = 15, textPlaceholder = "Search here")


usethis::use_data(farmGIS, overwrite = TRUE)
