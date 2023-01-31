setwd("/Users/seungwoo/Desktop/population_R/")

#preprocessing.R의 dataframe 불러오기
library(readxl)
df_1234 = read_excel("/Users/seungwoo/Desktop/population_R/dataset/alltime_population.xlsx")
population <- data.frame(df_1234)
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
library(viridisLite)
library(gapminder)
library(tidyr)
# install.packages("extrafont")
library(extrafont)
font_import() #저장된 폰트 불러오기 (y 입력)

# Data Visualization Concrete

# 각 연도, 연령별 남녀 인구 히스토그램 (ggplot) -> 연도별 남녀 서울시 연령별 히스토그램 애니메이션(gganimate)

# install.packages("reshape2")
library(reshape2)
library(gganimate)


#서울특별시만을 추출합니다.
seoul_population <- population %>% filter(행정구역별 == "서울특별시")

#시각화에 이용하지않을 총인구와 성비 column 을 삭제합니다.
seoul_population[grep('총인구', colnames(seoul_population))] <- NULL
seoul_population[grep('성비', colnames(seoul_population))] <- NULL

#년도별로, 연령별 남녀 인구수 정보를 포함한 dataframe을 생성합니다.
#colnames()<-"" 를 통해 동일한 변수명으로 바꿔줍니다.
## 비효율적인 코드로 보입니다. ## 리팩토링이 필요합니다.

#1955부터 count

# seoul_1925 <-data.frame(seoul_population[grep('1925', colnames(seoul_population))])
# seoul_1925 <- mutate(seoul_1925, age = seoul_population$연령별) %>% mutate(seoul_1925, year = 1925) 
# colnames(seoul_1925)[c(1,2)] <-c("male" ,"female")
# seoul_1940 <-data.frame(seoul_population[grep('1940', colnames(seoul_population))])
# seoul_1940 <- mutate(seoul_1940, age = seoul_population$연령별) %>% mutate(seoul_1940, year = 1940)
# colnames(seoul_1940)[c(1,2)] <-c("male" ,"female")
# seoul_1944 <-data.frame(seoul_population[grep('1944', colnames(seoul_population))])
# seoul_1944 <- mutate(seoul_1944, age = seoul_population$연령별) %>% mutate(seoul_1944, year = 1944)
# colnames(seoul_1944)[c(1,2)] <-c("male", "female")

seoul_1955 <-data.frame(seoul_population[grep('1955', colnames(seoul_population))])
seoul_1955 <- mutate(seoul_1955, age = seoul_population$연령별) %>% mutate(seoul_1955, year = 1955)
colnames(seoul_1955)[c(1,2)] <-c("male", "female")
seoul_1960 <-data.frame(seoul_population[grep('1960', colnames(seoul_population))])
seoul_1960 <- mutate(seoul_1960, age = seoul_population$연령별) %>% mutate(seoul_1960, year = 1960)
colnames(seoul_1960)[c(1,2)] <-c("male", "female")
seoul_1966 <-data.frame(seoul_population[grep('1966', colnames(seoul_population))])
seoul_1966 <- mutate(seoul_1966, age = seoul_population$연령별) %>% mutate(seoul_1966, year = 1966)
colnames(seoul_1966)[c(1,2)] <-c("male", "female")
seoul_1970 <-data.frame(seoul_population[grep('1970', colnames(seoul_population))])
seoul_1970 <- mutate(seoul_1970, age = seoul_population$연령별) %>% mutate(seoul_1970, year = 1970)
colnames(seoul_1970)[c(1,2)] <-c("male", "female")
seoul_1975 <-data.frame(seoul_population[grep('1975', colnames(seoul_population))])
seoul_1975 <- mutate(seoul_1975, age = seoul_population$연령별) %>% mutate(seoul_1975, year = 1975)
colnames(seoul_1975)[c(1,2)] <-c("male", "female")
seoul_1980 <-data.frame(seoul_population[grep('1980', colnames(seoul_population))])
seoul_1980 <- mutate(seoul_1980, age = seoul_population$연령별) %>% mutate(seoul_1980, year = 1980)
colnames(seoul_1980)[c(1,2)] <-c("male", "female")
seoul_1985 <-data.frame(seoul_population[grep('1985', colnames(seoul_population))])
seoul_1985 <- mutate(seoul_1985, age = seoul_population$연령별) %>% mutate(seoul_1985, year = 1985)
colnames(seoul_1985)[c(1,2)] <-c("male", "female")
seoul_1990 <-data.frame(seoul_population[grep('1990', colnames(seoul_population))])
seoul_1990 <- mutate(seoul_1990, age = seoul_population$연령별) %>% mutate(seoul_1990, year = 1990)
colnames(seoul_1990)[c(1,2)] <-c("male", "female")
seoul_1995 <-data.frame(seoul_population[grep('1995', colnames(seoul_population))])
seoul_1995 <- mutate(seoul_1995, age = seoul_population$연령별) %>% mutate(seoul_1995, year = 1995)
colnames(seoul_1995)[c(1,2)] <-c("male", "female")
seoul_2000 <-data.frame(seoul_population[grep('2000', colnames(seoul_population))])
seoul_2000 <- mutate(seoul_2000, age = seoul_population$연령별) %>% mutate(seoul_2000, year = 2000)
colnames(seoul_2000)[c(1,2)] <-c("male", "female")
seoul_2005 <-data.frame(seoul_population[grep('2005', colnames(seoul_population))])
seoul_2005 <- mutate(seoul_2005, age = seoul_population$연령별) %>% mutate(seoul_2005, year = 2005)
colnames(seoul_2005)[c(1,2)] <-c("male", "female")
seoul_2010 <-data.frame(seoul_population[grep('2010', colnames(seoul_population))])
seoul_2010 <- mutate(seoul_2010, age = seoul_population$연령별) %>% mutate(seoul_2010, year = 2010)
colnames(seoul_2010)[c(1,2)] <-c("male", "female")
seoul_2015 <-data.frame(seoul_population[grep('2015', colnames(seoul_population))])
seoul_2015 <- mutate(seoul_2015, age = seoul_population$연령별) %>% mutate(seoul_2015, year = 2015)
colnames(seoul_2015)[c(1,2)] <-c("male", "female")
seoul_2016 <-data.frame(seoul_population[grep('2016', colnames(seoul_population))])
seoul_2016 <- mutate(seoul_2016, age = seoul_population$연령별) %>% mutate(seoul_2016, year = 2016)
colnames(seoul_2016)[c(1,2)] <-c("male", "female")
seoul_2017 <-data.frame(seoul_population[grep('2017', colnames(seoul_population))])
seoul_2017 <- mutate(seoul_2017, age = seoul_population$연령별) %>% mutate(seoul_2017, year = 2017)
colnames(seoul_2017)[c(1,2)] <-c("male", "female")
seoul_2018 <-data.frame(seoul_population[grep('2018', colnames(seoul_population))])
seoul_2018 <- mutate(seoul_2018, age = seoul_population$연령별) %>% mutate(seoul_2018, year = 2018)
colnames(seoul_2018)[c(1,2)] <-c("male", "female")
seoul_2019 <-data.frame(seoul_population[grep('2019', colnames(seoul_population))])
seoul_2019 <- mutate(seoul_2019, age = seoul_population$연령별) %>% mutate(seoul_2019, year = 2019)
colnames(seoul_2019)[c(1,2)] <-c("male", "female")
seoul_2020 <-data.frame(seoul_population[grep('2020', colnames(seoul_population))])
seoul_2020 <- mutate(seoul_2020, age = seoul_population$연령별) %>% mutate(seoul_2020, year = 2020)
colnames(seoul_2020)[c(1,2)] <-c("male", "female")
seoul_2021 <-data.frame(seoul_population[grep('2021', colnames(seoul_population))])
seoul_2021 <- mutate(seoul_2021, age = seoul_population$연령별) %>% mutate(seoul_2021, year = 2021)
colnames(seoul_2021)[c(1,2)] <-c("male", "female")

