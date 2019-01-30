# week 4 class code

download.file(url = "https://ndownloader.figshare.com/files/2292169", destfile = "data/portal_data_joined.csv")

surveys <- read.csv(file = "data/portal_data_joined.csv")

# ways to look at large dataframes

head(surveys) # shows data in all columns in top 6 rows
str(surveys)
dim(surveys) # returns a vector with the dimensions of the dataframe
nrows(surveys)
ncol(surveys)
tail(surveys)
names(surveys) # gives you the names of all the variables (columns)
summary(surveys) # will give you summary statistics on all of the columns, can reveal weirdness in the data

# subsetting dataframes (which are 2D)

surveys[1,1] # gives you row,column
head(surveys) # use to verify

surveys[,1] #leaving one of the dimensions blank will return everything in that dimension as a VECTOR
surveys[1] # using asingle number, with no comma, will give us a DATAFRAME with one column
head(surveys[1,]) #VECTOR
head(surveys[1]) #DATAFRAME

class(surveys[1])
class(surveys[,1])
class(surveys[1,]) # this returns data.frame? can rows never be vectors unless you 

surveys[1:3, 6] # 1: 3 creates a vector of numbers 1-3; and you can put vectors to subset larger "slices" of data

# negative sign to exclude indices
surveys[1:5, -1] # returns rows 1-5, all columns except 1

surveys [c(1:5), ] #c() does the same thing, but it helps with syntax, i think 
surveys [-10:15, ] # not a thing (we don't have negative rows)
str(surveys[-c(10:34786),]) # excludes 10 -end


# more ways to subset
surveys["plot_id"] # single column as data.frame
surveys[,"plot_id"] # single column as a vector
surveys[["plot_id"]] # single column as a vector
surveys$plot_id #single column as a vector

# challenge

surveys_200 <- surveys[200,]
nrow(surveys)
surveys_last <- surveys[nrow(surveys),]
tail(surveys)

nrow(surveys)/2
surveys_middle <-surveys[17393,]
surveys[(nrow(surveys)/2),]

surveys[-c(7:nrow(surveys)),]
head(surveys)


# Factors

surveys$sex

# creating our own factor
sex <- factor(c("male", "female", "female", "male"))
sex
class(sex)
typeof(sex)

# levels() gives back a character vector of the levels
levels(sex)
levels(surveys$genus)


# working with dates

library(lubridate)
my_date <- ymd("2015-01-01")
str(my_date)

my_date <- ymd(paste("2015","05", "17", sep = "-"))

paste(surveys$year, surveys$month, surveys$day, sep = "-")

surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

surveys$date[is.na(surveys$date)]
