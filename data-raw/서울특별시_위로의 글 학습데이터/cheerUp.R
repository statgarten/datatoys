library(tidyverse)
library(lubridate)

df <- readxl::read_excel("위로글.xlsx")
colnames(df) <- c("상황", "위로글내용", "url", "제목", "해시태그")
cheerUp <- df %>% select(1:3)

library(tidytext)
library(ggwordcloud)

cheerUp %>%
  unnest_tokens(input = 위로글내용, output = word, token = "words") %>%
  count(word, sort = TRUE) %>%
  filter(nchar(word) > 1) %>%
  head(100) %>%
  ggplot(aes(label = word, size = n)) +
  geom_text_wordcloud(seed = 811, family = "NanumGothic")

usethis::use_data(cheerUp, overwrite = TRUE)
