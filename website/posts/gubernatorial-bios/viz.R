# install.packages(c(
#   "stargazer",
#   "sf",
#   "tidyverse",
#   "xtable",
#   "ggwordcloud",
#   "binscatter"
# ))




# Load the necessary package for visualization

# library(sf)
# library(tidyverse)
# library(xtable)
library(ggwordcloud)
library(dplyr)
library(ggplot2)


library(tidyr)
library(stringr)
library(forcats)



## COLLEGE




gov_dataset <- read.csv("https://raw.githubusercontent.com/melaniewalsh/responsible-datasets-in-context/refs/heads/main/datasets/gubernatorial-bios/gubernatorial_bios.csv", stringsAsFactors = FALSE)



gov_dataset


glimpse(gov_dataset)
gov_long <- gov_dataset %>%
  # Split multiple ranges into separate rows
  separate_rows(years_in_office, sep = "\\s(?=\\d{4}\\s-\\s\\d{4}|\\d{4}\\s-\\sPresent)") %>%
  # Replace Present with 2025 if needed
  mutate(years_in_office = str_replace(years_in_office, "Present", "2025")) %>%
  # Extract start and end years
  mutate(
    start = as.numeric(str_extract(years_in_office, "^\\d{4}")),
    end   = as.numeric(str_extract(years_in_office, "\\d{4}$"))
  ) %>%
  # Expand each range into all years served
  rowwise() %>%
  mutate(year = list(seq(start, end))) %>%
  unnest(year) %>%
  ungroup() %>%
  filter(year >= 1775, year <= 2025) %>%
  distinct()

gov_long %>%
  filter(governor == "Kay Ivey") %>%
  arrange(year) %>%
  select(governor, years_in_office, year)

glimpse(gov_long)


yearly_college <- gov_long %>%
  group_by(year) %>%
  summarise(
    total = n(),
    college = sum(college_attendance == 1, na.rm = TRUE),
    pct_college = 100 * college / total,
    .groups = "drop"
  )

# 2. Bin years into 25-year chunks
binned_college <- yearly_college %>%
  mutate(bin = cut(year, breaks = seq(1775, 2025, by = 25), include.lowest = TRUE, right = FALSE)) %>%
  group_by(bin) %>%
  summarise(
    first_year = min(year), # midpoint anchor
    pct_college = mean(pct_college, na.rm = TRUE),
    .groups = "drop"
  )

# 3. Plot
ggplot() +
  geom_point(
    data = yearly_college,
    aes(x = year, y = pct_college),
    color = "gray50", alpha = 0.4
  ) +
  geom_point(
    data = binned_college,
    aes(x = first_year + 12.5, y = pct_college), # put point in middle of 25-year bin
    color = "#6A0DAD", size = 2
  ) +
  geom_line(
    data = binned_college,
    aes(x = first_year + 12.5, y = pct_college),
    color = "#6A0DAD"
  ) +
  theme_bw() +
  xlab("") +
  ggtitle("Have elected governors become more college educated?") +
  ylab("Percent College") +
  theme(plot.title = element_text(size = 8)) +
  scale_x_continuous(breaks = seq(1775, 2025, by = 25)) # Add x-axis ticks every 25 years



## MILITARY

# 1. Yearly % military
yearly_military <- gov_long %>%
  group_by(year) %>%
  summarise(
    total = n(),
    military = sum(military_service == 1, na.rm = TRUE),
    pct_military = 100 * military / total,
    .groups = "drop"
  )

# 2. Bin years into 25-year chunks
binned_military <- yearly_military %>%
  mutate(bin = cut(year, breaks = seq(1775, 2025, by = 25), include.lowest = TRUE, right = FALSE)) %>%
  group_by(bin) %>%
  summarise(
    first_year = min(year),
    pct_military = mean(pct_military, na.rm = TRUE),
    .groups = "drop"
  )

# 3. Plot
ggplot() +
  geom_point(
    data = yearly_military,
    aes(x = year, y = pct_military),
    color = "gray50", alpha = 0.4
  ) +
  geom_point(
    data = binned_military,
    aes(x = first_year + 12.5, y = pct_military), # center in bin
    color = "#6A0DAD", size = 2
  ) +
  geom_line(
    data = binned_military,
    aes(x = first_year + 12.5, y = pct_military),
    color = "#6A0DAD"
  ) +
  theme_bw() +
  xlab("") +
  ggtitle("Have elected governors served in the military more or less?") +
  ylab("Percent Military Service") +
  theme(plot.title = element_text(size = 8)) +
  scale_x_continuous(breaks = seq(1775, 2025, by = 25))




