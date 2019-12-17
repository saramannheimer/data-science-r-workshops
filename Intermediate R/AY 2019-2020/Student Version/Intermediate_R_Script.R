
###################################### Relational Operators ###################################### 

w <- 10.2 
x <- 1.3
y <- 2.8 
z <- 17.5
dna1 <- "attattaggaccaca"
dna2 <- "attattaggaacaca"

###################### Equality ###########################
dna1 == dna2
dna1 != dna2

###################### Inequality ###########################
w > 10
x <= y

###################### Inclusion ###########################
colors <- c("green", "pink", "red")

"blue" %in% colors

numbers <- c(1, 2, 3, 4, 5)

5 %in% numbers

letters <- c("a", "b", "c", "d")

c("a", "b", "e") %in% letters

####################################### Exercise 1  #####################

# write R code to see if

# "hello" is greater than or equal to "goodbye"
"hello" >= "goodbye"
"hello" >= "Hello"

# TRUE is greater than FALSE
TRUE > FALSE

sum(c(TRUE, TRUE, TRUE, FALSE))

# dna1 is longer than 5 bases (use nchar() to figure out how long a string is)
nchar(dna1) > 5 

###################################### Which ####################### 

x <- c(3, 5, 7, 9, 11, 13, 15)  

which(x > 8) 

which(x == 9)

## Challenge: How would you use the indicies from these which statements to extract 
# the elements of x that meet the criteria?

x[which(x == 10)]

##################################### Matrices ####################### 

# The following are dating data, of one person's messages received per day for one week

okcupid <- c(16, 9, 13, 5, 2, 17, 14)
match <- c(17, 7, 5, 16, 8, 13, 14)
messages <- data.frame(okcupid = okcupid, match = match)
# This makes the data from OkCupid the first column and the data from Match the second column
row.names(messages) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", 
                         "Saturday", "Sunday")

x <- c(1, 2, 3) 
x > 2

messages > 4

q <- which(messages$okcupid > 10)

messages[q, ]

##################################### Exercise 2  #####################
# Use the messages matrix to return a matrix of LOGICAL values that answers 
# the following question:

# For what days were the number of messages at either site greater than 12? 


##################################### Exercise 3  #####################
# Use the messages matrix to return the INDICIES of messages that answers the 
# following questions:

# when were the messages at OkCupid equal to 13?


# when were the number of messages at Match greater than the messages at OkCupid? 


# Challenge: Use the indicies from above to extract the rows of the message matrix 
# that meet the criteria!


##################################### Subset ############################ 

x <- c(3, 5, 7, 9, 11, 13, 15)  

sad_days <- subset(messages, okcupid > 6)

# Challenge: Change the which() statement code to a subset() statement, 
# extracting the days that the number of messages at Match greater than the messages at OkCupid

greater <- subset(messages, match > okcupid)


###################################### Logicals ##################################################

c(TRUE, TRUE, FALSE) & c(TRUE, FALSE, FALSE)

c(TRUE, TRUE, FALSE) | c(TRUE, FALSE, FALSE)

c(TRUE, TRUE, FALSE) && c(TRUE, FALSE, FALSE)

##################################### Exercise 4 ########################### 

# Is the last day of the week under 5 messages or above 10 messages? 
# (hint: last <- tail(okcupid, 1) could be helpful)
last <- tail(okcupid, 1)


# Is the last day of the week between 15 and 20 messages, excluding 15 but including 20?


##################################### Subset ########################### 

bad_days <- subset(messages, okcupid < 6 | match < 6)

bad_days

good_days <- subset(messages, okcupid > 10 & match > 10)

good_days


###################################### Conditional Statements #####################################


##################### IF ########################### 

y <- -3 

if(y < 0){
  "y is a negative number"
}

y <- c(-1, 5)

##################################### Exercise 5 ########################### 

# Using the last number from above, write an if statement that prints 
# "You're popular!" if the number of messages exceeds 10.
# hint: use the last day of the week for okcupid that you made above




##################### IF ELSE ########################### 


y <- -3 
if(y < 0){
  "y is a negative number"
  }else{
  "y is either postive or zero"
}

y <- c(-1, 0, 5)

ifelse(y < 0, "y is a negative number", "y is either postive or zero")



##################################### Exercise 6 ###########################

# Using the if statement from Exercise 5 add the following else statement: 
# When the if-condition on messages is not met, R prints out "Send more messages!". 



# Challenge: Rewrite the if, else function from above using R's built in ifelse() function. 


##################### ELSE IF ########################### 

y <- -3 

