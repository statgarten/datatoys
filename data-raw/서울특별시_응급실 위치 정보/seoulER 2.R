library(tidyverse)
library(lubridate)

file <- "서울시 응급실 위치 정보.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

seoulER <- df

usethis::use_data(seoulER, overwrite = TRUE)


library(leaflet)

seoulER |> 
  leaflet() |> 
  addTiles() |> 
  addMarkers(~병원경도, ~병원위도, popup = ~as.character(기관명), label = ~as.character(기관명))
