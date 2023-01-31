#preprocessing.R의 dataframe 불러오기
library(readxl)
df_1234 = read_excel("alltime_population.xlsx")

# 북한 지역 제거
df_1234 <- df_1234[!(df_1234$행정구역별 =="황해도"),]
df_1234 <- df_1234[!(df_1234$행정구역별 =="평안북도"), ]
df_1234 <- df_1234[!(df_1234$행정구역별 =="평안남도"), ]
df_1234 <- df_1234[!(df_1234$행정구역별 =="함경북도"), ]
df_1234 <- df_1234[!(df_1234$행정구역별 =="함경남도"), ]

# 지역명 간소화
df_1234[df_1234$행정구역별 == "서울특별시", "행정구역별"] = "서울"
df_1234[df_1234$행정구역별 == "부산광역시", "행정구역별"] = "부산"
df_1234[df_1234$행정구역별 == "충청북도", "행정구역별"] = "충북"
df_1234[df_1234$행정구역별 == "충청남도", "행정구역별"] = "충남"
df_1234[df_1234$행정구역별 == "전라북도", "행정구역별"] = "전북"
df_1234[df_1234$행정구역별 == "전라남도", "행정구역별"] = "전남"
df_1234[df_1234$행정구역별 == "경상북도", "행정구역별"] = "경북"
df_1234[df_1234$행정구역별 == "경상남도", "행정구역별"] = "경남"
df_1234[df_1234$행정구역별 == "대구광역시", "행정구역별"] = "대구"
df_1234[df_1234$행정구역별 == "광주광역시", "행정구역별"] = "광주"
df_1234[df_1234$행정구역별 == "대전광역시", "행정구역별"] = "대전"
df_1234[df_1234$행정구역별 == "울산광역시", "행정구역별"] = "울산"
df_1234[df_1234$행정구역별 == "인천광역시", "행정구역별"] = "인천"
df_1234[df_1234$행정구역별 == "세종특별자치시", "행정구역별"] = "세종"
df_1234[df_1234$행정구역별 == "경기도", "행정구역별"] = "경기"
df_1234[df_1234$행정구역별 == "강원도", "행정구역별"] = "강원"


# Data Visualization
# install.packages("tidyverse")
# install.packages("nord")
# install.packages("viridis")
# install.packages("gapminder")
# install.packages('gganimate')
# install.packages('gifski')
# install.packages('png')

library(ggplot2)
library(tidyverse)
library(gganimate)
library(nord)
library(viridis)
library(gapminder)

# install.packages("extrafont")
library(extrafont)
font_import() #저장된 폰트 불러오기 (y 입력)

# Data Visualization Concrete

# 각 연도, 행정구역별 총인구 히스토그램 (ggplot) -> 연도별 행정구역 총인구 히스토그램 애니메이션(gganimate)
# 각 연도, 행정구역, 연령별 인구 히스토그램(ggplot) -> 모든 행정구역별 히스토그램 -> 연도별 행정구역, 연령별 인구 히스토그램 애니메이션(gganimate)

# install.packages("reshape2")
library(reshape2)
library(gganimate)


# --------------------------------------------------수정 전 코드--------------------------------------------------

  
  
  
  
  
  
  
  
