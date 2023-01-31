# install.packages("tidyverse")
# install.packages('gganimate')
# install.packages("readxl")
# install.packages("ggplot2")

library(ggplot2)
library(gganimate)
library(readxl)
library(tidyverse)

population <- readxl::read_excel("alltime_population.xlsx")

population <- population %>% 
  pivot_longer(cols = 3:90, values_to = "인구수") %>% 
  separate(name, sep = " ", into = c("연도", "분류")) %>% 
  mutate(
    연도 = parse_number(연도)
  ) %>% 
  filter(분류 %in% c("남자인구(명)", "여자인구(명)")) %>% 
  mutate(
    분류 = stringr::str_sub(분류, 1, 2)
  ) 

population <- subset(population, 행정구역별 != "황해도" & 행정구역별 != "평안북도" & 행정구역별 != "함경북도" & 행정구역별 != "함경남도" & 행정구역별 != "함경북도")

population[population$행정구역별 == "서울특별시", "행정구역별"] = "서울"
population[population$행정구역별 == "부산광역시", "행정구역별"] = "부산"
population[population$행정구역별 == "충청북도", "행정구역별"] = "충북"
population[population$행정구역별 == "충청남도", "행정구역별"] = "충남"
population[population$행정구역별 == "전라북도", "행정구역별"] = "전북"
population[population$행정구역별 == "전라남도", "행정구역별"] = "전남"
population[population$행정구역별 == "경상북도", "행정구역별"] = "경북"
population[population$행정구역별 == "경상남도", "행정구역별"] = "경남"
population[population$행정구역별 == "대구광역시", "행정구역별"] = "대구"
population[population$행정구역별 == "광주광역시", "행정구역별"] = "광주"
population[population$행정구역별 == "대전광역시", "행정구역별"] = "대전"
population[population$행정구역별 == "울산광역시", "행정구역별"] = "울산"
population[population$행정구역별 == "인천광역시", "행정구역별"] = "인천"
population[population$행정구역별 == "경기도", "행정구역별"] = "경기"
population[population$행정구역별 == "강원도", "행정구역별"] = "강원"
population[population$행정구역별 == "제주도", "행정구역별"] = "제주"
population[population$행정구역별 == "세종특별자치시", "행정구역별"] = "세종"

population <- population %>% 
  mutate(
    행정구역별 = ifelse(행정구역별 == "제주특별자치도", "제주", 행정구역별)
  ) %>% 
  group_by(행정구역별, 연도) %>% 
  summarise(
    인구수 = sum(인구수, na.rm = TRUE)
  ) %>% 
  mutate(
    인구수_10000 = round(인구수/10000)
  ) %>% 
  ungroup() %>% 
  group_by(연도) %>% 
  arrange(연도, desc(인구수)) %>% 
  mutate(
    rank = row_number(),
    Value_lbl = paste0(" ",인구수_10000)
  ) %>%
  ungroup() -> population

area_palette <- c('경남' = '#FF65AE',
                  '경북' = '#FF65AE',
                  '대구' = '#F763E0',
                  '울산' = 'maroon',
                  '부산' = 'lightpink1',
                  '전남' = 'wheat',
                  '전북' = 'wheat',
                  '광주' = 'tan',
                  '경기' = 'lightblue2',
                  '서울' = 'steelblue1',
                  '인천' ='turquoise',
                  '충남' = 'gold',
                  '충북' = 'gold',
                  '대전' = 'yellow2',
                  '세종' = 'goldenrod2',
                  '강원' = 'seagreen3',
                  '제주' = 'darkgrey')


total_population <-
  ggplot(population, aes(rank, group=행정구역별))+
  geom_tile(aes(y=인구수_10000/2,
                height= 인구수_10000,
                width = 0.9, fill=행정구역별), alpha = 0.8) +
  theme_minimal(base_family = "AppleSDGothicNeo-SemiBold")+
  geom_text(aes(y=0, label=paste(행정구역별, " ")), vjust=0.2, hjust=1,size=5, family = "AppleSDGothicNeo-SemiBold")+
  geom_text(aes(y=인구수_10000, label=Value_lbl, hjust=0))+
  theme(axis.text.x = element_text(size = 15, color="grey3", face="bold"), 
        axis.title=element_text(size=17, color= "grey21", face="bold"),
        legend.position="none",
        plot.title = element_text(hjust = 0.5,size=22, color = "royalblue4", face="bold"),
        axis.line = element_blank(),
        axis.text.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_line(size = 0.1, color = "grey"),
        panel.grid.minor.x = element_line(size = 0.1, color = "grey"),
        plot.background = element_blank()
        )+ 
  transition_states(연도,
                    transition_length=40,
                    state_length=10)+ 
  scale_y_continuous(breaks=seq(0,1500,250), labels = scales::comma)+ 
  scale_x_reverse()+
  scale_fill_manual(values=area_palette)+
  labs(
    title = '{closest_state}년 대한민국 지역별 인구수',
    subtitle = "1925-2021년",
    caption = "KOSTAT; 인구총조사(통계청)",
    x = "",
    y = "지역별 총 인구(만명)"
  ) +
  coord_flip() + 
  ease_aes('quartic-in-out') +
  enter_fade()

total_population <-animate(plot=total_population, nframes=400, end_pause = 20, width=1080, height=720)
total_population

 # 영상 저장

#install.packages('av')

anim_save(filename = "/Users/seungwoo/Desktop/population_R/visualization/total_population_onecolor.gif",
          animation = total_population,
          nframes = 200, end_pause = 20,
          width = 1080, height = 720,
          renderer = gifski_renderer(loop = FALSE))