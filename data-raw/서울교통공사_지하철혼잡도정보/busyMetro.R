library(tidyverse)
library(lubridate)

file <- "서울교통공사_지하철혼잡도정보_20221231.csv"
readr::guess_encoding(file)

df <- read.csv(file, fileEncoding = "EUC-KR")

str(df)

busyMetro <- df %>% select(-연번) %>% pivot_longer(cols = 6:44, names_to = "시간", values_to = "혼잡도") %>% 
  mutate(
    시간 = str_replace(시간, "X", ""), 
    시간 = str_replace(시간, "시", ":"), 
    시간 = str_replace(시간, "분", "")
  ) 

factor <- busyMetro %>% filter(요일구분 == "평일" & 출발역 == "서울역", 상하구분 == "상선", 호선 == 1) %>% pull(시간)

busyMetro <- busyMetro %>% 
  mutate(시간 = factor(시간, levels = factor))

busyMetro %>% 
  group_by(호선) %>% 
  summarise(
    평균혼잡도 = mean(혼잡도, na.rm = TRUE),
    최대혼잡도 = max(혼잡도, na.rm = TRUE)
  ) %>% 
  arrange(desc(평균혼잡도))

busyMetro %>% filter(출발역 == "을지로3가") %>% View()

busyMetro %>% 
  filter(요일구분 == "평일") %>% 
  # filter(호선 <= 3) %>%
  mutate(출발역 = paste(호선, "호선", 출발역)) %>% 
  ggplot(aes(시간, 혼잡도, color = 상하구분)) +
  geom_line(aes(group = 상하구분)) +
  scale_color_manual(values = c("#E966A0", "#213363", "#8EAC50", "#F2BE22")) +
  facet_wrap(. ~출발역, ncol = 20, strip.position = "bottom") +
  ggthemes::theme_tufte(base_family = "NanumGothic") +
  theme(
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    legend.position = "bottom"
  ) +
  labs(
    title = "서울교통공사 시간대별 지하철 혼잡도 분포",
    subtitle = "05:30 ~ 00:30"
  )

usethis::use_data(busyMetro, overwrite = TRUE)