#연도별로 행정구역별 인구를 합칩니다. NA값은 제외하여 합계를 구합니다(na.rm=TRUE). 
#제주특별자치도와 제주도를 합친 제주를 만듭니다.
## 비효율적인 코드로 보입니다. ## 리팩토링이 필요합니다.
# total_1925 = data.frame(population = tapply(df_1234$`1925년 총인구(명)`, df_1234$행정구역별,sum, na.rm=TRUE))
# total_1925 <- mutate(total_1925, year = 1925) %>% 
#   mutate(total_1925, area = rownames(total_1925))
# jeju1925<- data.frame(population = total_1925['제주도','population'] + total_1925['제주특별자치도','population'], year = 1925, area = "제주", row.names= "제주")
# total_1925 <- rbind(total_1925, jeju1925)
# total_1940 = data.frame(population =tapply(df_1234$`1940년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_1940 <- mutate(total_1940, year = 1940)  %>% 
#   mutate(total_1940, area = rownames(total_1940))
# jeju1940<- data.frame(population = total_1940['제주도','population'] + total_1940['제주특별자치도','population'], year = 1940, area = "제주", row.names= "제주")
# total_1940 <- rbind(total_1940, jeju1940)
# total_1944 = data.frame(population =tapply(df_1234$`1944년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_1944 <- mutate(total_1944, year = 1944) %>% 
#   mutate(total_1944, area = rownames(total_1944))
# jeju1944<- data.frame(population = total_1944['제주도','population'] + total_1944['제주특별자치도','population'], year = 1944, area = "제주", row.names= "제주")
# total_1944 <- rbind(total_1944, jeju1944)
# total_1955 = data.frame(population =tapply(df_1234$`1955년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_1955 <- mutate(total_1955, year = 1955) %>% 
#   mutate(total_1955, area = rownames(total_1955))
# jeju1955<- data.frame(population = total_1955['제주도','population'] + total_1955['제주특별자치도','population'], year = 1955, area = "제주", row.names= "제주")
# total_1955 <- rbind(total_1955, jeju1955)
# total_1960 = data.frame(population =tapply(df_1234$`1960년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_1960 <- mutate(total_1960, year = 1960) %>% 
#   mutate(total_1960, area = rownames(total_1960))
# jeju1960<- data.frame(population = total_1960['제주도','population'] + total_1960['제주특별자치도','population'], year = 1960, area = "제주", row.names= "제주")
# total_1960 <- rbind(total_1960, jeju1960)
# total_1966 = data.frame(population =tapply(df_1234$`1966년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_1966 <- mutate(total_1966, year = 1966) %>% 
#   mutate(total_1966, area = rownames(total_1966))
# jeju1966 <- data.frame(population = total_1966['제주도','population'] + total_1966['제주특별자치도','population'], year = 1966, area = "제주", row.names= "제주")
# total_1966 <- rbind(total_1966, jeju1966)
# total_1970 = data.frame(population =tapply(df_1234$`1970년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_1970 <- mutate(total_1970, year = 1970) %>% 
#   mutate(total_1970, area = rownames(total_1970))
# jeju1970<- data.frame(population = total_1970['제주도','population'] + total_1970['제주특별자치도','population'], year = 1970, area = "제주", row.names= "제주")
# total_1970 <- rbind(total_1970, jeju1970)
# total_1975 = data.frame(population =tapply(df_1234$`1975년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_1975 <- mutate(total_1975, year = 1975) %>% 
#   mutate(total_1975, area = rownames(total_1975))
# jeju1975<- data.frame(population = total_1975['제주도','population'] + total_1975['제주특별자치도','population'], year = 1975, area = "제주", row.names= "제주")
# total_1975 <- rbind(total_1975, jeju1975)
# total_1980 = data.frame(population =tapply(df_1234$`1980년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_1980 <- mutate(total_1980, year = 1980) %>% 
#   mutate(total_1980, area = rownames(total_1980))
# jeju1980<- data.frame(population = total_1980['제주도','population'] + total_1980['제주특별자치도','population'], year = 1980, area = "제주", row.names= "제주")
# total_1980 <- rbind(total_1980, jeju1980)
# total_1985 = data.frame(population =tapply(df_1234$`1985년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_1985 <- mutate(total_1985, year = 1985) %>% 
#   mutate(total_1985, area = rownames(total_1985))
# jeju1985<- data.frame(population = total_1985['제주도','population'] + total_1985['제주특별자치도','population'], year = 1985, area = "제주", row.names= "제주")
# total_1985 <- rbind(total_1985, jeju1985)
# total_1990 = data.frame(population =tapply(df_1234$`1990년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_1990 <- mutate(total_1990, year = 1990) %>% 
#   mutate(total_1990, area = rownames(total_1990))
# jeju1990<- data.frame(population = total_1990['제주도','population'] + total_1990['제주특별자치도','population'], year = 1990, area = "제주", row.names= "제주")
# total_1990 <- rbind(total_1990, jeju1990)
# total_1995 = data.frame(population =tapply(df_1234$`1995년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_1995 <- mutate(total_1995, year = 1995) %>% 
#   mutate(total_1995, area = rownames(total_1995))
# jeju1995<- data.frame(population = total_1995['제주도','population'] + total_1995['제주특별자치도','population'], year = 1995, area = "제주", row.names= "제주")
# total_1995 <- rbind(total_1995, jeju1995)
# total_2000 = data.frame(population =tapply(df_1234$`2000년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_2000 <- mutate(total_2000, year = 2000) %>% 
#   mutate(total_2000, area = rownames(total_2000))
# jeju2000<- data.frame(population = total_2000['제주도','population'] + total_2000['제주특별자치도','population'], year = 2000, area = "제주", row.names= "제주")
# total_2000 <- rbind(total_2000, jeju2000)
# total_2005 = data.frame(population =tapply(df_1234$`2005년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_2005 <- mutate(total_2005, year = 2005) %>% 
#   mutate(total_2005, area = rownames(total_2005))
# jeju2005<- data.frame(population = total_2005['제주도','population'] + total_2005['제주특별자치도','population'], year = 2005, area = "제주", row.names= "제주")
# total_2005 <- rbind(total_2005, jeju2005)
# total_2010 = data.frame(population =tapply(df_1234$`2010년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_2010 <- mutate(total_2010, year = 2010) %>% 
#   mutate(total_2010, area = rownames(total_2010))
# jeju2010<- data.frame(population = total_2010['제주도','population'] + total_2010['제주특별자치도','population'], year = 2010, area = "제주", row.names= "제주")
# total_2010 <- rbind(total_2010, jeju2010)
# total_2015 = data.frame(population =tapply(df_1234$`2015년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_2015 <- mutate(total_2015, year = 2015) %>% 
#   mutate(total_2015, area = rownames(total_2015))
# jeju2015<- data.frame(population = total_2015['제주도','population'] + total_2015['제주특별자치도','population'], year = 2015, area = "제주", row.names= "제주")
# total_2015 <- rbind(total_2015, jeju2015)
# total_2016 = data.frame(population =tapply(df_1234$`2016년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_2016 <- mutate(total_2016, year = 2016) %>% 
#   mutate(total_2016, area = rownames(total_2016))
# jeju2016<- data.frame(population = total_2016['제주도','population'] + total_2016['제주특별자치도','population'], year = 2016, area = "제주", row.names= "제주")
# total_2016 <- rbind(total_2016, jeju2016)
# total_2017 = data.frame(population =tapply(df_1234$`2017년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_2017 <- mutate(total_2017, year = 2017) %>% 
#   mutate(total_2017, area = rownames(total_2017))
# jeju2017<- data.frame(population = total_2017['제주도','population'] + total_2017['제주특별자치도','population'], year = 2017, area = "제주", row.names= "제주")
# total_2017 <- rbind(total_2017, jeju2017)
# total_2018 = data.frame(population =tapply(df_1234$`2018년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_2018 <- mutate(total_2018, year = 2018) %>% 
#   mutate(total_2018, area = rownames(total_2018))
# jeju2018<- data.frame(population = total_2018['제주도','population'] + total_2018['제주특별자치도','population'], year = 2018, area = "제주", row.names= "제주")
# total_2018 <- rbind(total_2018, jeju2018)
# total_2019 = data.frame(population =tapply(df_1234$`2019년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_2019 <- mutate(total_2019, year = 2019) %>% 
#   mutate(total_2019, area = rownames(total_2019))
# jeju2019 <- data.frame(population = total_2019['제주도','population'] + total_2019['제주특별자치도','population'], year = 2019, area = "제주", row.names= "제주")
# total_2019 <- rbind(total_2019, jeju2019)
# total_2020 = data.frame(population =tapply(df_1234$`2020년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_2020 <- mutate(total_2020, year = 2020) %>%
#   mutate(total_2020, area = rownames(total_2020))
# jeju2020 <- data.frame(population = total_2020['제주도','population'] + total_2020['제주특별자치도','population'], year = 2020, area = "제주", row.names= "제주")
# total_2020 <- rbind(total_2020, jeju2020)
# total_2021 = data.frame(population =tapply(df_1234$`2021년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
# total_2021 <- mutate(total_2021, year = 2021) %>%
#   mutate(total_2021, area = rownames(total_2021))
# jeju2021<- data.frame(population = total_2021['제주도','population'] + total_2021['제주특별자치도','population'], year = 2021, area = "제주", row.names= "제주")
# total_2021 <- rbind(total_2021, jeju2021)
# View(total_2021)
# 
# #위에서 만든 dataframe을 모두 하나로 합칩니다.
# mylist <- mget(paste0('total_', c(1925,1940,1944,1955,1960,1966,1970,1975,1980,1985,1990,1995,2000,2005,2010,2015,2016,2017,2018,2019,2020,2021))) #위에서 만든 데이터 프레임의 이름을 mylist에 저장합니다.

