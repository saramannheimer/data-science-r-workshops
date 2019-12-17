## Calculator  

1 + 2 

16*9

sqrt(2)

20/5

18.5 - 7.21

3 %% 2 ## what is this doing?



## Creating Objects 

(x <- 6)

2.2 * x

4 + x 

x %% 3

#overwrite x's value, so that it has a new value
x <- 2 

y <-  x + 6


###################### Exercise 1 ################################# 
# Change the value of x to back to 6 and see what the value of y is. 
# Did it change from before? Is the value of `y` 8 or 12?
  



## Working with Different Data Types 

temps <- c(50, 55, 60, 65)
temps

animals <- c("cat", "dog", "bird", "fish")
animals


class(temps)
class(animals)


###################### Exercise 2 ################################# 
# Create a vector that contains decimal valued numbers. 
# Then check what data type does that vector contain?




logic <- c(TRUE, FALSE, FALSE, TRUE)

class(logic)


###################### Exercise 3 ################################# 
# What happens when we try to mix different data types into one vector?
# Speculate what will happen when we run each of the following lines of code:

num_char <- c(1, 2, 3, "a")

num_logic <- c(1, 2, 3, FALSE)

char_logic <- c("a", "b", "c", TRUE)

guess <- c(1, 2, 3, "4")



## Lists  
  
my_first_list <- list(animals, temps, logic)
my_first_list


## Importing Data  

# copy and paste the code that was used by R to import the data 
# be careful to only copy the code that is next to the > signs! 



## Structure of Data  

class(BlackfootFish)

dim(BlackfootFish) 
## What is the first number represent? What about the second number?

names(BlackfootFish)

str(BlackfootFish)

summary(BlackfootFish) 
## What is the data type of each variable in our dataset?


## Dataframes 

## Extracting Data  

years <- BlackfootFish$year 
## extracts year from the dataset and saves it into a new variable named year

str(years) ## using the new variable (remember case matters!)

## How would you determine how long the vector is?


years <- BlackfootFish[, 5] ## This takes ALL rows of data but only the fifth column
## Same as years <- BlackfootFish[1:18352, 5]

str(years)
```


###################### PRACTICE ################################# 
x <- as.matrix(cbind(c(1, 5, 9, 13),
                     c(2, 6, 10, 14), 
                     c(3, 7, 11, 15), 
                     c(4, 8, 12, 16)))


###################### Exercise 4 ################################# 
# What would be output if you entered: `x[3, ]`?  


###################### Exercise 5 ################################# 
# Exercise 5:** What would you input to get an output of 4?



df <- data.frame(
  x = c("H", "N", "T", "W", "V"), 
  y = c("May", "Oct", "Mar", "Aug", "Feb"),
  z = c(2010, 2015, 2018, 2017, 2019)
  )


###################### Exercise 6 ################################# 
# What would you input to get an output of 2015? Can you think of two ways to do it?




###################### Exercise 7 ################################# 
# How would you pull off only columns x and z? Can you think of two ways to do it?




###################### Exercise 8 ################################# 
# How would you modify the script below, to get an output of 22 24? 
s <- c(22, 24, 49, 18, 1, 6)
s[]



###################### Exercise 9 ################################# 
# What would be output if you entered: s[3, ]?  




###################### Exercise 10 ################################# 
# What would you input to get an output of 22 49? 




## Changing Data Type  

unique(BlackfootFish$species)  
## tells you the unique values of species

unique(BlackfootFish$section) 
## tells you the unique values of section  

BlackfootFish$speciesF <- as.factor(BlackfootFish$species)
## creates a new variable that is the factor version of species
BlackfootFish$sectionF <- as.factor(BlackfootFish$section)
## creates a new variable that is the factor version of section



BlackfootFish$speciesF <- factor(BlackfootFish$species, 
                                 levels = c("Bull", "Brown", "RBT", "WCT"))



###################### Exercise 11 ################################# 
# Year was saved as an integer data type (1989 - 2006), but it is a categorical variable (a factor).
# Write the code to create a new variable called yearF that is a factor of year. 




###################### Exercise 12 ################################# 
# Now, verify that yearF is viewed as a categorical variable, with the same levels as year.



## Issue with factors
BlackfootFish$yearF <- as.factor(BlackfootFish$year)
year_recover <- as.numeric(BlackfootFish$yearF)

ds <- data.frame(BlackfootFish$yearF, year_recover)
head(ds)

## Packages  

library(devtools)
library(tidyverse)



## Finding Help  

?str
help(str)

?Levels ##incorrect function name, case sensitive
??Levels ##looks through all installed packages for a match

?tidyverse

help(tidyverse)


## Functions  

# ?rep

rep(0, times = 10) ## repeating 0 three times

rep(times = 10, 0) ## switching order of arguments

rep(0, 10) ## no named arguments

rep(10, 0) ## not what we wanted!



mean(BlackfootFish$weight)  ## takes a numerical input, but there are NA's in our data

mean(BlackfootFish$weight, argument here! )  ## add in the argument that removes the NA's

median(BlackfootFish$species) ## gives an error because the input is not the correct data type  

cor(BlackfootFish$length, BlackfootFish$weight) ## takes multiple inputs separated by a comma

## Does cor have an option to remove NA's?


## Cleaning Data  

dim(BlackfootFish) ## gives the dimensions of the dataset in (row, column) format  

dim(na.omit(BlackfootFish)) 
## na.omit takes dataframes, matricies, and vectors and returns the object with incomplete cases removed (NA's removed)


## Subsetting Data  

BlackfootFish2 <- na.omit(BlackfootFish) 
## Creates a new dataframe, where the NA's have all been removed 


## Data Visualization  

### Scatterplots

#?plot()
plot(length ~ weight, 
     data = BlackfootFish2) 


plot(length ~ weight, 
     data = BlackfootFish2, 
     xlab = "Weight (grams)", 
     ylab = "Length (cm)", 
     las = 1) 
## adding in axis labels and changing orientation of axis labels


### Distribution

hist(BlackfootFish2$length) 


hist(BlackfootFish2$length, freq = F) ## converts to a density plot (area adds to 1) 


# Does freq need to be named?
hist(BlackfootFish2$length, FALSE)
## Why is there an error about the "number of breaks"?


hist(BlackfootFish2$length, freq = F, xlab = "Length", 
     main = "Fish Lengths in Blackfoot River") 
## adds x-axis label AND title to plot


hist(BlackfootFish2$length, freq = F, nclass = 50, 
     xlab = "Length", 
     main = "Fish Lengths in the Blackfoot River", 
     las = 1) 
## changes the number of bins and orientation of axis labels


### Side-by-Side Boxplots  

## What other options are available to add to your boxplot?
boxplot(weight ~ species, data = BlackfootFish2)


### Bar Charts  

section <- table(BlackfootFish2$section)
## tables the number of fish that were caught in each section

barplot(section, xlab = "Section", ylab = "Number of Fish", main = "Fish Caught by Section",
        las = 1, col = "blue", ylim = c(0, 12000))


###################### Exercise 13 ################################# 
# Using statistics or graphics, which year in our dataset had the most fish caught?  
  



###################### Exercise 14 ################################# 
# Make a boxplot of the fish weights over the different years in the dataset.  



