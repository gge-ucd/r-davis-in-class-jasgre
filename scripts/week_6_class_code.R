# week 6 class notes?

library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

surveys_complete <- surveys %>%
  filter(!is.na(weight),           # remove missing weight
         !is.na(hindfoot_length),  # remove missing hindfoot_length
         !is.na(sex))                # remove missing sex

species_counts <- surveys_complete %>%
  group_by(species_id) %>%
  tally() %>%
  filter(n >= 50)

## Only keep the most common species
surveys_complete <- surveys_complete %>%
  filter(species_id %in% species_counts$species_id)

dim(surveys_complete)

write_csv(surveys_complete, path = "data_output/surveys_complete.csv")

surveys_complete <- read_csv("data_output/surveys_complete.csv")

View(surveys_complete)
group_by(surveys, genus)
group_by(surveys, sex)
surveys %>% 
  group_by(sex) %>% 
  tally()


surveys_complete <- read_csv("data_output/surveys_complete.csv")

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point()


surveys_plot <- ggplot(data = surveys_complete, 
                       mapping = aes(x = weight, y = hindfoot_length))

surveys_plot + 
  geom_point()

#install.packages("hexbin")

library(hexbin)

surveys_plot +
  geom_hex()

surveys_complete %>% 
  ggplot(aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, color = "tomato")

surveys_complete %>% 
  ggplot(aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, aes(color = species_id))

surveys_complete %>% 
  ggplot(aes(x = weight, y = hindfoot_length, color = species_id)) +
  geom_point(alpha = 0.1)

surveys_complete %>% 
  ggplot(aes(x = weight, y = hindfoot_length, color = species_id)) +
  geom_jitter(alpha = 0.1)
