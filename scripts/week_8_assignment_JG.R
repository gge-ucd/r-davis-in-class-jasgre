#Week_8_assignment_JG


### Setup --------------------------------------
#install.packages("tidyverse")

#install.packages("colorspace")

library(tidyverse)

library(lubridate)

library(dplyr)


### Part 1 --------------------------------------

#Download a new American River data set using this piece of code (should have a data frame with 35,038 obs of 5 variables):

am_riv <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/2015_NFA_solinst_08_05.csv", skip = 13)

# 1. Make a datetime column by using paste to combine the date and time columns; remember to convert it to a datetime!

am_riv$datetime <- paste(am_riv$Date," ", am_riv$Time, sep = "")

am_riv$datetime <- ymd_hms(am_riv$datetime)

glimpse(am_riv)

# 2. Calculate the weekly mean, max, and min water temperatures and plot as a point plot (all on the same graph)

am_riv2 <- am_riv %>% 
  mutate(Week = week(datetime)) %>%
  group_by(Week) %>% 
  summarize(mean_temp = mean(Temperature), min_temp = min(Temperature), max_temp = max(Temperature)) 

View(am_riv2)

am_riv2 %>% ggplot() +
  geom_point(aes(x = Week, y = mean_temp), size = 3, color = "#1b9e77") +
  geom_point(aes(x = Week, y = min_temp), size = 3, color = "#7570b3") +
  geom_point(aes(x = Week, y = max_temp), size = 3, color = "#d95f02")
  
# 3. Calculate the hourly mean Level for April through June and make a line plot (y axis should be the hourly mean level, x axis should be datetime)

am_riv3 <- am_riv %>% 
  mutate(Month = month(datetime, label = TRUE)) %>% 
  mutate(Hour = hour(datetime)) %>% 
  filter(Month == "Apr" | Month == "May" | Month == "Jun") %>% 
  group_by(Month, Hour) %>% 
  summarize(mean_level = mean(Level))

View(am_riv3)

am_riv3 %>% ggplot() +
  geom_line(aes(x = Hour, y = mean_level, group = Month, color = Month)) +
  theme_bw()

#This isn't what was asked for, but I couldn't conceptualize plotting mean hourly temp on the same plot as the datetime between April and June

### Part 2 ---------------------------------------------------

# Use the mloa_2001 data set (if you don’t have it, download the .rda file from the resources tab on the website). Remeber to remove the NAs (-99 and -999) and to create a datetime column (we did this in class).

load("data/mauna_loa_met_2001_minute.rda")

mloa_2001$datetime <- paste0(mloa_2001$year, "-", mloa_2001$month, "-", mloa_2001$day, " ", mloa_2001$hour24, ":", mloa_2001$min)
  
mloa_2001$datetime<- ymd_hm(mloa_2001$datetime)
  
mloa2 <- mloa_2001 %>% 
    filter(rel_humid != -99, rel_humid != -999) %>% 
    filter(temp_C_2m != -99, temp_C_2m != -999) %>% 
    filter(windSpeed_m_s != -99, windSpeed_m_s != -999, windSpeed_m_s != -99.9)

summary(mloa2)

# write a function called plot_temp that returns a graph of the temp_C_2m for a single month. The x-axis of the graph should be pulled from a datetime column

plot_temp <- function(a, dat = mloa2) {
  df <- filter(dat, month == a)
  plot <- ggplot(df, aes(x = datetime, y = temp_C_2m)) +
    geom_line()
  return(plot)
}

plot_temp(1, dat = mloa2) #test
