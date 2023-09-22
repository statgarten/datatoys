library(tidyverse)
library(lubridate)

file <- "fireStation-소방서.csv"
readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

df1 <- tibble::tibble(read.csv("fireStation-안전센터.csv", fileEncoding = "euc-kr"))


dplyr::glimpse(df)

df %>% mutate(분류 = "소방서")
df1 %>% mutate(분류 = "안전센터") # 나중에 추가


fireStation <- df

usethis::use_data(fireStation, overwrite = TRUE)