# total_all <- Reduce(function(x, y) merge(x, y, all=TRUE), mylist) #위의 모든 dataframe을 total_all로 merge합니다.
# 
# #제주도와 제주특별자치도 행 제거 (제주로 통합)
# total_all <- total_all[!(total_all$area =="제주도"),]
# total_all <- total_all[!(total_all$area =="제주특별자치도"), ]
# 
# #인구수 만명 단위로 표현
# total_all <- mutate(total_all, population_10000 = round(total_all$population/10000))
# ranked_by_year<- total_all %>% 
#   group_by(year) %>% 
#   arrange(year, -population_10000) %>% 
#   mutate(rank= 1:n(),
#          Value_rel = population_10000/population_10000[rank==1],
#          Value_lbl = paste0(" ",population_10000)) %>% 
#   group_by(area) %>% 
#   ungroup()



# --------------------------------------------------수정 후 코드--------------------------------------------------

#통계에 집계된 년도를 모은 list 생성

yearList <- c(1925,1940,1944,1955,1960,1966,1970,1975,1980,1985,1990,1995,2000,2005,2010,2015,2016,2017,2018,2019,2020,2021)


#빈 데이터 프레임 생성
df <- data.frame(stringsAsFactors=default.stringsAsFactors())

# 위의 코드를 반복문을 통해 작성, 빈 데이터프레임에 행 추가를 반복하는 방식,
# 제주도와 제주 특별자치도로 나눠져있으므로 이를 '제주'로 합침

