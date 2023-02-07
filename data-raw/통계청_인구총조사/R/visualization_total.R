library(dplyr)
library(ggplot2)
library(gganimate)

population <- datatoys::population
population <- subset(population, 행정구역별 != "황해도" & 행정구역별 != "평안북도" & 행정구역별 != "평안남도" & 행정구역별 != "함경북도" & 행정구역별 != "함경남도" & 행정구역별 != "함경북도")
population <- population %>%
  mutate(
    행정구역별 = recode(행정구역별, "서울특별시" = "서울", "부산광역시" = "부산", "충청북도" = "충북", "충청남도" = "충남", 
                   "전라북도" = "전북", "전라남도" = "전남", "경상북도" = "경북", "경상남도" = "경남", "대구광역시" = "대구", 
                   "광주광역시" = "광주", "대전광역시" = "대전", "울산광역시" = "울산", "인천광역시" = "인천", "경기도" = "경기", 
                   "강원도" = "강원", "제주도" = "제주", "세종특별자치시" = "세종", "제주특별자치도" = "제주")
  ) %>%
  group_by(행정구역별, 연도) %>%
  summarise(
    인구수_10000 = round(sum(인구수, na.rm = TRUE) / 10000)
  ) %>%
  ungroup() %>%
  group_by(연도) %>%
  arrange(연도, desc(인구수_10000)) %>%
  mutate(
    rank = row_number(),
    인구수_char = paste0(" ", 인구수_10000)
  ) %>%
  ungroup()

area_palette <- c(
  "경남" = "#FF65AE",
  "경북" = "#FF65AE",
  "대구" = "#F763E0",
  "울산" = "maroon",
  "부산" = "lightpink1",
  "전남" = "wheat",
  "전북" = "wheat",
  "광주" = "tan",
  "경기" = "lightblue2",
  "서울" = "steelblue1",
  "인천" = "turquoise",
  "충남" = "gold",
  "충북" = "gold",
  "대전" = "yellow2",
  "세종" = "goldenrod2",
  "강원" = "seagreen3",
  "제주" = "darkgrey"
)

total_population <- ggplot(population, aes(rank, group = 행정구역별)) +
  geom_tile(aes(
    y = 인구수_10000 / 2,
    height = 인구수_10000,
    width = 0.9, fill = 행정구역별), 
    alpha = 0.8) +
  geom_text(aes(y = 0, label = paste(행정구역별, " ")), vjust = 0.2, hjust = 1, size = 5, family = "AppleSDGothicNeo-SemiBold") +
  geom_text(aes(y = 인구수_10000, label = 인구수_char, hjust = 0)) +
  theme_minimal(base_family = "AppleSDGothicNeo-SemiBold") +
  theme(
    axis.text.x = element_text(size = 15, color = "grey3", face = "bold"),
    axis.title = element_text(size = 17, color = "grey21", face = "bold"),
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, size = 22, color = "royalblue4", face = "bold"),
    axis.line = element_blank(),
    axis.text.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_line(size = 0.1, color = "grey"),
    panel.grid.minor.x = element_line(size = 0.1, color = "grey"),
    plot.background = element_blank()
  ) +
  transition_states(연도,
                    transition_length = 40,
                    state_length = 10
  ) +
  scale_y_continuous(breaks = seq(0, 1500, 250), labels = scales::comma) +
  scale_x_reverse() +
  scale_fill_manual(values = area_palette) +
  labs(
    title = "{closest_state}년 대한민국 지역별 인구수",
    subtitle = "1925-2021년",
    caption = "KOSTAT; 인구총조사(통계청)",
    x = "",
    y = "지역별 총 인구(만명)"
  ) +
  coord_flip() +
  ease_aes("quartic-in-out") +
  enter_fade()

animate(plot = total_population, nframes = 400, end_pause = 20, width = 1080, height = 720)