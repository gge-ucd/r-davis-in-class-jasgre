# w_5_assignment_JCG.R

library(dplyr)
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

surveys %>% 
  filter(weight > 30) %>%
  filter(weight < 60) %>% summary(surveys)

