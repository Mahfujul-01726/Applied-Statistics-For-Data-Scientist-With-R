# Function----------------

sum_two_vals <- function(x, y){
  return(x+y)
}

sum_two_vals(x=3, y=10)

sum_twoo_vals <- function(x, y){
  print(paste("value of x=", x))
  print(paste("value of y=", y))
  return(x+y)
}

sum_twoo_vals(x=3, y=10)

sum_two_vals(x=3, y=10)


great <- function(name){
  cat("Hello, ", name, "!\n", sep = "")
}

great(name = "Ahasn")

check_even_odd <- function(number){
  if (number %% 2==0){
    return("Even")
  } else {
    return("Odd")
  }
}

print(check_even_odd(4))
print(check_even_odd(7))


## multiple argument and return ####

math.operation <- function(x, y, op) {
  switch(op,
         "add" = x + y,
         "subtract" = x - y,
         "multiply" = x * y,
         "divide" = if (y != 0) { x / y } else { "Division by zero" },
         "Invalid operation")
}

math.operation(10, 5, "add")
math.operation(10, 5, "divide")
math.operation(10, 0, "divide")


## default value ####

calculate_sqrt <- function(val, digit=3){
  return(round(sqrt(val), digit))
}

calculate_sqrt(24, 2)
calculate_sqrt(25, 2)

round(sqrt(1001), 2)

# Alternative way

calculate_sqrt1 <- function(val, digit=5){
  rooted <- sqrt(val)  # Corrected function name
  out <- round(rooted, digit)
  return(out)
}

calculate_sqrt1(22, 2)

## Scoping assignment ####

timer_env <- new.env()

begin <- function() {
  timer_env$begin_time <- Sys.time()
  message("Program started: ", timer_env$begin_time)
}

end <- function() {
  end_time <- Sys.time()
  runtime <- as.numeric(difftime(end_time, timer_env$begin_time, units = "secs"))
  message("Program end: ", end_time)
  message("Runtime: ", runtime, " seconds")
}

# Run the functions
begin()
Sys.sleep(3)
end()
# another 

begin <- function() {
  begin_time <<- Sys.time()  # Global assignment
  message("Program started: ", begin_time)
}
begin()

end <- function() {
  end_time <- Sys.time()
  runtime <- as.numeric(format(end_time, "%S")) - as.numeric(format(begin_time, "%S"))
  message("Program end: ", end_time)
  message("Runtime: ", runtime, " seconds")
}

end()


## invisible ####


trial_func_ret <- function(x) {
  res <- mean(x)
  return(res)
}

trial_func_inv <- function(x) {
  res <- mean(x)
  invisible(res)
}


vals <- c(4, 5, 2, 6, 9)

trial_func_ret_x <- vals
trial_func_inv_x <- vals

a <- trial_func_inv_x * vals

result_ret <- trial_func_ret(vals)
result_inv <- trial_func_inv(vals)  # Will not print the result unless explicitly called
print(result_inv)  # To display the result returned by invisible()


# another 

visible_sum <- function(x, y) {
  result <- x + y
  return(result)  # Explicitly returns and shows the result
}

# Call the function
visible_sum(5, 3)

invisible_sum <- function(x, y) {
  result <- x + y
  invisible(result)  # Returns the result but hides it from the console
}

# Call the function
invisible_sum(5, 3)

pipeline_example <- function(x) {
  step1 <- x + 1
  step2 <- step1 * 2
  invisible(step2)  # Hides intermediate steps while keeping the result available
}

result <- pipeline_example(5)
print(result)  # Only prints if explicitly called


# temporary function
mat1 <- matrix(c(1, 2, 3, 4), ncol = 2, nrow = 2, byrow = TRUE)

apply(mat1, 1, function(x) sum(x)^2)
apply(mat1, 2, function(x) sum(x)^2)

# wrapper mean function
wrapper_mean <- function(data, ...) {
  if (is.numeric(data)) {
    mean(data, ...)
  } else {
    warning("Data is not numeric")
  }
}

wrapper_mean(c(2, 4, 5, 4, 3))
wrapper_mean(c(2, 4, 5, NA, '3'))
wrapper_mean(c(2, 4, 5, NA, '3'), na.rm = TRUE)
wrapper_mean(c(2, 4, 5, NA, 3), na.rm = TRUE)

# function as argument
apply_function <- function(vec, funct) {
  return(funct(vec))
}


## Function as argument ####

apply_function <- function(vec, fun){
  return(fun(vec))
}

apply_function(c(1,2,3,4), fun=mean) 

## Roxygen comments ####

# Roxygen comments

#' @title calculate sort
#' @description Calculates square root of the numbers
#' @param val numeric vector or length 1 or more
#' @param digit numeric value
#' @return numeric vector that is squared root of the passed vector
#' # @examples
#' # calculate_sqrt(c(6,10,453), 4)

# calculate_sort(c(2,3,4), 2)  # This line is likely a call to a function not shown in the image.

calculate_sqrt <- function(val, digit = 3) {
  return(round(sqrt(val), digit))
}



















