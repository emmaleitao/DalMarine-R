# Lesson 1 

# Variables --------------------------------------------------------------------

# assigning variables 

x <- 5 
x <<- 5 
5 -> x 
5 ->> x
x = 5 

# using variables in operations 

Height <- 4 
Width <- 2 
Height * Width 

# assign your answer to a new variable 

Area <- Height*Width 

# Types of data ----------------------------------------------------------------

# Logical data

class(TRUE)
class(FALSE)
class(NA)

x <- 5 
x >= 4 # is x greater than or equal to 4?


# Numeric data 

class(2)
class(2.5)
x< 2.5

# Integers

y <- 2L 
class(x)

# Integers are numeric data 
is.numeric(x) 
is.numeric(y) 

# but not all numeric data is an integer. Integers always have an "L" after the number 
is.integer(x) 
is.integer(y) 

# Characters/Strings

x <- "abc"
class(x)
x <- 'abc'
class(x)
print("Hello, how are you?")

# Vectors ----------------------------------------------------------------------

x <- c(1,2,3,4)
x
length(x)

x <- 1:4 

# data coercion 
x <- c(7,4,"A",10,"K",3,2,"Q")
print(x)

# Indexing ---------------------------------------------------------------------

x <- c(1,4,6,28)

# grab just the first element of x 
x[1] 

# index elements 3 through 4 (3:4)
x[3:4]

# index all elements of x EXCEPT the second element
x[1,3,4]
# OR 
x[-2]

# reassign the second element of x to be -99 
x[2] <- -99 

# reassign elements 1:3 to -99 
x[1:3] <- -99 

# Using logical operators to index 

x <- c(1:4)

# index x, where x is greater than 3, greater than and equal to 3, and less than 2
x[x>3] 

x[x>=3]

x[x<2]












# Example

# make a vector containing all the suits in a standard deck 
Suits <- c("Diamonds","Hearts","Spades","Clubs")

# make a vector contianing the total number of each suit
Remain <- c(13,13,13,13)
# OR 
Remain <- rep(13,4) #  repeat the element '13' 4 times

# add labels to Remain 
names(Remain) <- Suits
print(Remain)

# or add the labels while making the vector 
Remain <- c(Diamonds = 13, Hearts = 13, Spades = 13, Clubs = 13)

# Let's say we draw 4 cards. The vector contains the suits of each card drawn: 
DrawnSuits <- c("Diamonds","Hearts","Spades","Spades")

# index drawn suits for Diamonds. 
tmp <- DrawnSuits[DrawnSuits == "Diamonds"] 

# find out how may Diamonds were drawn by using length()
length(tmp)

# we now want to adjust our Remain vector to account for the drawn Diamond. 

Remain["Diamonds"]
Remain["Diamonds"] <-  Remain["Diamonds"] - length(tmp)
Remain["Diamonds"]

# Repeat for each suit: 

tmp <- DrawnSuits[DrawnSuits == "Hearts"] 
Remain["Hearts"] <-  Remain["Hearts"] - length(tmp)

tmp <- DrawnSuits[DrawnSuits == "Spades"] 
Remain["Spades"] <-  Remain["Spades"] - length(tmp)

tmp <- DrawnSuits[DrawnSuits == "Clubs"] 
Remain["Clubs"] <-  Remain["Clubs"] - length(tmp)

print(Remain)

