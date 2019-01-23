#week_3_class_code

read.csv("data/tidy.csv")

x <- 4 # a vector of 1

# vectors

weight_g <- c(50, 60, 31, 89)  # "c" for "concatenate"
weight_g

# now charcters

animals <- c("mouse", "cat", "dog", "rat") #commas outside of quotes. quotes around characters
animals


# vector exploration tools

length(weight_g) # tells you how many entries there are...
class(weight_g) #tells you what kind of data is in your vector
str(weight_g) # tells you about the structure of the data

mixed_vector <- c(50, "cat")
mixed_vector
class(mixed_vector)

weight_g <- c(weight_g, 105, 146) # adds to the end of the vector
weight_g

weight_g <- c(25, weight_g) # adds to the beginning of the vector
weight_g


# 6 types of atomic vectors: "numeric" ("double"), "character", "logical", "integer", "complex", "raw"
# first 4 listed are the main ones we'll work with

typeof(weight_g)


# challenge - coersion in R

num_char <- c(1, 2, 3, "a")
num_char
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
char_logical
tricky <- c(1, 2, 3, "4")

num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)
combined_logical


# subsetting vectors - how to pull out values from a vector

# square-bracket subsetting
animals[3]
animals[c(2, 3)]
animals[c(1,3,1)]


# conditional subsetting
weight_g
weight_g[c(T, F, T, T, F, T, T)]
weight_g > 60 # returns vector of logical arguments for each vector element
weight_g[c(F, F, F, F, T, T, T)]
weight_g[weight_g > 60]

# multiple conditions
weight_g[weight_g < 30 | weight_g >50] # | is "OR"
weight_g[weight_g >= 30 & weight_g == 90] # will return "numeric(0)" meaning there's nothing in the vector that meets all the conditions

weight_g[weight_g >= 30 & weight_g == 89] #this will work

# searching for characters
animals_2 <- c("rat", "antelope", "jackalope")
animals %in% animals_2
animals[animals %in% animals_2]

# charcters are sorted into alphabetical order
"eight" > "five"
"a" > "b"
"z" >"y"


# missing values

heights <- c(2, 4, 4, NA, 6)
str(heights)
mean(weight_g) # returns a numeric value
mean(heights) # returns NA
max(heights)
mean(x = heights, na.rm = T) #na.rm will strip NA values before doing the computation
max(heights, na.rm=T) 

is.na(heights) #tells you whether each vector type is NA
na.omit(heights)
complete.cases(heights)
