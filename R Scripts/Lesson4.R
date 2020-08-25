# Else-If Statements -----------------------------------------------------------

# Ex. 1 - If
x <- 2
y <- 4

if(x<y){
  print("x is less than y")
} 

x <- 5 
if(x<y){
  print("x is less than y")
} 

# Ex. 2 - Else 

x <- 5 
y <- 4 
if(x<y){
  print("x is less than y")
} else {
  print("x is greater than y")
}


# Ex. 3 - Else If

x <- 6 
y <- 5
if(x<y){
  print("x is less than y")
} else if(x>y){
  print("x is greater than y")
} else {
  print("x is equal to y")
}


# For Loops --------------------------------------------------------------------
# Ex. 4 

c <- 0 # set counter to 0
evens = c() # make an empty vector to store 

for(i in 1:10){
  if(i%%2 == 0){
    c = c+1
    evens = c(evens,i)
  } # end if
} #end i
  
print(paste("Even values:", paste(evens,collapse = ",")))
print(paste("Total number of even values:",c))
  
# Ex. 5
  
# Create a 10 x 10 matrix 
mymat <- matrix(nrow=10, ncol=10)
  
# For each row and for each column, assign values based on position: product of two indexes

for(irow in 1:nrow(mymat)) {
    for(icol in 1:ncol(mymat)) {
      mymat[irow,icol] = irow*icol
  }# end icol
}# end irow
  
print(mymat)

# Ex. 6 

# Create your three-dimensional array
my_array <- array(data = NA, dim = c(5,5,5))

for (i in 1:dim(my_array)[1]) {
  for (j in 1:dim(my_array)[2]) {
    for (k in 1:dim(my_array)[3]) {
      my_array[i,j,k] = i*j*k
    }
  }
}
  
# While Loops -----------------------------------------------------------------

# Ex. 7

i <- 1
while (i < 6) {
  print(i)
  i = i+1
}

# Ex. 8 

# Initialize loop counter 
loop <- 1

# Set variable price and stock
price <- 50
stock <- 50 

# Set the while statement
while (price < 55){
  
  # Create a random price between 40 and 60
  price <- stock + sample(-10:10, 1)
  
  # Count the number of loop
  loop = loop +1 
  
  # Print the number of loop
  print(loop)
  print(paste("price =",price))
} #end while

print(paste("final price =",price))
print(paste("total loops =", loop))

