library(tidyverse)
library(lubridate)

# 아주대학교병원, 국군수도병원 및 참조은병원 정보 수기로 추가함
file <- "응급의료기관및응급의료지원센터현황.xls"
# readr::guess_encoding(file)

df <- tibble::tibble(readxl::read_excel(file))
# df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

gyeonggiER <- df %>% mutate(
  경도 = as.numeric(경도),
  위도 = as.numeric(위도)
)

usethis::use_data(gyeonggiER, overwrite = TRUE)


library(leaflet)

gyeonggiER |> 
  leaflet() |> 
  addTiles() |> 
  addMarkers(~경도, ~위도, popup = ~as.character(`병원명/센터명`), label = ~as.character(`병원명/센터명`)) |> 
  addMarkers(~병원경도, ~병원위도, popup = ~as.character(기관명), label = ~as.character(기관명), data = datatoys::seoulER)
