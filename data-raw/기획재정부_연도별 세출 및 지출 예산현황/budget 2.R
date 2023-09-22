library(tidyverse)
library(lubridate)

# file <- "서울교통공사_지하철혼잡도정보_20221231.csv"
# readr::guess_encoding(file)

df <- readxl::read_excel("세출_지출 세부사업 예산편성현황(총액)_20230619141616.xlsx")

str(df)

budget2023 <- df %>%
  select(-1) %>%
  janitor::clean_names(ascii = FALSE)
usethis::use_data(budget2023, overwrite = TRUE)
