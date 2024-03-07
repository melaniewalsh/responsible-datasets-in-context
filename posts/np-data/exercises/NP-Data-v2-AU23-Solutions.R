# Exploring National Park data with a new tool, "dplyr"

# Load National Park Visitation data
np_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/1979-2020-National-Park-Visits-By-State.csv", stringsAsFactors = FALSE)

# View the np_data dataframe by clicking on the spreadsheet icon in the Global Environment

# Install tidyverse
install.packages("tidyverse")

# Load dplyr library
library(dplyr)


# Exercise 1
# Select 2 columns from the data using a DPLYR function
# Save this 2-column dataframe to the variable smaller_df
# Make sure to use the pipe %>% operator!
smaller_df <- np_data(Year, RecreationVisits)

# How does the number of visits to Washington national parks compare to another state?

# Exercise 2
# Filter the dataframe for only values in the state of Washington and save to the variable wa_parks
wa_parks <- np_data %>% filter(State == "WA")

# Exercise 3
# Calculate the sum total of RecreationVisits to Washington by using summarize() on the smaller dataframe wa_parks

wa_parks %>% summarize(sum(RecreationVisits))

# Exercise 4
# Filter the dataframe for only values in another state (your choice) and save to a variable
# Calculate the sum total of RecreationVisits to this state by using summarize() 

ca_parks <- np_data %>% filter(State == "CA")
ca_parks %>% summarize(sum(RecreationVisits))
# How do the number of visits to these 2 states compare to one another?

