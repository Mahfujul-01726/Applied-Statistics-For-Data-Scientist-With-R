
# =================================================== #
# Descriptive Statistics and EDA
# Author(s): MD MAHFUJUL KARIM SHEIKH
# Date: Class 08 at 18 January 2025
# Description: Common measure of central tendency, dispersion, and EDA packages
# Data: Available in the Data folder.
# =================================================== #

library(dplyr)


# Mean --------------------------------------------------------------------

x <- c(18, 22, 17, 9, 16, 11, 23, 15, 10, 12, 27, 26, 13, 17, 13, 7, 15, 18, 16, 25)
hist(x, freq = T)


# Arithmetic mean
mean(x)

# Geometric mean
prod(x) ^ (1 / length(x)) 
exp(mean(log(x)))

# Harmonic mean
length(x) / sum(1 / x)
# install.packages("psych")
library(psych)
harmonic.mean(x)


# Weighted mean

library(readxl)
cgpa <- read_xlsx("D:\\RProgramming\\Class9\\Data\\CGPA.xlsx")  # Load the data

mean(cgpa$`Grade Point`)

weighted.mean(x = cgpa$`Grade Point`, w = cgpa$`Credit Hours`)



# Median ------------------------------------------------------------------

median(x)

# Mode --------------------------------------------------------------------
# install.packages("DescTools")
library(DescTools)
Mode(x)

table(x)

as.numeric(names(table(x))[table(x) == max(table(x))])



# Mean, Median vs Mode ----------------------------------------------------

y <- c(7, 17, 59, 32, 10, 12, 10, 27, 26, 468, 17, 21, 944, 45, 35, 35, 1307, 6)
hist(y)
mean(y)
median(y)
Mode(y)


satellites <- read_excel("D:\\RProgramming\\Class9\\Data\\Satellites.xlsx")
hist(satellites$Satellites)
mean(satellites$Satellites)
median(satellites$Satellites)
Mode(satellites$Satellites)



# Quantile (Percentile) -------------------------------------------------

z <- c(338, 331, 322, 336, 317, 319, 292, 320, 321, 310, 329, 308, 
       340, 309, 283, 315, 312, 312, 287, 307, 287, 325, 290, 286, 295, 
       296, 301, 320, 321, 311)
summary(z)

quantile(z, probs = 0.6)
quantile(z, probs = c(0.3, 0.9))

quantile(z, probs = seq(0, 1, by = 0.05))
quantile(satellites$Satellites, probs = seq(0, 1, by = 0.05))
quantile(z, probs = 0.5)
median(z)
IQR(z)

# Q1 = 25% percentile
# Q3 = 75% percentile
# IQR = Q3 - Q1 
as.numeric(quantile(z, 0.75) - quantile(z, 0.25))


# Range -------------------------------------------------------------------

max(z) - min(z)
quantile(z, 1) - quantile(z, 0)
range(z)
summary(z)

# Variance ----------------------------------------------------------------

var(z)    # sample variance
var(z)*(length(z)-1)/length(z)  # for population variance


# Standard Deviation ------------------------------------------------------

sd(z)     # sample SD
sqrt(var(z))

iris %>% 
  group_by(Species) %>% 
  summarize(Minimum = min(Sepal.Length),
            Maximum = max(Sepal.Length),
            Range = Maximum - Minimum,
            Variance = var(Sepal.Length),
            SD = sd(Sepal.Length),
            IQR = IQR(Sepal.Length),
            CV = SD/mean(Sepal.Length)) %>% 
  
  knitr::kable(format = "html", digits = 3) %>% 
  kableExtra::kable_styling(latex_options = c("hold_position", "repeat_header"))

# install.packages("kableExtra", repos = "https://cloud.r-project.org/")


# Skewness and Kurtosis ---------------------------------------------------

set.seed(42)
sample_data <- data.frame(
  vec_1 = rnorm(5000),
  vec_2 = rt(5000, 12),
  vec_3 = rpois(5000, 1)
)

table(sample_data$vec_3)

# install.packages("ggplot2", repos = "https://cloud.r-project.org/")


library(ggplot2)
sample_data %>% 
  tidyr::pivot_longer(cols = vec_1:vec_3, names_to = "var", values_to = "vals") %>% 
  ggplot() +
  geom_density(aes(x = vals, fill = var), alpha = 0.6) +
  facet_wrap(~var, ncol = 2) +
  theme_bw() +
  labs(x = NULL, y = "Density")

library(psych)
describe(sample_data)

summary(sample_data)

