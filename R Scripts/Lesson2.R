# Lesson 2 

# Matrices ---------------------------------------------------------------------
 
matrix(1:6,nrow = 2)

matrix(1:6, ncol = 3)

matrix(1:6,nrow = 2, byrow = TRUE)

# matrix recycling

matrix(1:3, nrow = 2, ncol = 3)

matrix(1:4, nrow = 2, ncol = 3) 

# rbind and cbind 

cbind(1:3,1:3)

rbind(1:3,1:3)

# matrix indexing 

x <- matrix(1:6,nrow = 2)
x

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

# naming matrices 

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

# naming lists 
names(list_data) <- c("Months", "Temperature", "Inner List")

# indexing lists

# index the first element of list_data 
list_data[1]
# OR if you added names, use $
list_data$Months

# Adding, Deleting, and Editing list elements

# add element
list_data[4] <- "abc"

# delete element 
list_data[4] <- NULL

# update element 
list_data[1] <- "updated element"
print(list_data)

# Dataframes -------------------------------------------------------------------

# make a dataframe using data.frame() 

df <- data.frame(
  Name = c("Jenner,K","Gates,B","Bezos,J","Zuckerburg,M", "Musk,E"), 
  Age = c(23, 64, 56, 36, 49),
  Height_m = c(1.68,1.77,1.71,1.71,1.88) )

# use str() and summary () on your dataframe 

str(df) #dataframe structure 
summary(df) #dataframe summary 

# index your dataframe in the same way as lists: 

all_ages <- df$Ages

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



