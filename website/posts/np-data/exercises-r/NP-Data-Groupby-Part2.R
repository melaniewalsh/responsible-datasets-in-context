# NP Data Groupby — Part 2

# Load the data
np_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/1979-2022-National-Park-Visits-By-State.csv", stringsAsFactors = FALSE)

# Load dplyr library
library("dplyr")

# Exercise 1: How many rows and columns are in the NP dataset?


# Exercise 2: How has the total number of visits to National Parks changed over time (from 1979-2022)?

# Make a dataframe of total visits per year and name the new column "total_visits"
# Save the dataframe as visits_per_year

visits_per_year <- 

# For fun, let's plot total NP visits over time

# Turn off scientific notation
options(scipen = 999)

# This plot code has been filled in for you
plot(# x axis
  x = visits_per_year$Year,
  # y axis
  y = visits_per_year$total_visits, 
  # Define type of plot - b is both line and scatter
  type = 'b',
  # main title
  main = 'NP Visits',
  # x and y labels
  xlab = 'Year', ylab = 'Visits')

# Exercise 3: What is the National Park(s) with the MOST visits in a single year?
# Save as a dataframe max_visits
# Hint: You will want to filter for the row(s) with the max number of visits
max_visits <- 

# Exercise 4: What is the National Park(s) with the LEAST visits in a single year?
# Save as a dataframe min_visits
# Hint: You will want to filter for the row with the min number of visits
min_visits <- 

