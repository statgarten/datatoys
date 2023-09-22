library(tidyverse)
library(lubridate)

imdependenceMov <- read.csv("독립기념관_독립운동정보_원문정보_20201020.CSV", fileEncoding = "utf-8", header = T)

library(tidytext)
library(ggwordcloud)
library(stringr)
library(ggthemes)

imdependenceMov$내용 <- imdependenceMov$내용 %>%
  str_replace_all("[^가-힣]", " ") %>%
  str_squish()

# mask_png <- png::readPNG("korean-flag-1424985_1280.png")

imdependenceMov %>%
  unnest_tokens(input = 내용, output = word, token = "words") %>%
  count(word, sort = TRUE) %>%
  filter(str_count(word) > 1) %>%
  head(100) %>%
  arrange(-n) %>%
  ggplot(aes(
    label = word,
    size = n,
    col = as.character(n)
  )) +
  geom_text_wordcloud(
    seed = 1234,
    max_steps = 1,
    grid_size = 1,
    eccentricity = .9,
    family = "NanumGothic"
  ) +
  scale_size_area(max_size = 12) +
  theme_minimal()

usethis::use_data(imdependenceMov, overwrite = TRUE)
