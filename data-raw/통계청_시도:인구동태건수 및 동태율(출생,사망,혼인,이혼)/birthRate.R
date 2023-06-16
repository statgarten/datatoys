library(tidyverse)

getwd()
setwd("/Users/youngjunna/Library/Mobile Documents/com~apple~CloudDocs/Github/datatoys/data-raw/통계청_인구통계")
birthRate <- readxl::read_excel("birthRate.xlsx")


birthRate <- birthRate %>% janitor::clean_names(ascii = FALSE) #clean names
birthRate[birthRate == "-"] <- NA #"-" into NA
birthRate <- birthRate %>% mutate_at(vars(시점:조이혼율_천명당), as.numeric) #chr to num

birthRate %>% group_by(시점) %>% summarise(출생 = sum(출생건수_명, na.rm = TRUE)) %>% mutate(출생 = round(출생/10000, 1)) %>% 
  ggplot(aes(시점, 출생)) + geom_line() + geom_point() + ggrepel::geom_text_repel(aes(label = 출생), vjust = -0.5) + theme_bw(base_family = "NanumGothic") +
  scale_x_continuous(breaks = seq(1990, 2024, by = 5)) + labs(title = "연도별 출생아수", subtitle = "1990-2022년", x = "", y = "출생아수(만명)")

usethis::use_data(birthRate, overwrite = TRUE)
