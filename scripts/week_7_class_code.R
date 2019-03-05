# week_7_class_code

install.packages("cowplot")
library(ggplot2)
library(tidyverse)
library(cowplot)

# how to install a package from GitHub

install.packages("devtools")

library(devtools)
devtools::install_github("thomasp85/patchwork")


wide_data <- read_csv("data/wide_eg.csv", skip = 2)
wide_data

load("data/mauna_loa_met_2001_minute.rda") 

saveRDS(wide_data, "data/wide_data.rds")
rm(wide_data) # removes file from the environment (not from the directory)

wide_data_rds <- readRDS("data/wide_data.rds")
wide_data_rds

install.packages("rio")
library(rio)


### Lubridating - date and time data

library(lubridate)

sample_dates1 <- c("2016-02-01", "2016-03-17", "2017-01-01")
as.Date(sample_dates1) # functiona looking for dates that looks like YYYY MM DD

as.Date(sample_dates1, format = "%m-%d-%Y") #specifies the date format; capital Y for year with 4 digits, lowercase y for year with 2 digits

# Challenge

dt1 <- as.Date("2017-07-11")
dt2 <- as.Date("2016-04-22")

print(dt1-dt2)

dt1-dt2
difftime(dt1,dt2, units ="week")

six_weeks <- seq(dt1, length = 6, by = "week")
six_weeks

# Challenge - 10 dates, starting at dt1, every 2 weeks

ten_dates <- seq(dt1, length = 10, by = 14)
ten_dates

object <- ymd("2016/01/01") #ymd is a function within lubridate
class(object)
