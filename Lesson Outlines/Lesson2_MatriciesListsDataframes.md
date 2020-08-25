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
    
<h2 Arrays </h2< 

Arrays can be any dimension you want. While it may not be easy to visualize what a 3D or 4D array would look like, they are extremely useful for store large amounts of data. 

    array(data = NA, dim = c(x,y,z...),dimnames = NULL) 
    
your data is the first argument. dim refers to the dimensions of your array (for instance 3x3x5) 


    > array(data = NA, dim = c(3,3,5))

<h2> Lists </h2>

Coercion will also occur in your matrix if you try to combine different data types. 
If you want to have multidimensional data structure with different types of data, you will have can use lists or dataframes.

R list is an object which contains elements of different types – like strings, numbers, vectors and another list inside it. R list can also contain a matrix or a function as its elements. The list is created using the list() function. In other words, a list is a generic vector containing other objects inside it.

The advantage of having lists is that you can put multiple data types in one object. All you have to do is use the list() function, and list each element you want in the list, seperating the elements with a comma. 

    > list_data <- list("Hello", c(5:10), TRUE, 101.1, matrix(1:6,nrow = 2))
    
If you wanted, you could even put a list within a list: 

    > list_data <- list(c('Apr','May','Jun'),c(8,14,20),list('a','b',c(1,2,3)))
    
You can also add names to your list elements

    > names(list_data) <- c("Months", "Temperature", "Inner List")
    
<h4> Indexing Lists </h4>

We can index lists in two ways. First, we can use the same method as indexing vectors and matricies by putting the element position we are interested in in square brackets: 

    > list_data[1]
    $Months
    [1] "Apr" "May" "Jun"
    
Another way is to use $ if you have named your list elements

    > list_data$Months
    [1] "Apr" "May" "Jun"
  
<h4> Adding, Deleting, and Editing list elements </h4> 

You add a new list element by simpling indexing the last position + 1 and assigning your new element. By this, I mean that if your list has three elements, index the 4th element (3 + 1) and assign the new element 

    > list_data[4] <- "abc"
    
You can then delete the element:

    > list_data[4] <- NULL 
    
To edit a element already in the list, you can index the element in question and reassign your new data. 

    > list_data[1] <- "updated element"
    
<h2> Data Frames </h2>

A data frame is a table or a two-dimensional matrix-like structure where each column contains values of one variable and each row contains one set of values from each column. A key characteristic of dataframes is that each column has to have the same number elements.

To make a dataframe, use the function data.frame() 

    > df <- data.frame(
        Name = c("Jenner,K","Gates,B","Bezos,J","Zuckerburg,M", "Musk,E"), 
        Age = c(23, 64, 56, 36, 49),
        Height_m = c(1.68,1.77,1.71,1.71,1.88) )
        
 Once you make the dataframe, you can use str() and summary() to learn more about your data. 
 
    > str(df)
    'data.frame':	5 obs. of  3 variables:
    $ Name    : chr  "Jenner,K" "Gates,B" "Bezos,J" "Zuckerburg,M" ...
    $ Age     : num  23 64 56 36 49
    $ Height_m: num  1.68 1.77 1.71 1.71 1.88
   
    > summary(df)
     Name                Age          Height_m   
     Length:5           Min.   :23.0   Min.   :1.68  
     Class :character   1st Qu.:36.0   1st Qu.:1.71  
     Mode  :character   Median :49.0   Median :1.71  
                        Mean   :45.6   Mean   :1.75  
                        3rd Qu.:56.0   3rd Qu.:1.77  
                        Max.   :64.0   Max.   :1.88 
                        
To extract specific columns, use $ 
    
    > all_ages <- df$Age
    
We can also index using the square brackets 

    > df[1:2,]
        Name   Age   Height_m
    1 Jenner,K  23     1.68
    2  Gates,B  64     1.77
    
    > df[,2:3]
      Age   Height_m
    1  23     1.68
    2  64     1.77
    3  56     1.71
    4  36     1.71
    5  49     1.88
    
    > df[c(1,3),c(1,3)] 
          Name   Height_m
    1 Jenner,K     1.68
    3  Bezos,J     1.71
    
You can add a new column by using $ after your dataframe name and use a new column name 

    > df$Birthday <- as.Date(c("1995-11-03","1955-10-28","1964-01-12","1984-05-14","1971-06-28"))

To add more rows, you will need to have the additional rows prepared in another dataframe (with the same column names) and then use rbind() 

    > df <- data.frame(
        Name = c("Jenner,K","Gates,B","Bezos,J","Zuckerburg,M", "Musk,E"), 
        Age = c(23, 64, 56, 36, 49),
        Height_m = c(1.68,1.77,1.71,1.71,1.88))
    > new_df <- data.frame(
        Name = "Winfrey,O", 
        Age = 66,
        Height_m = 1.69)
     > rbind(df,new_df)
             Name  Age Height_m
    1     Jenner,K  23     1.68
    2      Gates,B  64     1.77
    3      Bezos,J  56     1.71
    4 Zuckerburg,M  36     1.71
    5       Musk,E  49     1.88
    6    Winfrey,O  66     1.69
    