## GENDER

# 1. Yearly % female
yearly_female <- gov_long %>%
  group_by(year) %>%
  summarise(
    total = n(),
    female = sum(gender == "female", na.rm = TRUE),
    pct_female = 100 * female / total,
    .groups = "drop"
  )

# 2. Bin years into 25-year chunks
binned_female <- yearly_female %>%
  mutate(bin = cut(year, breaks = seq(1775, 2025, by = 25), include.lowest = TRUE, right = FALSE)) %>%
  group_by(bin) %>%
  summarise(
    first_year = min(year),
    pct_female = mean(pct_female, na.rm = TRUE),
    .groups = "drop"
  )

# 3. Plot
ggplot() +
  geom_point(
    data = yearly_female,
    aes(x = year, y = pct_female),
    color = "gray50", alpha = 0.4
  ) +
  geom_point(
    data = binned_female,
    aes(x = first_year + 12.5, y = pct_female), # center in bin
    color = "#6A0DAD", size = 2
  ) +
  geom_line(
    data = binned_female,
    aes(x = first_year + 12.5, y = pct_female),
    color = "#6A0DAD"
  ) +
  theme_bw() +
  xlab("") +
  ggtitle("Have elected governors become more gender diverse?") +
  ylab("Percent Female Governors") +
  theme(plot.title = element_text(size = 8)) +
  scale_x_continuous(breaks = seq(1775, 2025, by = 25))

glimpse(gov_long)

## Ivy League

# 1. Yearly % Ivy attendance
yearly_ivy <- gov_long %>%
  group_by(year) %>%
  summarise(
    total = n(),
    ivy = sum(ivy_attendance == 1, na.rm = TRUE),
    pct_ivy = 100 * ivy / total,
    .groups = "drop"
  )

# 2. Bin years into 25-year chunks
binned_ivy <- yearly_ivy %>%
  mutate(bin = cut(year, breaks = seq(1775, 2025, by = 25), include.lowest = TRUE, right = FALSE)) %>%
  group_by(bin) %>%
  summarise(
    first_year = min(year),
    pct_ivy = mean(pct_ivy, na.rm = TRUE),
    .groups = "drop"
  )

# 3. Plot
ggplot() +
  geom_point(
    data = yearly_ivy,
    aes(x = year, y = pct_ivy),
    color = "gray50", alpha = 0.4
  ) +
  geom_point(
    data = binned_ivy,
    aes(x = first_year + 12.5, y = pct_ivy), # center in bin
    color = "#6A0DAD", size = 2
  ) +
  geom_line(
    data = binned_ivy,
    aes(x = first_year + 12.5, y = pct_ivy),
    color = "#6A0DAD"
  ) +
  theme_bw() +
  xlab("") +
  ggtitle("Have elected governors become more Ivy-educated?") +
  ylab("Percent with Ivy Attendance") +
  theme(plot.title = element_text(size = 8)) +
  scale_x_continuous(breaks = seq(1775, 2025, by = 25))

## Lawyers

yearly_lawyer <- gov_long %>%
  group_by(year) %>%
  summarise(
    total = n(),
    lawyer = sum(lawyer == 1, na.rm = TRUE),
    pct_lawyer = 100 * lawyer / total,
    .groups = "drop"
  )

# 2. Bin years into 25-year chunks
binned_lawyer <- yearly_lawyer %>%
  mutate(bin = cut(year, breaks = seq(1775, 2025, by = 25), include.lowest = TRUE, right = FALSE)) %>%
  group_by(bin) %>%
  summarise(
    first_year = min(year),
    pct_lawyer = mean(pct_lawyer, na.rm = TRUE),
    .groups = "drop"
  )

# 3. Plot
ggplot() +
  geom_point(
    data = yearly_lawyer,
    aes(x = year, y = pct_lawyer),
    color = "gray50", alpha = 0.4
  ) +
  geom_point(
    data = binned_lawyer,
    aes(x = first_year + 12.5, y = pct_lawyer), # center in bin
    color = "#6A0DAD", size = 2
  ) +
  geom_line(
    data = binned_lawyer,
    aes(x = first_year + 12.5, y = pct_lawyer),
    color = "#6A0DAD"
  ) +
  theme_bw() +
  xlab("") +
  ggtitle("Have elected governors become more likely to be lawyers?") +
  ylab("Percent Lawyers") +
  theme(plot.title = element_text(size = 8)) +
  scale_x_continuous(breaks = seq(1775, 2025, by = 25))

