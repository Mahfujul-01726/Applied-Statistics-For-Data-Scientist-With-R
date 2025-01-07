# =================================================== #
# Data Structures
# Author(s): Md.Mahfujul karim Sheikh
# Date: Class 03 at 4 Jan 2025
# =================================================== #


# Vector ----------------------------------------

x1 <- c(10,15, 20, 21,24,13,20,19)
is.vector(x1)
is.data.frame(x1)
length(x1)

# Accessing R vector elements ####

# R program to access elements of a Vector

# accessing elements with an index number.
X<- c(2, 5, 18, 1, 12)
cat('Using Subscript operator', X[2], '\n')

# by passing a range of values
# inside the vector index.
Y<- c(4, 8, 2, 1, 17)
cat('Using combine() function', Y[c(4, 1)], '\n')


## MOdifying a R vector ####
# R program to modify elements of a Vector

# Creating a vector
X<- c(2, 7, 9, 7, 8, 2)

# modify a specific element
X[3] <- 1
X[2] <-9
cat('subscript operator', X, '\n')

# Modify using different logics.
X[1:5]<- 0
cat('Logical indexing', X, '\n')

# Modify by specifying 
# the position or elements.
X<- X[c(3, 2, 1)]
cat('combine() function', X)


### Deleting a R vector ####
# R program to delete a Vector

# Creating a Vector
M<- c(8, 10, 2, 5)

# set NULL to the vector
M<- NULL
cat('Output vector', M)

#### Sorting elements of a R vector ####
# R program to sort elements of a Vector

# Creation of Vector
X<- c(8, 2, 7, 1, 11, 2)

# Sort in ascending order
A<- sort(X)
cat('ascending order', A, '\n')

# sort in descending order 
# by setting decreasing as TRUE
B<- sort(X, decreasing = TRUE)
cat('descending order', B)

## Random number generator

set.seed(1)
x2 <- sample(1:100, 10)
x2
summary(x2)

# Generating Random numbers from a Binomial Distribution

random_binomial <- rbinom(5, size = 10, prob=0.5)
print(random_binomial)


sample(1:10, 8, replace = TRUE)
set.seed(42)
table(sample(1:10, 8, replace = TRUE))

sample(x = c("Apple","Banana","Mangoo","Lichi"), size = 2, prob = c(0.25,0.25,0.25,0.25),
       replace = FALSE) 

income = c(10000, 25000, 40000, 28000)
household = c(10, 5, 2, 4)
sample(income, size = 2, prob = household)

household / sum(household)


# Generating Random Numbers from  a Uniform Distributation
random_uniform <- runif(1)  # Generates one random number between 0 and 1
print(random_uniform)

set.seed(0)
x3 <- runif(10)*10
x3

## Sequence generator

x4 <- seq(from = 1, to = 11, by = 2)
x4

x5 <- seq(from = 1, to = 11, length.out = 6)
x5

seq_len(10)

x6 <- 10:1
x6

## selection

x1 > 19
x1[3]
length(x1)
x1[c(FALSE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)]
x1[c(3,4,5,7)]
x1[x1 > 19]
x1[x1 > 14 & x1 < 20]
which(x1 > 14 & x1 < 20)
x1[which(x1 > 14 & x1 < 20)]


## replace
# doesn't replace original one
replace(x1, x1 > 19, 0)
x1 <- replace(x1, which(x1 > 19), 0)

# replaces original one
x1[x1 == 0] <- 15
x1

x1 <- c(10, 15, 20, 21, 24, 13, 20, 19)
mean(x1, na.rm = TRUE)

# Matrix ------------------------------------------------------------------

mat1 <- matrix(c(1, 2, 3, 4), ncol = 2, nrow = 2, byrow = TRUE)
mat1
is.matrix(mat1)

is.matrix(matrix(c(0,10,2), ncol = 3))
is.matrix(c(0,10,2))


mat1[,]
mat1[1,]
mat1[,2]
mat1[1,2]
mat1[1,2] <- 0
mat1 

mat2 <- matrix(c(0, 5, 6, 7), 2, byrow = TRUE)
mat2

mat1 + mat2
mat1 - mat2
mat1 + 10
mat1 - 10

mat3 <- matrix(c(9, 8, 1, 3, 5, 7), 3, byrow = TRUE)
mat3

as.vector(mat3[,2])

mat4 <- matrix(c(1,2,3,4,5,6,0,2,4), ncol = 3)
mat4
diag(mat4)

10
1/10
solve(mat4)

det(mat4)


## Element wise multiplication (Hadamard multiplication)

mat1 * mat2

## matrix multiplication

mat1 %*% mat2 
dim(mat1)
dim(mat2)
dim(mat1 %*% mat2)

mat1 %*% mat3  # will raise an error
dim(mat1)
dim(mat3)
dim(mat1 %*% mat3)

mat3 %*% mat1  # it will work
dim(mat3)
dim(mat1)
dim(mat3 %*% mat1)


## Kronecker Product

mat1 %x% mat2
mat1 %x% mat3


# Array -------------------------------------------------------------------

arr1 <- array(c(1:12), c(2,3,2))
arr1


# Data Frame --------------------------------------------------------------

df1 <- data.frame(id = c(1,2,3, 4), 
                  age = c(24, 23, 19, NA), 
                  gender = c("F","M","F", "F"),  
                  location = c("rural","urban","rural","sub-urban"),
                  stringsAsFactors = TRUE)
df1

is.data.frame(df1)
summary(df1)

is.character(c("F","M","F", "F"))
as.factor(c("F","M","F", "F"))
is.factor(as.factor(c("F","M","F", "F")))
is.numeric(as.factor(c("F","M","F", "F")))

## subsetting

df1$id
df1$age
mean(df1$age, na.rm = TRUE)
df1$gender

## row and column names

rownames(df1)
rownames(df1) <- c("person 1", "galib", "kashem", "roni")
rownames(df1)

df1

colnames(df1) <- c('id','age','gender','location')
colnames(df1) == "age"
colnames(df1)[colnames(df1) == "Age"] <- "age_of_respondent"



if("age" %in% colnames(df1)) {
  colnames(df1)[colnames(df1) == "age"] <- "age_of_respondent"
} else {
  message("Column 'age' not found in dataframe.")
}

## Filter

df1
df1[2,]
df1[c(1,4),]
df1$age_of_respondent <= 23
!is.na(df1$age_of_respondent)
df1[df1$age_of_respondent <= 23,]
df1[df1$age_of_respondent <= 23 & !is.na(df1$age_of_respondent),]

## add new column

df1$height <- c(5, 6, 5.5, 6.1)
df1

df1$age_in_months <- df1$age_of_respondent * 12
df1

# List --------------------------------------------------------------------

ls1 <- list(c(1,2,3), c(24,23,19), c("F","M","F","M"))
ls1

ls1[[1]]
ls1[[1]][3]
ls1[[2]]
ls1[[3]]
ls1[[3]][4]

ls2 <- list(id = c(1,2,3), age = c(24, 23, 19), df = df1)
ls2

ls2$df
is.data.frame(ls2$df)
is.data.frame(ls2)

str(ls2)

ls3 <- list(id = c(1,2,3), age = c(24, 23, 19), df = df1, array1 = arr1)
ls3




