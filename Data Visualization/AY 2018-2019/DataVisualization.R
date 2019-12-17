########################## Setup #######################################

# Load in the evals data (evals.RData)  
evals <- read.csv("data/evals.csv")

# Inspect the data here!  


library(tidyverse)    ## load the tidyverse packages, incl. dplyr


########################## First ggplot ################################ 
ggplot(data = evals) +
  geom_point(mapping = aes(y = bty_avg, x = score)) + 
  labs(x = "Course Evaluation", 
       y = "Beauty Score")



########################## Exercise 1 ##################################
# Would you expect there to be a relationship between the class size 
# and course evaluation score? 
# If so, what direction would you expect for this relationship to be? 
# Check if the data support your expectation.



########################## Exercise 2 ##################################
# What happens when you make a scatterplot of rank and gender? 
# Why is the plot not useful?  



########################## Bonus #######################################
# Do the students appear to agree on the beauty scores of the professors? 
# Plot the scores given by the lower-level male (`bty_m1lower`) 
# against the others. 


########################## Color Aesthetic ############################# 
ggplot(data = evals) + 
  geom_point(mapping = aes(y = score, x = bty_avg, color = language))
# can use color or colour in the aes mapping


# Change the above code to map gender to a point's size 
ggplot(data = evals) + 
  geom_point(mapping = aes(y = score, x = bty_avg, size = cls_students))



########################## Exercise 3 ################################## 
# Map the shape aesthetic to the variable rank. 
# What happens if you map rank to a second aesthetic variable?   



########################## Fixed Aesthetics ############################ 
ggplot(data = evals) + 
  geom_point(mapping = aes(y = score, x = bty_avg), shape = 5) + 
  theme_bw()


########################## Exercise 4 ################################## 
# Map a continuous variable to color, size, and shape. 
# How do these aesthetic mappings differ for continuous variables? 



########################## Exercise 5 ################################## 
# Use what you have learned to create a scatterplot of  score over rank, 
# with minority showing in different colors. 
# Is this a good display of this type of data? 
  


########################## Exercise 5 ################################## 
# Use what you have learned to create a scatterplot of score over rank 
# with minority showing in different colors. 
# Is this a good display of this type of data? 



########################## FACETS ###################################### 

ggplot(data = evals, mapping = aes(y = score, x = bty_avg)) + 
  geom_point() + 
  facet_wrap(. ~ rank, nrow = 1) # plots different ranks in columns 

ggplot(data = evals, mapping = aes(y = score, x = bty_avg)) + 
  geom_point() + 
  facet_wrap(rank ~ ., ncol = 1) # plots different ranks as rows   


ggplot(data = evals, mapping = aes(y = score, x = bty_avg)) + 
  geom_point() + 
  facet_grid(gender ~ rank) # plots two categorical variables



########################## Exercise 6 ################################## 
# Facet bty_avg and score by language and rank. 
# What do the empty cells mean?  
  


########################## Exercise 7 ################################## 
# Consider the first plot created in this section. 
# Create the same comparison of variables, but plot the values of rank 
# using different colors.

# What are the advantages of faceting over using a color aesthetic? 
# Would your opinion change if you had a larger dataset? 



########################## GEOMS ####################################### 

ggplot(data = evals, mapping = aes(y = score, x = bty_avg)) + 
  geom_smooth(mapping = aes(linetype = gender, color = gender))


ggplot(data = evals, mapping = aes(y = score, x = bty_avg)) + 
  geom_point() + 
  geom_smooth(mapping = aes(linetype = gender))



########################## Exercise 9 ################################## 
# Create a plot where all professor's scores are displayed, 
# but each point is differentiated by what language was the professor's 
# native language. 

# Draw a trend line over the top of these points, where the trend line 
# represents the trend between average beauty score and average course 
# evaluation for ALL of these professors. 



########################## THEMES & TITLES #############################

ggplot(data = evals,
       mapping = aes(x = bty_avg, y = score, color = gender)) + 
  geom_point() +
  labs(x = "Average Beauty Score", 
       y = "Average Course Evaluation Score", 
       title = "Course Evaluations and Beauty", 
       color = "Sex")


########################## TRANSFORMATIONS #############################

########################## BAR PLOTS ###################################

# bar chart with geom_bar
ggplot(data = evals) + 
  geom_bar(mapping = aes(x = rank))

# bar chart with stat_count (default stat for geom_bar)
ggplot(data = evals) + 
  stat_count(mapping = aes(x = rank))

# bar chart of proportions
ggplot(data = evals) + 
  geom_bar(mapping = aes(x = rank, y = ..prop.., group = 1))


########################## Exercise 10 #################################
# Why do we need to set group = 1 in the above proportion bar chart? 
# In other words, what is wrong with the plot below?   



########################## Exercise 11 #################################
# What variables does stat_smooth compute? 
# How can you control its behavior?     
  


########################## COLORED BAR PLOTS ###########################

ggplot(data = evals) + 
  geom_bar(mapping = aes(x = rank, fill = rank))



########################## Exercise 12 #################################
# Change the above code so that each bar is filled with a different color.     



########################## TWO VARIABLE BAR PLOTS ######################

# stacked bar charts
ggplot(data = evals) + 
  geom_bar(mapping = aes(x = rank, fill = gender))

ggplot(data = evals) + 
  geom_bar(mapping = aes(x = rank, fill = gender), position = "fill")

# side-by-side bar charts 
ggplot(data = evals) + 
  geom_bar(mapping = aes(x = rank, fill = gender), position = "dodge")



########################## Exercise 13 #################################
# The position = "jitter" argument can be added to a scatterplot to 
# add random noise to each data point. 

# Add this argument to the very first scatterplot we made. 
# Compare the difference it made on the plot. 
# What are advantages of this? What are disadvantages? 



########################## BOXPLOTS ####################################

ggplot(data = evals, mapping = aes(x = rank, y = score)) + 
  geom_boxplot() 

ggplot(data = evals, mapping = aes(x = rank, y = score)) + 
  geom_violin(color = "tomato") + 
  geom_point()



########################## Exercise 15 #################################
# Are one-credit courses or multi-credit courses rated more highly? 
# Do you agree with this trend?  



########################## BONUS #######################################
# Do men and women tend to score courses similarly?  



########################## FLIPPED COORDINATES #########################

ggplot(data = evals, mapping = aes(x = rank, y = score)) + 
  geom_boxplot() + 
  geom_point(color = "tomato") + 
  coord_flip() # flips coordinates of plot (from vertical to horizontal)


########################## Exercise 16 #################################
# Replace the flipped boxplot above with a violin plot; see `geom_violin()`. 
 
 