## Bar Graph
# Deduplicate governors by name, keeping their first row


party_counts <- gov_dataset %>%
  transmute(party = coalesce(party, "")) %>%
  mutate(
    party = str_replace_all(party, "\\bRepublician\\b", "Republican"),
    party = str_replace_all(party, "\\bDemocrat\\b", "Democratic"),
    party = str_replace_all(party, "\\bJacksonian Democrat\\b|\\bJackson Democrat\\b", "Democratic"),
    party = str_replace_all(party, "\\bAnti-Jacksonian\\b", "National Republican"),
    party = str_replace_all(party, "\\bJeffersonian(-| )?Republican\\b", "Democratic-Republican"),
    party = str_replace_all(party, "\\bIndependent-?Republican\\b", "Republican"),
    party = str_replace_all(party, "\\s*\\(.*?\\)", ""),
    party = str_replace_all(party, "\\s+", " ")
  ) %>%
  separate_rows(party, sep = "\\s*(;|,|/|\\band\\b|&|;)\\s*") %>%
  mutate(party = str_squish(party)) %>%
  filter(party != "") %>%
  count(party, sort = TRUE)

party_counts_final <- party_counts %>%
  slice_max(n, n = 10) %>%
  mutate(party = fct_reorder(party, n))
ggplot(party_counts_final, aes(x = n, y = party)) +
  geom_col(fill = "#6A0DAD") +
  theme_bw() +
  theme(plot.title = element_text(size = 8)) +
  labs(
    title = "Most common party affiliations among U.S. governors",
    x = "Count", y = NULL
  ) +
  theme_minimal(base_size = 12)

## Word Cloud
intl_born <- gov_dataset %>%
  filter(!is.na(intl_born_details))


# your manually cleaned vector of international places
intl_places <- c(
  "Japan", # military base
  "Lochmaben, Dumfriesshire, Scotland",
  "Austria",
  "County Roscommon, Ireland",
  "Paris, France",
  "Washington, D.C.",
  "Northern Ireland",
  "Muthill, Perthshire, Scotland",
  "Moretonhampstead, Devonshire, England",
  "Sheffield, Yorkshire, England",
  "Road, Somerset, England",
  "Kurnbach, Wurttenburg, Germany",
  "Down Hatherley, Gloucestershire, England",
  "Cardiff, Wales",
  "Obrigheim, Bavaria, Germany",
  "Devonshire, England",
  "Niedersellers, Germany",
  "Klingenmunster, Bavaria, Germany",
  "Laon, France",
  "Paris, France",
  "Clithoroe, Lancashire, England",
  "Vancouver, British Columbia, Canada",
  "Chihuahua, Mexico",
  "Windsor, Ontario, Canada",
  "Hickling, Nottingham, England",
  "Eskildstrup, Denmark",
  "Varmland, Sweden",
  "Kanna, Sweden",
  "Voss, Norway",
  "Calgary, Alberta, Canada",
  "Gallstad, Sweden",
  "Norwood, Ontario, Canada",
  "County Tyrone, Ireland",
  "Czarnikau, Prussia",
  "Montgomeryshire, Wales",
  "Toronto, Canada",
  "Havana, Cuba",
  "Lenoxtown, Scotland",
  "County Antrim, Ireland",
  "Allende, Chihuahua, Mexico",
  "Egremont, England",
  "Strand, Norway",
  "Bellerby, Yorkshire, England",
  "Voss, Norway",
  "Devonshire, England",
  "Killyleagh, Ireland",
  "Montreal, Canada",
  "County Tyrone, Ireland",
  "Carlisle, England",
  "Malmo, Sweden",
  "Devonshire, England",
  "Guelph, Ontario, Canada",
  "County Tyrone, Ireland",
  "Dublin, Ireland",
  "Quebec, Canada",
  "London, England",
  "London, England",
  "Island of St.",
  "Arendal, Norway",
  "Bergen, Norway",
  "Eberstadt, Hesse-Darmstadt, Germany",
  "Windsor, Berkshire, England",
  "Sheffield, England",
  "Zurich, Switzerland",
  "Helsingborg, Sweden",
  "Compton, Quebec, Canada",
  "Jedburgh, Scotland",
  "York County, New Brunswick, Canada",
  "Halifax, England",
  "Duesmond, Germany",
  "Upper Aardal, Sogn, Norway",
  "Inverness, Scotland",
  "Stroebeck, Prussia",
  "Glasgow, Scotland",
  "Camp Zama, Japan"
)