for (i in yearList){
  yearTotalPopulation <- c(i,"년 총인구(명)")
  yearPopulation <- paste0(yearTotalPopulation, collapse = '')
  # test <- df_1234[yearPopulation][,]
  temp <- data.frame(population = tapply(df_1234[[yearPopulation]], df_1234$행정구역별, sum, na.rm=TRUE)) 
  temp <- mutate(temp, area = rownames(temp)) %>% mutate(temp, year = i)
  jejuYear <- data.frame(population = temp['제주도','population'] + temp['제주특별자치도', 'population'], year = i, area = "제주")
  temp <- rbind(temp, jejuYear)
  df <- rbind(df, temp)
}

head(df)
datatoys::population %>% 
  mutate(
    행정구역별 = ifelse(행정구역별 == "제주특별자치도", "제주도", 행정구역별)
  ) %>% 
  group_by(행정구역별, 연도) %>% 
  summarise(
    인구수 = sum(인구수, na.rm = TRUE)
  ) %>% 
  mutate(
    인구수_10000 = 인구수/10000
  ) %>% 
  ungroup() %>% 
  group_by(연도) %>% 
  arrange(연도, desc(인구수)) %>% 
  mutate(
    rank = row_number()
  ) %>%
  ungroup()
 
#'제주'로 합쳤으니 '제주도'와 '제주특별자치도' data 삭제
df <- df[!(df$area =="제주도"),]
df <- df[!(df$area =="제주특별자치도"), ]
#인구수 만명 단위로 표현
df <- mutate(df, population_10000 = round(df$population/10000))

#순서를 바꿀 수 있도록 rank column 생성한 ranked_by_year dataframe 생성

ranked_by_year<- df %>% 
  group_by(year) %>% 
  arrange(year, -population_10000) %>% 
  mutate(rank= 1:n(),
         Value_lbl = paste0(" ",population_10000)) %>% 
  group_by(area) %>% 
  ungroup()
View(ranked_by_year)

#ggplot, gganimate를 통한 데이터시각화
#년도에 따라, 지역별 인구수를 시각화합니다.

#devtools::install_github("ellisp/ggflags")
# install.packages("magick")
# install.packages("magrittr")
# install.packages("purrr")
# install.packages("tidyr")
library(ggflags)
library(magick)
library(gifski)
library(dplyr)
library(magrittr)
library(grid)

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
  ggplot(ranked_by_year, aes(rank, group=area))+
  geom_tile(aes(y=population_10000/2,
                height= population_10000,
                width = 0.9, fill=area), alpha = 0.8) +
  theme_minimal(base_family = "AppleSDGothicNeo-SemiBold")+
  geom_text(aes(y=0, label=paste(area, " ")), vjust=0.2, hjust=1,size=5, family = "AppleSDGothicNeo-SemiBold")+ #hist bar위의 숫자를 표시합니다
  geom_text(aes(y=population_10000, label=Value_lbl, hjust=0))+
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
  transition_states(year,
                    transition_length=40, #총 시간
                    state_length=10)+ #각 년도별 시간
  scale_y_continuous(breaks=seq(0,1500,250), labels = scales::comma)+ #축 눈금이 지수형이 아닌 1,000,000식으로 표시합니다.
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




#원하는 크기와 frame으로 total_population을 설정합니다.
#시각화가 끝난후 20frame 기다렸다가 다시 재생합니다.

total_population <-animate(plot=total_population, nframes=400, end_pause = 20, width=1080, height=720)
total_population
 # 영상 저장
#install.packages('av')

anim_save(filename = "/Users/seungwoo/Desktop/population_R/visualization/total_population_onecolor.gif",
          animation = total_population,
          nframes = 200, end_pause = 20,
          width = 1080, height = 720,
          renderer = gifski_renderer(loop = FALSE))










