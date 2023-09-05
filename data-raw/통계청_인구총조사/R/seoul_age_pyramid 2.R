library(ggplot2)
library(tidyverse)
library(gganimate)
library(tidyr)

population <- datatoys::population
population <- population %>% 
  filter(행정구역별 == "서울특별시") %>% 
  filter(연도 != 1925 & 연도 != 1940 & 연도 != 1944) %>% 
  mutate(
    연령별 = ifelse(연령별 %in% c("85 - 89세", "90 - 94세", "95 - 99세", "100세이상"), "85세이상", 연령별)
  )

population$인구수 <- ifelse(population$분류=="남자",  -population$인구수, population$인구수)

View(population)

p <- ggplot(population,
            aes(x=factor(연령별,levels=c("0 - 4세", "5 - 9세", "10 - 14세", "15 - 19세", "20 - 24세", "25 - 29세", "30 - 34세", "35 - 39세", "40 - 44세", "45 - 49세", "50 - 54세","55 - 59세", "60 - 64세","65 - 69세", "70 - 74세","75 - 79세", "80 - 84세", "85세이상", "연령미상")),
                y=인구수/10000,
                fill = 분류)) +
  geom_bar(stat='identity') +
  geom_bar(stat='identity', width=0.9, alpha=0.8) +
  scale_y_continuous(name='인구(만명)') +
  coord_flip() +
  labs(title = '서울 인구 구조 변화 ({as.integer(frame_time)}년)',
       x = "") +
  # scale_y_continuous(labels = paste0(as.character(c(seq(2, 0, -1), seq(1, 2, 1))), "m")) +
  scale_fill_manual(values = c("남자" = "skyblue","여자"="hotpink"),
                    labels = c("남자" = "남자", "여자"= "여자"),
                    breaks = c("남자","여자"))+
  theme_minimal(base_family = "AppleSDGothicNeo-SemiBold") +
  theme(legend.position='right', title=element_text(size=16)) +
  theme(axis.text.x = element_text(size = 15, color="grey3", face="bold"), 
        axis.title=element_text(size=17, color= "grey21", face="bold"),
        plot.title = element_text(hjust = 0.5,size=22, color = "royalblue4", face="bold"),
        legend.title = element_blank(),
        axis.line = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_line(size = 0.1, color = "grey"),
        panel.grid.minor.x = element_line(size = 0.1, color = "grey"),
        plot.background = element_blank())+
  transition_components(연도) +
  enter_fade()

animate(plot = p, nframes = 400,  end_pause = 20, width=720, height=480)
animate


