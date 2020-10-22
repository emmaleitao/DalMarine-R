# Lesson 2 

# Recap

# variables 
x <- 7.4
x <- 4L
x <- "abc"
x <- FALSE 
x <- c(1,3,5)
x[2]
x[x>4]

# Matrices ---------------------------------------------------------------------
 
matrix(1:6,nrow = 2)

matrix(1:6, ncol = 3)

matrix(1:6,nrow = 2, byrow = TRUE)

# matrix recycling ----

matrix(1:3, nrow = 2, ncol = 3)

matrix(1:4, nrow = 2, ncol = 3) 

# rbind and cbind ----

cbind(1:3,1:3)

rbind(1:3,1:3)

# matrix indexing ----

x <- matrix(1:6,nrow = 2)
x

# index using [i,j], where i is your row number and j is your column number

# index the element in row 1 and column 2 
x[1,2]

# index row 1 in all columns
x[1,]

# index all rows in column 3 
x[,3]

# index rows 1 through 2 in column 1 
x[1:2,1]

# index row 1 in columns 1 through 2
x[1,1:2]

# index rows 1 through 2 and columns 1 through 2
x[1:2,1:2]

# index row 1 but just columns 1 and 3 

x[1,-2]
x[1,c(1,3)]

# naming matrices ----

m <- matrix(1:6,nrow = 2)
rownames(m) <- c("row1","row2")
colnames(m) <- c("col1","col2","col3")

# OR 

m <-  matrix(1:6, nrow = 2, dimnames = list(c("row1","row2"), c("col1","col2","col3")))
m

# Arrays -----------------------------------------------------------------------

array(data = NA, dim = c(3,3,5))

# Lists ------------------------------------------------------------------------

# lists let us put multiple data types in one variable (no coercion!)
list_data <- list("Hello", c(5:10), TRUE, 101.1, matrix(1:6,nrow = 2))

# you can even nest lists within each other 
list_data <- list(c('Apr','May','Jun'),c(8,14,20),list('a','b',c(1,2,3)))

# naming lists ----
names(list_data) <- c("Months", "Temperature", "Inner List")

# indexing lists ----

# index the first element of list_data 
list_data[[1]]

# OR if you added names, use $
list_data$Months

# Adding, Deleting, and Editing list elements

# add element
list_data[[4]] <- "abc"

# delete element 
list_data[[4]] <- NULL

# update element 
list_data[[1]] <- "updated element"
print(list_data)

# Data frames -------------------------------------------------------------------
rm(list = ls())

# make a data frame using data.frame() 

df <- data.frame(
  Name = c("Jenner,K","Gates,B","Bezos,J","Zuckerburg,M", "Musk,E"), 
  Age = c(23, 64, 56, 36, 49),
  Height_m = c(1.68,1.77,1.71,1.71,1.88) )

# use str() and summary () on your data frame 

str(df) #data frame structure 
summary(df) #data frame summary 

# index your data frame in the same way as lists: ----

all_ages <- df$Age

# or use square brackets

df[1:2,]
df[,2:3]
df[c(1,3),c(1,3)] 

# add a new column 

df$Birthday <- as.Date(c("1995-11-03","1955-10-28","1964-01-12","1984-05-14","1971-06-28"))

# to add a new row(s), you need to use rbind with two dataframes with the same structure 

df <- data.frame(
  Name = c("Jenner,K","Gates,B","Bezos,J","Zuckerburg,M", "Musk,E"), 
  Age = c(23, 64, 56, 36, 49),
  Height_m = c(1.68,1.77,1.71,1.71,1.88))

new_df <- data.frame(
  Name = "Winfrey,O", 
  Age = 66,
  Height_m = 1.69)

rbind(df,new_df)

# Importing data as dataframes + example ----

# first, look at raw data (.csv file)

nitrate <- read.csv("/Users/emmaleitao/Desktop/HL2/Nitrate_Fig_10_HL2_Timeseries.csv",
                    skip = 3, stringsAsFactors = FALSE, header = T)

# let's do some stats on this data

summary(nitrate)
hist(nitrate$NO3_0_50m) # concentration of NO3 top 50 m
hist(nitrate$NO3_plus50m) # concentration of NO3 50 m to bottom (150m)

# we could do a simple t-test on this data, but first,think about what this data is?
# the first is the concentration of nitrate in the TOP 50 M while the second is the 
# concentration of nitrate in the bottom 100 m, meaning it accounts for twice the volume of 
# the water column 

# to account for this, I will divide the concentration for each variable by the depth they cover 
# to get a concentration/meter 

nitrate$NO3_top_per_m <- nitrate$NO3_0_50m/50
nitrate$NO3_bottom_per_m <- nitrate$NO3_plus50m/100

data <- nitrate[,6:7] # make a df with just the variables we are testing

boxplot(data) # some outliers - could revist this and remove them 

data <- na.omit(data)
colnames(data) <- c("top","bottom")
data <- gather(data)
colnames(data) <- c("depth","nitrate")

# based on what I know about nutrient distribution in the water column, I would expect
# more nutrients to be found in deeper waters than in shallow waters. 

# Null Hypothesis: N_top = N_bot 
# Alternative Hypothesis: N_top != N_bot
# Method: two sided, one-tailed t-test, alpha = 0.05, non-equal variances 

test <- t.test(data$nitrate~data$depth,alternative = "two.sided",conf = 0.95, var.eq = F, paired = F)

# p < a , reject the null 

