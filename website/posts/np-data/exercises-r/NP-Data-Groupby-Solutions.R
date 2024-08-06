# NP Data Groupby

# Load the data
np_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/1979-2020-National-Park-Visits-By-State.csv", stringsAsFactors = FALSE)

# Load dplyr library
library(dplyr)

# Exercise 1: What is the average number of visits for each state?
# Save as avg_state_visits and then view the resulting dataframe
avg_state_visits <- np_data %>% 
                    group_by(State) %>%
                    summarize(avg_visits = mean(RecreationVisits))

# What state has the most and least average visits?
# What patterns or surprises do you notice?


# Exercise 2:  What is the average number of visits for each National Park?
# Save as avg_park_visits and then view the resulting dataframe
avg_park_visits <- np_data %>% 
                    group_by(ParkName, State) %>%
                    summarize(avg_visits = mean(RecreationVisits))


# Which National Park has the most and least average visits?
# What patterns or surprises do you notice?


# Exercise 3: How many National Parks are there in each state?
# Save as distinct_parks
distinct_parks <-   np_data %>% 
                    group_by(State) %>%
                    summarize(num_parks = n_distinct(ParkName))

# Which state has the most national parks?
# What patterns or surprises do you notice?
