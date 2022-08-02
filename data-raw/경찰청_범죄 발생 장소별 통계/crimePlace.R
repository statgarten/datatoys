library(tidyverse)
library(lubridate)

file <- "경찰청_범죄 발생 장소별 통계_20201231.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

crimePlace <- df |> 
  pivot_longer(
    cols = 아파트.연립다세대:기타,
    names_to = "장소",
    values_to = "발생횟수"
  )

crimePlace |> 
  pull(장소) |> 
  unique()

crimePlace |> 
  filter(범죄대분류 == "강력범죄") |> 
  group_by(장소) |> 
  summarise(
    발생횟수 = sum(발생횟수)
  ) |> 
  arrange(desc(발생횟수))

usethis::use_data(crimePlace, overwrite = TRUE)
