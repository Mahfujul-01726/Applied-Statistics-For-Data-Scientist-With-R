#=========================================
# Conditional statements, Loops and Functions
# Author(s): Md. Mahfujul Karim Sheikh
# Date: Class 04 at 4 Jan 2025
#=========================================

print("Hello")
1+5

print("Hello")
1+5

print("Hello"); 1+5


# conditional---------------

x <- -3

if (x>0)  {
  print("x is positive")
} else{
  print("x is not positive")
}


x <- 0
if (x > 0) {
  print("x is positive")
} else if (x < 0) {
  print("x is negative")
} else {
  print("x is zero")
}


x <- -7
if (x > 0){
  print("x is positive")
} else if (x < 0){
  print("x is negative")
} else {
  print("x is zero")
}


## Vectorized version ####

x <- c(1,3,0,5,99)
ifelse(x>90, "Yes", "No")
ifelse(x>90, "Yes", ifelse(x==0, "zero", "No"))

## switch ####

operation <- "square"
val <- 9

switch(operation,
       "square" = val^2,
       "root" = sqrt(val),
       "Invalid operation"
)

operation <- "root"
val <- 9

switch(operation,
       "square" = val^2,
       "root" = sqrt(val),
       "Invalid operation"
)

operation <- "dot"
val <- 9

switch(operation,
       "square" = val^2,
       "root" = sqrt(val),
       "Invalid operation"
)


# Loop------------

## for loop ####

numbers <- c(2,4,6,8)
for (i in numbers){
  print(paste("square of", i, "is", i^2))
}

## while loop ####

count <- 5
while (count > 0) {
  print(count)
  count <- count - 1
}


## repeat ####

repeat{
  print("This is an infinite loop. Press ESC to stop.")
  Sys.sleep(1)
}



# stop when counter exceeds 5
counter <- 1
repeat {
  print(counter)
  counter <- counter + 1
  if (counter > 5){
    break
  }
}

#alternative way
cumsum(1:10)

repeat {
  input
}


# user input

readline()

x <- as.interger(readline("Enter your number"))
repeat {
  input <- as.integer(readline(prompt = "Enter a number between 1 and 10: "))
  if (is.na(input) || input >= 1 && input <= 10) {
    print(paste("You entered:", input))
    break
  } else {
    print("Invalid input, try again.")
  }
}

# Corrected code
x <- as.integer(readline("Enter your number: "))
repeat {
  input <- as.integer(readline(prompt = "Enter a number between 1 and 10: "))
  if (!is.na(input) && input >= 1 && input <= 10) {
    print(paste("You entered:", input))
    break
  } else {
    print("Invalid input, try again.")
  }
}

## Apply functions ####
mat <- matrix(1:9, nrow = 3, byrow = TRUE)
mat
sum(mat)
apply(mat, 1, sum)  # Sum of each row
apply(mat, 2, sum)  # Sum of each column

rowsum <- numeric(3)
rowsum

## tapply ###

# tapply performs operations on subsets of the object of interest
df <- data.frame(age = c(22, 20, 24, 19, 23),
                 gender = c("M", "M", "F", "M", "F"),
                 location = c("Rural", "Urban", "Urban", "Rural", "Rural"),
                 stringsAsFactors = TRUE)

df

tapply(X = df$age, INDEX = df$gender, FUN = mean)
tapply(X = df$age, INDEX = list(df$gender, df$location), FUN = mean)


## tapply performs operations on subsets of the object of interest
df <- data.frame(age = c(22, 20, ,NA,24, 19, 23),
                 gender = c("M", "M", "F", "M", "F"),
                 location = c("Rural", "Urban", "Urban", "Rural", "Rural"),
                 stringsAsFactors = TRUE)

df

# Using tapply with mean and handling NA values
tapply(X = df$age, INDEX = df$gender, FUN = mean, na.rm = TRUE)
tapply(X = df$age, INDEX = list(df$gender, df$location), FUN = mean, na.rm = TRUE)

## Creating a list example
ls3 <- list(id = c(1, 2, 3), age = c(24, 23, 19))
ls3


ls3 <- list(id = c(1,2,3), age = c(24,23,19), df = df1)
lapply(ls3, is.data.frame)
sapply(ls3, is.data.frame)







