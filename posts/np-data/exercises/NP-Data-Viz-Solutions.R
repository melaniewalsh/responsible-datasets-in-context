# National Park Data Viz

# Visualizing National Park visitation data with ggplot

# Load the data
np_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/1979-2022-National-Park-Visits-By-State.csv", stringsAsFactors = FALSE)

# Load libraries
library("dplyr")
library("stringr")
library("ggplot2")

# How have visits to a particular National Park changed over time?

# Exercise 1: First, filter the dataframe for the park of your choice

my_parks_df <- np_data %>% filter(str_detect(ParkName, "Rainier"))

# Exercise 2: Now, make a line plot that shows the number of visits per year to that park from 1979 to 2022
# Choose a color for the line
# Give the plot a title that also functions as a kind of "headline" for the most interesting story of the plot

# When you're done, drop the plot into our Discord server!

ggplot(data = my_parks_df) + 
  geom_line(aes(x = Year, y = RecreationVisits ), color = "purple") + labs(title = "More People Are Visiting Mt. Rainier NP Than Ever Before")

