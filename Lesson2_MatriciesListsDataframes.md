<h2> Matrices </h2>

Matricies are closely related to vectors.
We can classify a vector as 1D (one-dimensional) where it only has one row (or one column). A matrix on the other hand has both rows AND columns. This makes matricies 2D (two-dimensional).

To create a matrix, you can type this: 

    > matrix(1:6,nrow = 2)
         [,1] [,2] [,3]
    [1,]    1    3    5
    [2,]    2    4    6
    
Here, you’ve said that the data you want inside the matrix are the numbers 1 through 6 (1:6). R will inset the data by column first automatically.
You’ve also specified that there should be 2 rows. Knowing that you have 6 elements you want to put in a matrix, with 2 rows, R will make a matrix with 3 columns and 2 rows and insert the data accordingly.

You could also specify ncol = 3

    > matrix(1:6, ncol = 3)
         [,1] [,2] [,3]
    [1,]    1    3    5
    [2,]    2    4    6
    
If you want to to insert the data so that the numbers go by the row, not the column, set byrow = TRUE 

    > matrix(1:6,nrow = 2, byrow = TRUE)
          [,1] [,2] [,3]
    [1,]    1    2    3
    [2,]    4    5    6

<h4> Matrix recycling </h4>

If you supply a vector that’s too short for how big your matrix is, R will simply repeat the vector until the matrix is full.

    > matrix(1:3, nrow = 2, ncol = 3)
            [,1] [,2] [,3]
     [1,]    1    3    2
     [2,]    2    1    3
    
R will fill this matrix column by column, repeating the vector once it reaches the end 
If you try to fill the matrix with a vector whose multiple that doesn’t nicely fit, it will give a warning and R will now make the matrix. This means your matrix size has to be a multiple of your vector length.

     > matrix(1:4, nrow = 2, ncol = 3) 
     
 The matrix size you're trying to make has 6 spaces (2 x 3) but your vector length is 4. 4 elements cannot be repeated evenly into a matrix with 6 spaces. 
     
<h4> rbind and cbind </h4> 

You can paste vectors together by using the commands rbind() and cbind().

To bind two vectors by column, use cbind: 

      > cbind(1:3,1:3)
           [,1] [,2]
    [1,]    1    1
    [2,]    2    2
    [3,]    3    3

And to bind by row, use rbind: 

    > rbind(1:3,1:3)
         [,1] [,2] [,3]
    [1,]    1    2    3
    [2,]    1    2    3

<h4> Matrix indexing </h4>

From our last seminar, we learned how to index vectors. 

    > x <- 3:9
    > x[2:4]
    [1] 4 5 6 
    
We can also index a matrix, but we now have to specify both the row AND column position. If you look at when we were making matricies, R showed us the row and column positions:

    > matrix(1:6,nrow = 2)
         [,1] [,2] [,3]
    [1,]    1    3    5
    [2,]    2    4    6
    
You can index the matrix by specifying your row and column number in the following format: matrix[row,column]. For example, lets make a matrix and index the value in the 1st row and second column.

    > x <- matrix(1:6,nrow = 2)
    > x[1,2]
    [1] 3

If you want all values from a given row, you can leave the column position blank while specifying your row number:

    > x[1,]
    [1] 1 3 5
    
here, we can see all the values in row one. We can do the same for columns: lets grab just the third column: 

    > x[,3]
    [1] 5 6
    
We can also choose to look at multiple row, columns or both: 

    > x[1:2,1]
    [1] 1 2
    > x[1,1:2]
    [1] 1 3
    > x[1:2,1:2]
         [,1] [,2]
    [1,]    1    3
    [2,]    2    4

<h4> Naming matrices </h4>

Like with vectors, we can add row and column names to our matrix. 

    m <- matrix(1:6,nrow = 2)
    rownames(m) <- c(“row1”,”row2”)
    colnames(m) <- c(“col1”,col2”,”col3”)
    
Can also do it with dimnames function while making the matrix itself

    > m <-  matrix(1:6, nrow = 2, dimnames = list(c(“row1”,”row2”), c(“col1”,”col2”,”col3”)))

<h2> Lists </h2>

Coercion will also occur in your matrix if you try to combine different data types. 
If you want to have multidimensional data structure with different types of data, you will have can use lists or dataframes.

R list is an object which contains elements of different types – like strings, numbers, vectors and another list inside it. R list can also contain a matrix or a function as its elements. The list is created using the list() function. In other words, a list is a generic vector containing other objects inside it.

<h2> Data Frames </h2>


