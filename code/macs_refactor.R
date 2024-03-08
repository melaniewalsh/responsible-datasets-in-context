# Libraries
library(readr)


# Read in raw data - terribly formatted though it is...
field_widths <- c(5,3,1,4,1,4,rep(1,28),3,1,3,3,rep(1,28))
raw_data <- readr::read_fwf(file = "../MACS/data/section2.dat", col_positions = fwf_widths(field_widths), na = ".")

# Filter down to the fields we care about, and remove duplicates
filtered_data <- raw_data[!duplicated(x = raw_data$X1),c(1,4,6,8:31,33,35,37:41)]

# Create compressed race columns
race_vals <- c("Chinese", "Central or South Asian", "Cuban", "Eastern European Jewish", "Eastern European Non-Jewish",
               "Haitian", "East African", "Middle Eastern", "Pacific Islander", "Western European", "Jamaican",
               "Japanese", "Mediterranean", "Other African", "Other Caribbean", "Other", "Central or South American",
               "Southeastern Asian", "Zairian")

compressed_race <- c(1:nrow(filtered_data))

# Maybe use Purr for this instead
dispose <- mapply(function(x, vals){
  
  # ID applicable fields and write out
  compressed_race[which(x==2)] <<- vals
}, x= filtered_data[,8:26], vals = race_vals)


# Fix the employment data
employment_data <- do.call("data.frame", lapply(filtered_data[,c(5:7,27:28,32,34)], function(x){
  logical_convert <- (x == 1)
  logical_convert[is.na(logical_convert)] <- FALSE
  return(logical_convert)
}))

# Convert second race field
race_raw <- filtered_data$X40
race_raw[is.na(race_raw)] <- 7
race_field <-{
  ifelse(race_raw==1,"White",
         ifelse(race_raw==2,"White Hispanic",
         ifelse(race_raw==3,"Black",
         ifelse(race_raw==4,"Black Hispanic",
         ifelse(race_raw==5,"Native American",
         ifelse(race_raw==6,"Asian",
                "Other"))))))
}

# Convert education
ed_raw <- filtered_data$X8
ed_field <-{
  ifelse(ed_raw==1,"8th grade or less",
         ifelse(race_raw==2,"9th-11th grade",
         ifelse(race_raw==3,"12th grade",
         ifelse(race_raw==4,"Some college",
         ifelse(race_raw==5,"Four-year college",
         ifelse(race_raw==6,"Some post-graduate college",
                ifelse(ed_raw==7,"Post-graduate degree",
                "Other")))))))
}

# Relabel employment
names(employment_data) <- c("disabled_employment", "employed_by_other", "self_employed",
                            "work_for_pay", "current_fulltime", "current_parttime",
                            "current_retired")
# Final data.frame
final <- cbind(data.frame(id_number  = filtered_data$X1,
                    visit_year = filtered_data$X4,
                    yob        = filtered_data$X6,
                    education_level = ed_field,
                    ethnicity  = compressed_race,
                    race       = race_field), employment_data)


# Write out
write_csv(x = final, file = "macs_data.csv")