library(DescTools)
Skew(sample_data$vec_2)
Kurt(sample_data$vec_2)

library(e1071)                    
skewness(sample_data$vec_2)  
kurtosis(sample_data$vec_2) 

# install.packages("moments", repos = "https://cloud.r-project.org/")


library(moments)
moments::skewness(sample_data)
moments::kurtosis(sample_data)


# EDA with packages -------------------------------------------------------

student <- read_excel("D:\\RProgramming\\Class9\\Data\\StudentSurveyData.xlsx")
str(student)
summary(student)

aggregate(
  x = student[['Age']],
  by =  list(Gender = student[['Gender']]),
  FUN = mean, 
)

## dplyr ####

library(dplyr)

student %>% 
  group_by(Gender, `Grad Intention`) %>% 
  summarize(Total = n(), MeanAge = mean(Age)) %>% 
  mutate(Percentage = Total / sum(Total))

student %>% 
  group_by(Gender, `Grad Intention`) %>% 
  summarize(Total = n(), MeanAge = mean(Age), .groups = "drop") %>% 
  mutate(Perc = Total / sum(Total) * 100)

student %>% 
  group_by(`Grad Intention`, Gender) %>% 
  summarize(Total = n(), MeanAge = mean(Age), .groups = "drop_last") %>% 
  mutate(Perc = Total / sum(Total) * 100)

xtabs(Spending ~ Gender + `Grad Intention`, data = student)   # total only

student %>% 
  group_by(`Grad Intention`, Gender) %>% 
  summarize(Total = n(), 
            MeanAge = mean(Age), 
            .groups = "drop_last",
            TotalSpending = sum(Spending))

table(student$Gender, student$`Grad Intention`)

student %>% 
  count(Gender, `Grad Intention`) %>% 
  rename(Count = n)


## skimr ####
# install.packages("skimr", repos = "https://cloud.r-project.org/")


library(skimr)
skim(student)

## psych ####

library(psych)
describe(student, omit = T, IQR = TRUE)
describeBy(student, group=student$Gender)


## tableone ####

# install.packages("tableone", repos = "https://cloud.r-project.org/")

library(tableone)
CreateTableOne(data = student)
summary(CreateTableOne(data = student))
CreateTableOne(strata = "Gender", data = student)


## table1 ####

install.packages("table1", repos = "https://cloud.r-project.org/")

library(table1)
table1(~ ., data=student)
table1(~ Gender + Age + Class + Salary + Wealth, data=student)
table1(~ Age + Class + Salary + Wealth | Gender, data=student)
table1(~ Age + Class + Salary + Wealth | Gender, data=student,
       overall = FALSE)

pvalue <- function(x, ...) {
  # Construct vectors of data y, and groups (strata) g
  y <- unlist(x)
  g <- factor(rep(1:length(x), times=sapply(x, length)))
  if (is.numeric(y)) {
    # For numeric variables, perform a standard 2-sample t-test
    p <- t.test(y ~ g)$p.value
  } else {
    # For categorical variables, perform a chi-squared test of independence
    p <- chisq.test(table(y, g))$p.value
  }
  # Format the p-value, using an HTML entity for the less-than sign.
  # The initial empty string places the output on the line below the variable label.
  c("", sub("<", "&lt;", format.pval(p, digits=3, eps=0.001)))
} 
table1(~ Age + Class + Salary + Wealth | Gender, data=student, 
       overall=F, extra.col=list(`P-value`=pvalue))

# See more: https://benjaminrich.github.io/table1/vignettes/table1-examples.html


## gtsummary ####

# install.packages("gtsummary", repos = "https://cloud.r-project.org/")

library(gtsummary)
student %>% tbl_summary()
student %>% tbl_summary(by = Gender)
student %>% tbl_summary(
  by = Gender,
  statistic = list(
    all_continuous() ~ "{mean} ({sd})",
    all_categorical() ~ "{n} / {N} ({p}%)"
  ),
  digits = all_continuous() ~ 3
)
# See more: https://www.danieldsjoberg.com/gtsummary/articles/tbl_summary.html


## gmodels ####

library(gmodels)
CrossTable(student$`Grad Intention`, student$Gender)


## naniar: For missing value inspection ####

# install.packages("naniar", repos = "https://cloud.r-project.org/")

library(naniar)

sum(is.na(airquality$Ozone)) / nrow(airquality)

miss_var_summary(airquality)
gg_miss_var(airquality)
vis_miss(airquality)
# See more: http://127.0.0.1:15935/library/naniar/doc/naniar-visualisation.html




