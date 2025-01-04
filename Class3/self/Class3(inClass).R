# Data structure
# Author: Md mahfujul karim Sheikh
# Date: 03-01-25


# Vector -----------

x1 <- c(10, 15, 20, 21, 24, 14, 20, 19)
is.vector(x1)
is.data.frame(x1)

## Random number generator

set.seed(123)
x2 <- sample(1:100, 10)
x2

# set.seed(1234)
# x9 <- sample(1:100, 10)
# x9
# summary(x2)

sample(1:10, 8)
sample(1:10, 8, replace=TRUE)
table(sample(1:10, 8, replace=TRUE))

sample(c("Apple", "Banana", "Mango"), 2)

sample(x = c("Apple", "Banana", "Mango", "Lichi"), size = 2, prob = c(0.25, 0.25, 0.25,0.25), replace=FALSE)


income=c(10000, 25000, 40000, 25000)
household=c(10,5,2,4)
sample(income, size=2, prob=household)

household/sum(household)


# set.seed(0)
# x8 <- runif(10)
# x8


x3 <- runif(10)
x3

help(sample)


## Sequence Generator

x4 <- seq(from=1, to=11, by=2)
x4

x5 <- seq(from =1, to = 11, length.out=5)
x5

# Talk Later
seq(from =1, to = 11, length.out=5)
seq(from =1, to = 11, along.with=5)

x6 <- 10:1
x6

seq_len(10)

## Selection
x1>19
x1[c(FALSE, FALSE, TRUE, TRUE,TRUE,FALSE,TRUE,FALSE)]
x1[c(3,4,5,7)]
x1[x1>19]
x1[x1 > 14 & x1 < 20]
which(x1 > 14 & x1 < 20)

## replace
replace(x1, x1>19, 15)
x1[x1>19] <- 15
x1

# replace(x1, which(x1>19), 15)
# x1[x1>19] <- 15
# x1

x1[x1==0] <-15
x1


# replace(x1, x1>19, NA)
# x1 <- replace(x1, which(x1>19), 15)
# mean(x1, n.rm=TRUE)
# mean


# x1 <- replace(x1, x1 > 19, NA)
# 
# x1 <- replace(x1, which(x1 > 19), 15)
# 
# mean_x1 <- mean(x1, na.rm = TRUE)
# 
# print(mean_x1)


# Matrix ---------
mat1 <- matrix(c(1,2,3,4), ncol=2, nrow=2, byrow=TRUE)
mat1
is.matrix(mat1)

is.matrix(matrix(c(0,10, 2), ncol=3))
is.matrix(c(0,10,2))

mat1[,]
mat[1,]
mat[,2]
mat[1,2]
mat[1,2] <- 0
mat1

## Matrix multiplication

# Creating the first matrix
matrix1 <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
print(matrix1)

# Creating the second matrix
matrix2 <- matrix(c(7, 8, 9, 10, 11, 12), nrow = 3, ncol = 2)
print(matrix2)

# Multiplying the two matrices
result <- matrix1 %*% matrix2
print(result)

# Checking the dimensions of the first matrix 
dim_matrix1 <- dim(matrix1) 
print(dim_matrix1) 

# Checking the dimensions of the second matrix 
dim_matrix2 <- dim(matrix2) 
print(dim_matrix2)

## Kroncker Product  

# Computing the Kronecker product
kronecker_product <- kronecker(matrix1, matrix2)
print(kronecker_product)

# Data Frame
# Creating vectors
names <- c("Alice", "Bob", "Charlie")
ages <- c(25, 30, 35)
genders <- c("Female", "Male", "Male")

# Creating a DataFrame
df <- data.frame(Name = names, Age = ages, Gender = genders)

# Printing the DataFrame
print(df)

df1 <- data.frame(id = c(1,2,3),
                  age= c(24, 23, 19),
                  gender = c("F", "M", "F"), stringAsFactors=TRUE)
df1
is.data.frame(df1)
summary(df1)

#  Data Frame ------------

df1 <- data.frame(id = c(1,2,3,4),
                  age = c(24, 23, 19, 10),
                  gender = c("F", "M", "F", "F"),
                  location = c("rural","urban","rural","urban"),
                  stringsAsFactors = TRUE)
df1
is.data.frame(df1)
summary(df1)


is.character(c("F","M","F","F"))
as.factor(c("F","M","F","F"))
is.factor(c("F","M","F","F"))
is.numeric(as.factor(c("F","M","F","F")))

## Subsetting

df1$id
df1$age
mean(df1$age)
df1$gender

## row and column names

rownames(df1)
rownames(df1) <- c("person 1", "galib", "kashem", "roni")
rownames(df1)
colnames(df1) <-c('id','age','gender','location' )
colnames(df1)=="age"
colnames(df1)[colnames(df1)=="age"] <- "Age_of_respondent"


## Filter

df1[2,]
df1[c(1,4),]
df1$Age_of_respondent <= 23
is.na(df1$Age_of_respondent)
df1[df1$Age_of_respondent <= 23 & !is.na(df1$Age_of_respondent),]


# Add a new column

df1$height <- c(5,6,5.5,6.1)
df1


df1$age_in_months <- df1$Age_of_respondent * 12


# List--------------
ls1 <- list(c(1,2,3), c(24,23,19), c("F","M","F","M"))
ls1

ls1[[1]]
ls1[[2]]
ls1[[3]]

# List ---------------

ls1 <- list(c(1,2,3), c(24,23,19), c("F","M","F"))
ls2 <- list(id = c(1,2,3), age = c(24, 23, 19), gender = c("F","M","F"))
ls3 <- list(id = c(1,2,3), age = c(24, 23, 19), gender = c("F","M","F"), array1 = arr1)
ls3






