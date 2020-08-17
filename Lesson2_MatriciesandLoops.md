
    
    
    
Matices 
Much like a vector, but with more dimensions
A vector is 1D
A matrix is a 2D array of data elements with rows and columns 
One atomic vector type 
Create a matrix 
matrix(1:6,nrow = 2)
Here you’ve said that the data is the number 1:6 (“one through six”)
You’ve also specified that there should be 2 rows. Knowing that you have 6 elements you want to put in a matrix, with 2 rows, R will make a matrix with 3 columns and 2 rows and insert the data chronologically 
Could also specify ncol = 3
If you want to to insert the data so that the numbers go by the row, not the column, set byrow = TRUE 
matrix(1:6,nrow = 2, byrow = TRUE)
Matrix indexing 
ADD SECTION HERE 
Matrix recycling 
If you supply a vector that’s too short for how big your matrix is, R will simply repeat the vector until it is full 
matrix(1:3, nrow = 2, ncol = 3)
R will fill this matrix column by column, repeating the vector once it reaches the end 
If you try to fill the matrix with a vector whose multiple that doesn’t nicely fit, it will give a warning but still complete the task 
rbind(),cbind()
Paste vectors togethers
Column bind cbind()
cbind(1:3,1:3)
Row bind rbind() 
rbind(1:3,1:3)
Ex: 
M <- matrix(1:6,byrow = TRUE, nrow = 2)
rbind(m,7:9) 
Or cbind(m,7:8)
Naming matrices 
rownames(m) <- c(“row1”,”row2”)
colnames(m) <- c(“col1”,col2”,”col3”)
Can also do it with dimnames function while making the matrix itself
M <-  matrix(1:6, byrow = TRUE, nrow = 2, dimnames = list(c(“row1”,”row2”), c(“col1”,”col2”,”col3”)))
Will learn lists later on 
Coercion will also occur here if you try to combine different data types 
If you want to have multidimensional data structure with different types of data, you will have to use lists or more specifically data frames which we will learn in the next lesson
Let’s run through an example of some data analysis and computing 
