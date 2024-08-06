# National Park Data Viz — Customization Practice

# More practice visualizing National Park visitation data with ggplot

# Load the data
np_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/1979-2022-National-Park-Visits-By-State.csv", stringsAsFactors = FALSE)

# Load libraries
library("dplyr")
library("stringr")
library("ggplot2")

# How have visits to a particular National Park changed over time?
# What is the most interesting period of change?

# Exercise 1: First, filter the dataframe for a park of your choice
# Pick a National Park that you haven't worked with yet

my_parks_df <- Your code here

# Exercise 2: Now, make a line plot that shows the number of visits per year to that park from 1979 to 2022
# 2a. Choose a color for the line
# 2b. Give the plot a title that also functions as a kind of "headline" for the most interesting story of the plot
# 2c. Change the x-axis ticks so that they increase 5 years at a time
# 2d. Change the y-axis tick labels so that they abbreviate millions to M and thousands to K

# When you're finished, drop this plot into the Discord server in the channel #np-data-viz!

Your code here


# Exercise 3: Now, create a plot that zooms in on the most interesting time period for this particular National Park
# 3a. Change the x-axis limits so that it only shows the most interesting years
# 3b. Come up with a new title that describes this time period 

# When you're finished, drop this plot into the Discord server in the channel #np-data-viz!

Your code here