seoullist <- mget(paste0('seoul_', c(1955,1960,1966,1970,1975,1980,1985,1990,1995,2000,2005,2010,2015,2016,2017,2018,2019,2020,2021))) #위에서 만든 데이터 프레임의 이름을 mylist에 저장합니다.

#위의 모든 데이터프레임을 seoul_all로 합칩니다.
seoul_all <- Reduce(function(x, y) merge(x, y, all=TRUE), seoullist)

#양방향 피라미드를 만들기위해 남자 인구수를 음수로 바꿉니다.
seoul_all$male <- -1 * seoul_all$male
seoul_all$age <- factor(seoul_all$age)

seoul_all <- seoul_all %>% arrange(year, factor(age, levels=c("0 - 4세", "5 - 9세", "10 - 14세", "15 - 19세", "20 - 24세", "25 - 29세", "30 - 34세", "35 - 39세", "40 - 44세", "45 - 49세", "50 - 54세","55 - 59세", "60 - 64세","65 - 69세", "70 - 74세","75 - 79세", "80 - 84세","85 - 89세", "85세이상", "90 - 94세", "95 - 99세","100세이상", "연령미상"))) 
  
seoul_ani <- seoul_all %>% gather(key='Gender', value='population', male, female)

library(ggplot2)

p <- ggplot(seoul_ani,
       aes(x=factor(age,levels=c("0 - 4세", "5 - 9세", "10 - 14세", "15 - 19세", "20 - 24세", "25 - 29세", "30 - 34세", "35 - 39세", "40 - 44세", "45 - 49세", "50 - 54세","55 - 59세", "60 - 64세","65 - 69세", "70 - 74세","75 - 79세", "80 - 84세","85 - 89세", "85세이상", "90 - 94세", "95 - 99세","100세이상", "연령미상")),
           y=population/10000,
           fill = Gender)) +
  geom_bar(stat='identity') +
  geom_bar(stat='identity', width=0.9, alpha=0.8) +
  scale_y_continuous(name='인구(만명)') +
  coord_flip() +
  labs(title = '서울 인구 구조 변화 ({as.integer(frame_time)}년)',
       x = "") +
  # scale_y_continuous(labels = paste0(as.character(c(seq(2, 0, -1), seq(1, 2, 1))), "m")) +
  scale_fill_manual(values = c("male" = "skyblue","female"="hotpink"),
                    labels = c("male" = "남자", "female"= "여자"),
                    breaks = c("male","female"))+
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
  transition_components(year) +
  enter_fade()

animate(plot = p, nframes = 400,  end_pause = 20, width=720, height=480)

anim_save(filename = "/Users/seungwoo/Desktop/population_R/visualization/seoul_populationpyramid.gif",
          animation = p,
          nframes = 400, end_pause = 20,
          width = 1080, height = 720,
          renderer = gifski_renderer(loop = FALSE))



install.packages('gifski')


