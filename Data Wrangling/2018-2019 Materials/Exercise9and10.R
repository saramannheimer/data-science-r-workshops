# Exercise 9: 
# Spread the combined data frame with year as columns,
# plot_id as rows, and the number of genera per plot as the values.
# (hint: you will need to summarize before reshaping, 
    # and the function `n_distinct()` will be helpful) 

wide_counts <- combined %>% 
  group_by(year, plot_id) %>%
  # to group by years as columns and plot_id as rows
  summarize(species_count = n_distinct(species)) %>%
  # counting the number of distinct/unique species caught every year at every plot
  spread(key = year, value = species_count)
  # making a wide data frame where each year is its own column 


# Exercise 10: 
# Now take your wide data frame and gather it, 
# so each row is a unique plot_id by year combination. 

long_counts <- wide_counts %>%
  gather(key = year, value = distinct_species, -plot_id)
  # making a long data frame where all years are in one column 
  # and the number of distinct species is in one column
  
