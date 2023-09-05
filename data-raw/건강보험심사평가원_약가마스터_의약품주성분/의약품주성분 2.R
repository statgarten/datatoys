library(tidyverse)
library(lubridate)

file <- "의약품주성분.csv"

readr::guess_encoding(file)

# df <- tibble::tibble(readxl::read_excel(file))
df <- tibble::tibble(read.csv(file, fileEncoding = "euc-kr"))
# df <- tibble::tibble(read.csv(file, fileEncoding = "utf-8"))

dplyr::glimpse(df)

medicine <- df

usethis::use_data(medicine, overwrite = TRUE)
