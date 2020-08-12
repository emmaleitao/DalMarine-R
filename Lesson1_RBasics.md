<h1> Lesson 1. R Basics 

R is a programming language for statistical computing and data science. It's open source, meaning there's lots of people creating packages for you to use and lots of online help. Great visualization. Here you can find their website with lots of cool info: https://www.r-project.org/

If you want to follow along with me, you should first: 
- Download R 
- Download RStudio 

To download R, go here: https://mirror.its.dal.ca/cran/
To download RStudio, go here: https://rstudio.com/products/rstudio/download/

<h1> R Studio
 
R Studio is where we will work with R.
It is classified as a Integrated Development Environment which gives us a whole toolset in one program to edit, run, and debug code. 
 
R Strudio is comprised of a few sections. First, you have the source tab, which shows you your files that you can use to write, edit, and save your scripts. To make a new file, you can click  the green square in the top left or hit Ctrl + Shift + N. This will make a new .R file where you can write R code.

Next, we have the console tab, which is just below the source tab. Here, you can type commands and see results immediately. For instance, you can type in

    >  4*3 
    
And then R will solve this equation and give you: 

    > 12
    
On the top righthand side, you can see the Environment/History tabs. Under Environment, R Studio will list all the variables and objects you have created in either the console or by running your source code.The History tab will show you all the commands you've typed into the console or any commands completed by running your code.

Below the history and environment tabs, we have a bunch of miscellaneous tabs. First, the files tab shows you all of the files you can use and open. Here, you can load in any files, environments, datasets, etc. The plots tab will show you any plots you generate while working. The packages tab allows you to see what packages you have installed currently and can let you download/install any other ones you are interested in. The help tab can be used to search for anything in R that you want to learn more about. Alternatively, you can type a question mark before any command in the console and the help tab will automatically pull up that information for you. 

    ?plot

Assign with <- 
Recall by typing the name in the console 
Workspace 
Where all your variables and objects are stored 
Print all variables by typing ls() 
Lists all vars but not values 
EX:
Height <- 4 
Width <- 2 
Height * Width 
8
Area <- Height*Width 
R Script 
Text file with R commands 
Can store all your code and can then “Run” it
Each line with be consecutively executed 
Can go back and edit your script 
Types of Data 
class() will reveal the type of data 
Logicals
class(TRUE)
Logical 
TRUE (T),  FALSE (F), NA
Used in boolean operations 
Numeric
2, 2.5
Can perform regular arithmetic on it 
subcategory : Integer 
Can specify that the value is an integer by putting “L” after it 
Ie: 
X <- 2 
Y <- 2L
class(X)
Numeric 
class(Y)
Integer 
Another way to check: 
is.numeric(X) TRUE is.numeric(Y) TRUE 
is.integer(X) FALSE is.integer(Y) TRUE
Other atomic types of variables: 
Double: higher precision 
Complex: complex numbers
Raw: store raw bytes 
Coercion 
 How to get between types of data 
Use as._____() 
Ie: as.numeric(TRUE) 
1
as.numeric(FALSE)
0 
This relationship is something I use in my own data research. You can easily check the number of times something occurs in you dataset by asking “are any of my variables > 5” for instance. You can then sum that logical statement to get how many times that statement was satisfied 
as.character(4)
“4”
as.numeric(“4.5”)
4.5
Sometimes, coercion between specific datatypes is NOT possible:
as.numeric(“Hello”)
NA
R can’t convert this so it gives you “NA”/Not available/Not a Number 
Vectors 
Use c() “concatenate”
For instance, make a character vector as follows: 
Suits <- c(“Diamonds”,”Hearts”,”Spades”,”Clubs”)
is.vector(Suits)
TRUE
DrawnSuits <- c(“Diamonds”,”Hearts”,”Spades”,”Spades”)
Remain <- c(12,12,11,13)
Remain
12 12 11 13
This doesn’t tell us much information, but we can add labels to this vector to help 
names(Remain) <- Suits
ALTERNATIVELY, do this WHILE you are making the vector as such:
Remain <- c(Diamonds = 12, Hearts = 12, Spades = 11, Clubs = 13)
Here, you don’t need to put quotes, but if you did, you would get the same results 
Even variables with one elements assigned are vectors 
X <- 5
is.vector(X)
TRUE 
length(X)
1 
Vectors are homogenous, meaning that they can only store one type of data in them 
If you try to put different types, R will automatically coerce the variables into the simplest form 
Drawn_ranks <- c(7,4,”A”,10,”K”,3,2,”Q”)
Drawn_ranks
“7”,”4”,”A”,....
All have been coerced into characters 
Be careful of this, if you want to store elements of different data types, you can use a list 
Indexing vectors 
Indexing means to pull out specific parts of the vector 
To index, we have to use square brackets as opposed to the round brackets which are sued for calling functions 
[ ] vs ( ) 
EX: 
X <- c(1,4,6,28)
X[1]
1
X[3:4]
6  28 
Now let’s get all of X EXCEPT the second element
X[1,3:4]
X[1,3,4]
OR the simplest way:
X[-2]
1  6  28 
You can also REASSIGN elements within a vector withing indexing 
Change 2nd element to -99 
X[2] <- -99 
X
1 -99 6  28 
X[1:3] <- -99 
X
-99 -99 -99 28 
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
