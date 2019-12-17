###################################### Application Questions ##########################################  

# Practice: Using statistics or graphics, which year in our dataset had the most fish caught?  

##################### Statistics ##########################
summary(BlackfootFish$yearF)
# This assumes that you have a yearF variable in your data set, where you 
# converted from numeric to a factor

# OR 
table(BlackfootFish$year)
# This creates a table of the number of observations (rows) for each year in the dataset


##################### Graphics ##########################
# To create a bar plot of the number of observations each year
year <- table(BlackfootFish$year)

barplot(year, xlab = "Year", ylab = "Number of Fish", main = "Fish Caught by Year",
        las = 1, col = "blue", ylim = c(0, 4000))

  
  
# Practice: Make a boxplot of the fish weights over the different years in the dataset.  

boxplot(weight ~ year, 
        data = BlackfootFish2, 
        xlab = "Year", 
        ylab = "Weight (in grams)", 
        main = "Fish Weight by Year", 
        las = 1)
