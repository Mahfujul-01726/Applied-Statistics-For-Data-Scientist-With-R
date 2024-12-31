# Common Data Types in R ####

# Examples of different data types in R
numeric_var <- 3.14          # Numeric
integer_var <- 10L           # Integer
logical_var <- TRUE          # Logical
character_var <- "Success"   # Character
complex_var <- 2 + 3i        # Complex

# Checking the type and mode
typeof(numeric_var)  # Output: "double"
mode(numeric_var)    # Output: "numeric"
typeof(integer_var)  # Output: "integer"
mode(integer_var)    # Output: "numeric"

# Combining Multiple Elements ####

# Using c() function to combine elements
numeric_vector <- c(1, 2, 3)
character_vector <- c("a", "b", "c")
logical_vector <- c(TRUE, FALSE, TRUE)

print(numeric_vector)  # Output: 1 2 3
print(character_vector)
print(logical_vector)

# Assignemnt Operators ####
# Assigning values using different operators
x <- 10
10 -> y
z = 20

# Arithmetic Operators ####

# Examples of arithmetic operations
sum_result <- 10 + 3        # Addition
sub_result <- 10 - 3        # Subtraction
div_result <- 10 / 3        # Division
mul_result <- 10 * 3        # Multiplication
exp_result <- 10^3          # Exponent
mod_result <- 10 %% 3       # Modulus
int_div_result <- 10 %/% 3  # Integer Division

# Print results
print(sum_result)  # Output: 13

# Relational Operators ####
# Examples of relational operations
print(4 < 2)         # FALSE
print(4 <= 10)       # TRUE
print(4 >= 4)        # TRUE
print(3 == 5)        # FALSE
print(3 != 5)        # TRUE
print('a' %in% c('b', 'a', 'c'))  # TRUE

# Logical Operators ####
# Examples of logical operations
print(TRUE & FALSE)  # FALSE
print(TRUE | FALSE)  # TRUE
print(!TRUE)         # FALSE

# Common Functions ####
# Statistical functions
nums <- c(10, 20, 30, 40, 50)
print(sum(nums))       # Sum
print(mean(nums))      # Mean
print(min(nums))       # Minimum
print(max(nums))       # Maximum

# Logical functions
print(any(is.na(nums)))  # Check for NA values
print(all(nums > 5))     # Check if all elements > 5

# Rounding functions
print(round(3.14159, 2)) # 3.14
print(floor(3.7))        # 3
print(ceiling(3.3))      # 4






