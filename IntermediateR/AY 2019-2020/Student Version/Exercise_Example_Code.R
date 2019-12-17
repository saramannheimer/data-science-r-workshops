############################### EXERCISE 9 ##################################################

BlackfootFish <- read.csv("BlackfootFish.csv", header = TRUE)

size <- 1900
# how many rows of the dataset we wish to sample 

samps <- NA
# initializing the samps vector, for storing indicies of the sampled rows

samps[1] <- 1
# setting first sample index to 1 (first row)

# code snippet: 
# create the code for the process will be executed at each step
# e.g. how will you get the next sample after 1?

for(i in 2:size){
  samps[i] <- samps[i-1] + 7 
  # from the previous row (i-1), sample the next row 7 positions away 
}

testing <- BlackfootFish[samps, ]
# subsetting the dataset to only include the rows selected in the samps vector

training <- BlackfootFish[-samps, ]
# subsetting the dataset to include all rows EXCEPT the rows selected in the samps vector





############################### EXERCISE 9 ##################################################

(x - min(x, na.rm = TRUE)) / 
  (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))





############################### EXERCISE 10 #################################################

rng <- range(x, na.rm = TRUE)
# range function returns a list of two outputs,
# the first element is the minimum and the second element is the maximum

(x - rng[1]) / (rng[2] - rng[1])





############################### EXERCISE 11 #################################################


scale_function <- function(x){
  ## function to compute rescaling of numerical variable to be between 0 and 1 
  ## x = vector of data to be rescaled 
  
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
  




############################### EXERCISE 12 #################################################

x <- c(0, 1, 2, 3, 4, 5)

scale_function(x) 
# should return only values between 0 and 1
# the minimum value should be 0 and the maximum value should be 1 





############################### EXERCISE 12 #################################################

scaled_length <- scale_function(BlackfootFish$length)

summary(scaled_length)
# numerically check to see if all values are between 0 and 1

hist(scaled_length)
# visually check to see if the values are between 0 and 1 





################################# EXERCISE 14 #################################################

matrix <- data.frame(l = BlackfootFish$length, w = BlackfootFish$weight)

condition <- function(w, l){
  ## function to compute condition number of fish 
  ## w = width  
  ## l = length  
  
  ## checks if w OR l are NA before computing condition
  ifelse(is.na(w) == FALSE | is.na(l) == FALSE, 
         ((w^(1/3))/l)*50, 
         NA)
}


## looping over the rows (dim[1]) of weights and lengths to calculate the condition 
## don't need to initialize the storage vector, since it is stored in the matrix dataframe
for(i in 1:dim(matrix)[1]){
  matrix$c[i] <- condition(matrix$w[i], matrix$l[i])
}

## OR you could use a vectorized version 
matrix$condition <- condition(matrix$w, matrix$l)



clean_matrix <- subset(matrix, is.na(c) != TRUE | c < 2)
# subsetting the matrix dataframe to have conditions that are bigger than 2 and not NAs

########################### ALTERNATIVE SOLUTION #######################################

condition <- function(data){
  ## function to compute condition number of fish 
  ## data = dataframe
  ## columns of data MUST BE NAMED l & w  
  
  ## checks if weight OR length are NA before computing condition
  w <- data$w
  l <- data$l
  ifelse(is.na(w) == FALSE | is.na(l) == FALSE, 
         c <- ((w^(1/3))/l)*50, 
         c <- NA
  )
  
  return(c)
}

## using the function to create a new column in the matrix dataframe
matrix$condition <- condition(matrix)

## using subset to remove the rows where the condition index is NA
clean_matrix <- subset(matrix, is.na(condition) != TRUE | condition < 2)
