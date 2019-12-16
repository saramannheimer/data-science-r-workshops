# Data for Workshop  

# Load in the surveys data (surveys.csv)  
surveys <- read.csv("data/surveys.csv")

# Inspect the data here!  

str(surveys)
summary(surveys)

View(surveys)
# Data Manipulation using dplyr  

library(tidyverse)    ## load the tidyverse packages, incl. dplyr


############# SELECT ########################################################

# include named columns  
dates <- select(surveys, month, day, year, plot_id)

# exclude named columns (selects everything but these columns)  
select(surveys, -month, -day, -year)

# select a range of columns  
select(surveys, -month:-year)  

# Exercise 1:  
# Subset the surveys data to include all columns but the dates 
# AND store the resulting data frame as a new R object named sml_survey.   


############# FILTER ########################################################

# subsetting data frame to only have rodents captured in 1989  
filter(surveys, year == 1989 | sex == "M")

filter(surveys, plot_id < 10) 


# Exercise 2: 
# Subset the surveys data to include only female rodents 
# who were captured in plots 12 or above 
# AND store the resulting data frame as a new R object named female.    

female <- filter(>=)

############# PIPES ########################################################

surveys2 <- filter(surveys, species_id == "OL") 
surveys_sml <- select(surveys2, month, day, year) 


surveys_sml <- select(filter(surveys, species_id == "OL"), month, day, year) 


ol <- surveys %>%
        filter(species_id == "OL") %>%  
        select(month, day, year) 


# Exercise 3: 
# Using pipes, subset the surveys data to include 
# only the rodents recorded in the month of July and 
# retain all of the columns except the date variables. 

surveys %>%
  filter(month == 7) %>%
  # selecting all rodents caught in July
  select(-month, -day, -year)

############# MUTATE #######################################################


# creating a new column called weight_kg
surveys %>%
  mutate(weight_kg = weight/1000)

# creating a new column called weight_kg, hindfoot_cm, and condition
surveys %>%
  mutate(weight_kg = weight/1000) %>%
  mutate(hindfoot_cm = hindfoot_length/1000) %>%
  mutate(condition = weight_kg/hindfoot_cm) %>%
  head()

# creating a new column called weight_kg, hindfoot_cm, and condition
surveys %>%
  mutate(weight_kg = weight/1000) %>%
  mutate(hindfoot_cm = hindfoot_length/1000) %>%
  mutate(condition = weight_kg/hindfoot_length) %>%
  head()

# Exercise 4:  
# Create a new data frame from the surveys data that meets the 
# following criteria:  contains only the species_id column 
# and a new column called hindfoot_half, 
# containing half of the value of the hindfoot_cm values. 

# In this hindfoot_half column, there should be no NAs and 
# all values are less than 20. 

surveys %>%
  mutate(hindfoot_cm = hindfoot_length/1000) %>%
  mutate(hindfoot_half = hindfoot_cm/2) %>%
  filter(hindfoot_half < 20, is.na(hindfoot_half) != TRUE) %>%
  select(species_id, hindfoot_half) %>%
  head()

# Split-Apply Combine    

############# GROUP BY & SUMMARISE ###########################################

surveys %>% 
  group_by(sex) %>%
  summarise(mean_weight = mean(weight, na.rm = TRUE))

surveys %>% 
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean(weight, na.rm = TRUE))

surveys %>% 
  filter(is.na(weight) != TRUE) %>%
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean(weight))

surveys %>% 
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean(weight),
            min_hindfoot = min(hindfoot_length), 
            max_hindfoot = max(hindfoot_length))

surveys %>% 
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean(weight),
            min_hindfoot = min(hindfoot_length), 
            max_hindfoot = max(hindfoot_length)) %>%
  arrange(mean_weight)

surveys %>% 
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean(weight),
            min_hindfoot = min(hindfoot_length), 
            max_hindfoot = max(hindfoot_length)) %>%
  arrange(desc(mean_weight))


# Exercise 5:  
# Use group_by() and summarise() to find the 
# mean and standard deviation of the hindfoot_length for every species.  



# Exercise 6:  
# What was the lightest animal caught each year? 
# Return a data frame with columns year, sex, 
# species_id, and weight. 

surveys %>%
  group_by(year) %>% 
  arrange(weight) %>%
  top_n(1, weight)
  




############# COUNT ########################################################

surveys %>%
  count(plot_id) 

# Equivalent to: 
surveys %>%
  group_by(plot_id) %>%
  summarise(count = n())

surveys %>%
  count(plot_id, sort = TRUE) 

surveys %>%
  count(sex, species_id) 

surveys %>%
  count(sex, species_id) %>% 
  arrange(species_id, desc(n))


# Exercise 7: 
# How many rodents were caught each year?    


  
# Exercise 8:
# Adding to Exercise 5, also include the number of observations 
# of each species.

surveys %>%
  group_by(species_id) %>%
  summarise(mean_weight = mean(weight), 
            count = n())




############# RELATIONAL DATA ###############################################

# Load in these data and inspect them to get an idea of how 
# they relate to the survey data we've been working with. 

plots <- read.csv("data/plots.csv")

species <- read.csv("data/species.csv")

str(plots)

str(species)

### Joining survey Data  

combined <- surveys %>% 
              left_join(plots, by = "plot_id") %>%  
              # adding the type of plot  
              left_join(species, by = "species_id") 
              # adding the genus, species, and taxa 



## Reshaping Long to Wide with spread

combined %>%
  filter(!is.na(weight)) %>%
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight)) %>%
  head(n = 10)

combined %>%
  filter(!is.na(weight)) %>%
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight)) %>%
  spread(genus, mean_weight) %>% 
  head()

wide_survey <- combined %>%
  filter(!is.na(weight)) %>%
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight)) %>%
  spread(genus, mean_weight, fill = 0) 


## Reshaping Wide to Long with gather 

wide_survey %>%
  gather(key = genus, value = m_weight, -plot_id) %>%
  head()


# Exercise 9:  
# Spread the combined data frame with year as columns, 
# plot_id as rows, and the number of genera per plot as the values.  
# (hint: you will need to summarize before reshaping, 
#   and the function n_distinct() will be helpful in getting the 
#   number of unique genera)  




# Exercise 10: 
# Now take your wide data frame and gather() it,
# so each row is a unique plot_id by year combination. 


