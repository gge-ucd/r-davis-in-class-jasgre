# week 5 class code

#install.packages("tidyverse")

library(tidyverse)
library(dplyr)

surveys <- read_csv("data/portal_data_joined.csv")

str(surveys)

# select - command used to select columns in a data.frame

select(surveys, plot_id, species_id, weight)

# filter - command used to filter rows

filter(surveys, year == 1995)


surveys2 <- filter(surveys, weight < 5)
surveyssml <- select(surveys2, species_id, weight, sex) # columns will print in order you listed them
survyessml

# Pipes %>% 

surveys %>% 
  filter(weight < 5) %>% 
  select(species_id, sex, weight)


#Challenge

surveys %>%
  select(year, sex, weight) %>% 
  filter(year < 1995)



#mutate - used to create new columns

surveys <- surveys %>%
  mutate(weight_kg = weight/1000) %>% 
  mutate(weight_kg2 = weight_kg*2)

surveys

surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_kg = weight/1000) %>% 
  summary() #to check, NA's would be listed at the bottom of your column. you could specify the dataframe in the summary function, but it's redundant

# Challenge

#Create a new data frame from the surveys data that meets the following criteria: contains only the  species_id column and a new column called hindfoot_half containing values that are half the  hindfoot_length values. In this hindfoot_half column, there are no NAs and all values are less than 30.


surveys %>% 
  mutate(hindfoot_half = hindfoot_length/2) %>% 
  filter(!is.na(hindfoot_half)) %>% 
  filter(hindfoot_half < 30) %>% 
  select(species_id, hindfoot_half) %>% 
  summary()


#group_by - command which is used in "split-apply-combine" paradigm

surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight, na.rm = T)) #spits out a new data.frame

surveys %>%
  group_by(species) %>% 
  filter(is.na(sex)) %>% 
  tally()


# using group_by, summarize [any function in tidyverse?] with multiple columns, 

surveys %>%
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight)) %>% #makes a new tibble with this calculation
  View

surveys %>%
  group_by(sex) %>% 
  tally() %>% 
  View


# Gathering and spreading

#spread (data, key, value)

surveys_gw <- surveys %>%
  filter(!is.na(weight)) %>% 
  group_by (genus, plot_id) %>% 
  summarize(mean_weight = mean(weight))

surveys_spread <- surveys_gw %>%
  spread(genus, mean_weight)

surveys_spread