# frequency table
intl_places <- as.data.frame(table(intl_places))

intl_places

# plot word cloud
ggplot(intl_places, aes(label = intl_places, size = Freq)) +
  geom_text_wordcloud_area() +
  scale_size_area(max_size = 20) +
  ggtitle("Locations of Birth for US Governors Born Outside the States") +
  theme_void() +
  theme(
    panel.background = element_rect(fill = "white", colour = NA),
    plot.background  = element_rect(fill = "white", colour = NA)
  )


## Map
library(dplyr)
library(ggplot2)
library(maps)

glimpse(gov_dataset)

# Summarize governors by state
gov_by_state <- gov_dataset %>%
  distinct(governor, .keep_all = TRUE) %>%
  count(birth_state_territory, name = "n_governors")

# Get U.S. state map data
states_map <- map_data("state")

# Match case (map_data uses lowercase state names)
gov_by_state <- gov_by_state %>%
  mutate(birth_state_territory = tolower(birth_state_territory))

# Join governors data with map
map_data_joined <- states_map %>%
  left_join(gov_by_state, by = c("region" = "birth_state_territory"))

# Plot map
ggplot(map_data_joined, aes(long, lat, group = group, fill = n_governors)) +
  geom_polygon(color = "white") +
  coord_fixed(1.3) +
  scale_fill_gradient(low = "lavender", high = "#6A0DAD", na.value = "gray90") +
  theme_void() +
  ggtitle("Number of Unique Governors by State") +
  theme(plot.title = element_text(size = 10, hjust = 0.5))

### Birth state terrorty vs state
library(dplyr)
library(ggplot2)

# 1. Yearly % born in same state/territory
yearly_born_in_state <- gov_long %>%
  group_by(year) %>%
  summarise(
    total = n(),
    in_state = sum(born_in_state_territory == 1, na.rm = TRUE),
    pct_in_state = 100 * in_state / total,
    .groups = "drop"
  )

# 2. Bin years into 25-year chunks
binned_born_in_state <- yearly_born_in_state %>%
  mutate(bin = cut(year, breaks = seq(1775, 2025, by = 25), include.lowest = TRUE, right = FALSE)) %>%
  group_by(bin) %>%
  summarise(
    first_year = min(year),
    pct_in_state = mean(pct_in_state, na.rm = TRUE),
    .groups = "drop"
  )

# 3. Plot
ggplot() +
  geom_point(
    data = yearly_born_in_state,
    aes(x = year, y = pct_in_state),
    color = "gray50", alpha = 0.4
  ) +
  geom_point(
    data = binned_born_in_state,
    aes(x = first_year + 12.5, y = pct_in_state), # center in bin
    color = "#6A0DAD", size = 2
  ) +
  geom_line(
    data = binned_born_in_state,
    aes(x = first_year + 12.5, y = pct_in_state),
    color = "#6A0DAD"
  ) +
  theme_bw() +
  xlab("") +
  ggtitle("Percent of Governors Born in the State/Territory They Governed") +
  ylab("Percent Born In-State") +
  theme(plot.title = element_text(size = 8)) +
  scale_x_continuous(breaks = seq(1775, 2025, by = 25))

## Age

yearly_age <- gov_long %>%
  group_by(year) %>%
  summarise(
    avg_age = mean(age_at_start, na.rm = TRUE),
    .groups = "drop"
  )

# 2. Bin years into 25-year chunks and compute mean within each bin
binned_age <- yearly_age %>%
  mutate(bin = cut(year, breaks = seq(1775, 2025, by = 25), include.lowest = TRUE, right = FALSE)) %>%
  group_by(bin) %>%
  summarise(
    first_year = min(year),
    avg_age = mean(avg_age, na.rm = TRUE),
    .groups = "drop"
  )

# 3. Plot
ggplot() +
  geom_point(
    data = yearly_age,
    aes(x = year, y = avg_age),
    color = "gray50", alpha = 0.4
  ) +
  geom_point(
    data = binned_age,
    aes(x = first_year + 12.5, y = avg_age), # center in bin
    color = "#6A0DAD", size = 2
  ) +
  geom_line(
    data = binned_age,
    aes(x = first_year + 12.5, y = avg_age),
    color = "#6A0DAD"
  ) +
  theme_bw() +
  xlab("") +
  ggtitle("Average Age of Governors at Start of Office") +
  ylab("Average Age") +
  theme(plot.title = element_text(size = 8)) +
  scale_x_continuous(breaks = seq(1775, 2025, by = 25))
