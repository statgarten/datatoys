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

usethis::use_data(population, overwrite = TRUE)
d