if(y < 0){
  "y is a negative number"
}else if(y == 0){
  "y is zero"
}else{
  "y is positive"}

y <- 5


##################### Mutually Exclusive ########################### 

x <- 6

if(x %% 2 == 0){
  "x is divisible by 2"
}else if(x %% 3 == 0){
  "x is divisible by 3"
}else{"x is not divisible by 2 or 3"}


###################################### Loops ##################################################

sim <- 100
# Define a counter variable to determine how many t-values to use

u <- rt(sim, 32)
# Draw sim random t-values, from a t-distribution with 32 degrees of freedom 

# Initialize `usq` (could have used a single NA or 0 initialization)
usq <- rep(NA, sim)

# This loop calculates the square of elements drawn from a t-distribution

for(i in 1:sim) {
  # i-th element of `u1` squared into i-th position of `usq`
  usq[i] <- u[i]^2
  print(c(u[i], usq[i]))
}

i ## should be 100 (the same as sim), unless the loop had issues!

##################### Exercise 7 ###########################

# How could the above calculation be done outside of a loop? 

usq <- u^2

##################### Exercise 8 ###########################

# Read in the BlackfootFish dataset and modify the code to write a `for-loop` 
# to find the indices needed to sample every 7th row from the dataset, 
# starting with the 1st row, until you've sampled 1900 rows. 

BlackfootFish <- read.csv("BlackfootFish.csv", header = TRUE)

size <- 1900

samps <- NA
## initializing the samps vector, for storing indicies

samps[1] <- 1
## setting first sample index to 1 (first row)

# code snippet: 
# create the code for the process will be executed at each step
# e.g. how will you get the next sample after 1?

for(i in 2:#ending index here){
    samps[i] <- # process you execute at every index
    }

testing <- BlackfootFish[samps, ]
training <- BlackfootFish[-samps, ]


##################### Nested For Loops ########################### 

# Create a 30 x 30 matrix (of 30 rows and 30 columns)
mymat <- matrix(nrow = 30, ncol = 10)

# verify the dimensions of mymat
dim(mymat)

# pull off number of rows for first loop
dim(mymat)[1]

# pull off number of columns for second loop
dim(mymat)[2]


# For each entry in the matrix: assign values based on its position (the product of two indices)
for(i in 1:dim(mymat)[1]){
  for(j in 1:dim(mymat)[2]){
    mymat[i,j] <- i*j
  }
}

# Just show the upper left 13x10 piece 
mymat[1:13, ]


###################################### Functions ################################################## 

# Code snippet repeated over and over:

(BlackfootFish$length - min(BlackfootFish$length, na.rm = TRUE)) / 
  (max(BlackfootFish$length, na.rm = TRUE) - min(BlackfootFish$length, na.rm = TRUE))


##################### Exercise 9 ########################### 

# Modify the code snippet above to instead refer to a temporary variable x.

scale_function <- function(x){
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

scaled_wgt <- scale_function(BlackfootFish$weight)

rng <- range(1:5)
rng[1]
rng[2]

##################### Exercise 10 ########################### 

# Create an intermediate variable called rng that contains the range of x, using the `range() function.
# Make sure that you specify the na.rm() option to ignore any NAs in the input vector. 

# Create rng 


# Rewrite the code snippet from Excercise 8 to now refer to rng


##################### Exercise 11 ########################### 

# Using the function template below, write a function that rescales a vector to be between 0 and 1.
# The function should take a single argument, x.   

myfunction <- function(arg1,...){
  # body 
}

##################### Exercise 12 ########################### 

# Test your function on a simple vector, with the same name as your function's input. 
# What do you expect the values of the test to be after you input it into your function? 



##################### Exercise 13 ########################### 

# Test your function on the length column of the BlackfootFish dataset. Inspect the rescaled values. Do they look correct?  
  

##################### Function Scoping ########################### 

x <- 10
## globally defined variable 

f <- function(){
  ## locally defined x and y
  x <- 1 
  y <- 2
  c(x, y)
}

f()

x


g <- function(){
  ## locally defined y
  y <- 2
  c(x, y)
}

x <- 15

g()

x <- 20

g()


##################### Exercise 14 ########################### 

# Putting it All Together!

matrix <- data.frame(l = BlackfootFish$length, w = BlackfootFish$weight)


# Given the matrix of fish lengths and weights above, 
# use the tools from the workshop (`for loop`, function, conditional and relational statements) to:  

# 1. compute the condition index of each fish 
# 2. remove the fish from the dataset whose condition index is NA or less than 2



