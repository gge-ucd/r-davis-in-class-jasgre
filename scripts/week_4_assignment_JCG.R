# week_4_assignment_JCG

surveys <- read.csv("data/portal_data_joined.csv")


surveys_subset <- surveys[-c(401:nrow(surveys)), c(1, 5:8)] # subset, first 400 rows and columns 1, 5 through 8

head(surveys_subset) # to check if it has the columns I want

tail(surveys_subset) # to check that it only has 400 rows


surveys_long_feet <- na.omit(surveys[(surveys$hindfoot_length) > 32, ]) #should return only rows where hindfoot_length is greater than 32 and without NAs

head(surveys_long_feet) # to check if it looks right

hist(surveys_long_feet$hindfoot_length)

as.character(surveys_long_feet$hindfoot_length)

hist(as.character(surveys_long_feet$hindfoot_length))

