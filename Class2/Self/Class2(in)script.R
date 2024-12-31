
# Data Type ####

## Double data type ####

typeof(6)
typeof(6L)
typeof(TRUE)
typeof(T)
typeof("Cat")
typeof(3i+5)

x <- c(23, 26, 19, 30)
age
print(x)
age <- x
rm(x)

x <- 10
y <- 34
z <- 12

x + y
x - y
x / z

typeof(3,4,10)
typeof(c(3L, 4L, 10L))
typeof(c(3L, "male", 10L))
typeof(c(3L, 4, 10L))

mode(c(3L, 4, 10L))

x <- 1:100
x
x[3]

y <- 100:1
y
y[97]
y[77]
y[63]

y[c(1,2,3)]

z <- 10:1
z

mat1 <- matrix(c(1,2,3,4,5,6), ncol = 3, nrow = 2)
mat1

mat2 <- matrix(c(1,2,3,4,5,6), ncol = 2, nrow = 3)
mat2

mat1 %*% mat1
mat2 %*% mat1

x1 <- c("apple", "nokia", "samsung", "xiomi")
x1

"vivo" %in% x1

x <- c(T, T)
y <- c(T, F)

x | y
x & y

x <- c(1,2,3,4)
sum(x)
mean(x)
summary(x)
min(x)

mtcars
lm(mtcars)
summary(mtcars)

x <- c(23, 26, NA, 19, 30)
is.na(x)
which(is.na(x))
any(is.na(x))

x <- c(23, 26, 28, 19, 30)
x <- c(x[1:3], x[4:length(x)])

num1 <- c(23.4344, 34.4534467)

round(num1, digits=2)
floor(num1)
ceiling(num1)





