library(tidyverse)

# df <- readr::read_csv("한국국제협력단_KOICA 소득수준별 ODA 실적통계_20210521.csv")
guess_encoding("한국국제협력단_KOICA 소득수준별 ODA 실적통계_20210521.csv")

odaKR <- read.csv("한국국제협력단_KOICA 소득수준별 ODA 실적통계_20210521.csv", fileEncoding = "euc-kr")

odaKR <- odaKR %>%
  tibble() %>%
  mutate(
    # 연도 = factor(연도),
    사업분류 = factor(사업분류),
    지원액_원화 = parse_number(지원액_원화),
    지원액_달러 = parse_number(지원액_달러)
  )


usethis::use_data(odaKR, overwrite = TRUE)
