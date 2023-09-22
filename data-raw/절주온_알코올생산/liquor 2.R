library(tidyverse)
library(lubridate)

file <- "주요 주류 출고현황 (국내분).xls"
readr::guess_encoding(file)

df <- readxl::read_excel(file)
df1 <- df %>%
  select(-2) %>% # 총 출량 제외
  pivot_longer(cols = 2:13, values_to = "출고량_킬로리터", names_to = "종류") %>%
  mutate(연도 = factor(연도), 종류 = factor(종류), 출고량_킬로리터 = as.integer(출고량_킬로리터))

str(df1)


df2 <- readxl::read_excel("가구 당 월 평균 소비지출 중 주류지출 비용 및 비율.xls")
df2 <- df2 %>%
  select(-실질) %>%
  pivot_wider(names_from = "구분", values_from = 명목) %>%
  rename(
    명목소비지출 = 소비지출,
    명목주류지출 = 주류지출,
    주류비비율 = 비율
  ) %>%
  mutate_all(function(x) as.numeric(x))

# 명목금액은 당해년 가격으로 평가한 항목으로 가격 및 물량변동 요인이 모두 반영되어 있으며,
# 실질금액은 가격변동 요인 제거를 위해 특정 년도의 가격으로 평가한 항목으로 물량변동 요인만 반영

df3 <- readxl::read_excel("알코올 질환 전체 사망자수 및 인구 10만 명당 사망률(성별).xls")
df3 <- df3 %>%
  select(-총계) %>%
  pivot_longer(cols = 남자:여자, names_to = "성별") %>%
  pivot_wider(names_from = 구분, values_from = value) %>%
  mutate(사망자수 = as.integer(사망자수), 사망률 = as.numeric(사망률))

liquor <- list()

liquor[["출고량"]] <- df1
liquor[["주류지출비용"]] <- df2
liquor[["알콜관련사망자"]] <- df3

liquor

usethis::use_data(liquor, overwrite = TRUE)
