<h2>Lesson 1. R Basics </h2>

R is a programming language for statistical computing and data science. It's open source, meaning there's lots of people creating packages for you to use and lots of online help. Great visualization. Here you can find their website with lots of cool info: https://www.r-project.org/

If you want to follow along with me, you should first: 
- Download R 
- Download RStudio 

To download R, go here: https://mirror.its.dal.ca/cran/

To download RStudio, go here: https://rstudio.com/products/rstudio/download/

<h2>R Studio layout</h2>
 
R Studio is where we will work with R.
It is classified as a Integrated Development Environment which gives us a whole toolset in one program to edit, run, and debug code. 
 
R Strudio is comprised of a few sections. First, you have the source tab, which shows you your files that you can use to write, edit, and save your scripts. To make a new file, you can click  the green square in the top left or hit Ctrl + Shift + N. This will make a new .R file where you can write R code.

Next, we have the console tab, which is just below the source tab. Here, you can type commands and see results immediately. For instance, you can type in

    >  4*3 
    
And then R will solve this equation and give you: 

    [1] 12
    
On the top righthand side, you can see the Environment/History tabs. Under Environment, R Studio will list all the variables and objects you have created in either the console or by running your source code.The History tab will show you all the commands you've typed into the console or any commands completed by running your code.

Below the history and environment tabs, we have a bunch of miscellaneous tabs. First, the files tab shows you all of the files you can use and open. Here, you can load in any files, environments, datasets, etc. The plots tab will show you any plots you generate while working. The packages tab allows you to see what packages you have installed currently and can let you download/install any other ones you are interested in. The help tab can be used to search for anything in R that you want to learn more about. Alternatively, you can type a question mark before any command in the console and the help tab will automatically pull up that information for you. 

    > ?plot

<h2>Variables</h2> 

In the console, you can use * / + - to do calculations.

    > 4*2 
    [1] 8

But, you can also use variables to get these answers. 

You can assign values to a variable with <- or = 

    > x <- 5 
    
You can then recall that varibale by typing the name in the console 

    > x 
    [1] 5 
    
    
After making that variable, it will appear in your environment on the righthand side.
Print all variables by typing ls().
This lists all variables but not their values. 

Let's do an example:
    
    > Height <- 4 
    > Width <- 2 
    > Height * Width 
    [1] 8

You can also assign that answer to a variable itself:

    > Area <- Height*Width 
    > Area 
    [1] 8 
        
<h2>R Script</h2>

If you want to save your script to work on it later, you should make .R file. Do this by typing Ctrl + Shift + N and save your new file.
This is a text file with R commands where you can store all your code and can then “Run” it.
Each line will be consecutively executed. You can go back and edit your script at a later date as well. 

<h2>Types of Data</h2>

The data stored in R can be classified as various types of data. Let's go over the most common types of data. Keep in mind that everything in R is an "Object". 

Hint: if you are unsure what type your data is, use class() and put the data you're interested in inside the brackets.

<h4> Logicals </h4>

    > class(TRUE)
    [1] Logical 

This data is used in boolean operations. Logical data can only be the following: 

TRUE (T),  FALSE (F), NA

Example: 

    > x <- 5
    > x >= 4
    [1] TRUE

When we typed x >= 4 into the console, we are asking "Is x greater than or equal to 4?". R will then tell us that statment is TRUE.
You can also substitute the full spelling of TRUE and FALSE with T and F.

Here are all the boolean operators you can use: 

- > greater than
- < less than 
- >= greater than or equal to
- <= less than or equal to
- == exactly equal to
- != not equal to
- !x not x
- x|y x or y 
- x&y x and y

<h4> Numeric </h4>

These are values such as 2 and 2.5
Can perform regular arithmetic with these objects, like we have been doing earlier in the lesson. 

Here are all the arithmetic operators: 
- + addition
- - subtraction
- / division
- * multiplication
- ^ OR ** exponential 

<h4> Integer </h4>
Can specify that the value is an integer by putting “L” after it 

    > x <- 2 
    > y <- 2L
    > class(x)
    [1] numeric 
    > class(y)
    [1] integer 
    
Another way to check:

    > is.numeric(x) 
    [1] TRUE 
    > is.numeric(y) 
    [1] TRUE 
    > is.integer(x) 
    [1] FALSE 
    > is.integer(y) 
    [1] TRUE
    
<h4> Character </h4>

These really can be anything as long as it is inside of quotation marks.
"a","b","abc","42","Hello"

<h4> Data coercion </h4>
Coercion is term to describe switching between the types of data.

To do this, use as._____()

Example:

    > as.numeric(TRUE) 
    [1] 1
    > as.numeric(FALSE)
    [1] 0
    
Tip: This relationship is something I use in my own data research. You can easily check the number of times something occurs in you dataset by asking “are any of my variables > 5” for instance. You can then sum that logical statement to get how many times that statement was satisfied. We will do an example of this later.

    > as.character(4)
    [1] “4”
    > as.numeric(“4.5”)
    [1] 4.5
    
Sometimes, coercion between specific datatypes is NOT possible:
    
    > as.numeric(“Hello”)
    [1] NA
    
R can’t convert this so it gives you “NA”/Not available/Not a Number 

<h2> Vectors </h2> 
 
So far, all the objects we have created at this point only contained one thing inside them. However, we can add multiple things to an object. To start, we'll look at vectors. Vectors are a 1-dimensional object where you essentially just list all your values in a row (or column)

    > x <- c(1,2,3,4)
    > x
    > [1] 1 2 3 4 
    > length(x)
    > [1] 4
    
Tip: Instead of listing each number here, you can instead type 1:4 which means list every integer between 1 and 4. (Read it as "1 through 4")
    
The variable x is a vector of length 4. 
In order to combine the 4 elements of this vector, we had to use c() to “concatenate” the elements.

Vectors are homogenous, meaning that they can only store one type of data in them. 
If you try to put different types, R will automatically coerce the variables into the simplest form.

    > x <- c(7,4,”A”,10,”K”,3,2,”Q”)
    > x
    > [1] “7” ”4” ”A” ...
    
All these elements have been coerced into characters 

<h4> Indexing vectors </h4>
Indexing means to pull out specific parts of the vector.
To index, we have to use square brackets as opposed to the round brackets which are used for calling functions. 
[ ] vs. ( ) 

    > x <- c(1,4,6,28)
    > x[1]
    > [1] 1
    > x[3:4]
    > [1] 6  28 
    
Now let’s get all of x EXCEPT the second element

    > x[1,3:4]
    > x[1,3,4]
    > # OR the simplest way:
    > x[-2]
    > [1] 1  6  28 
    
You can also REASSIGN elements within a vector with indexing.
Let's change the 2nd element to -99

    > x[2] <- -99 
    > x
    > [1] 1 -99 6  28 
    > x[1:3] <- -99 
    > x
    > [1] -99 -99 -99 28 
    
You can also index a vector by using a boolean operation rather than the element position.

    > x <- c(1:4)
    > x
    > [1] 1 2 3 4
    > x[x>3]
    > [1] 4 
    
The statement above reads like "x where x is greater than 3". R finds the values in your vector that satisfy the statment inside the square brackets.
   
    > x[x>=3] 
    > [1] 3 4
    > x[x<2]
    > [1] 1
    
<h4> Putting it all together</h4>
 
Let's do an example putting everything from this lesson together. In this scenario, we are going to try to count how cards of each suit remain in a deck of cards.To begin, make a character vector as follows: 

    > Suits <- c(“Diamonds”,”Hearts”,”Spades”,”Clubs”)
    > is.vector(Suits)
    > [1] TRUE
    
The Suits vector lists all the suits in a deck. Let's also make a vector that tell us how many cards of each suit remain in the deck. We'll call this vector Remain. (Every deck of cards has 52 cards and each suit has 13 cards.)

    > Remain <- c(13,13,13,13)
    # OR 
    > Remain <- rep(13,4) #  repeat the element '13' 4 times
    > Remain 
    > [1] 13 13 13 13

The vector "Remain" doesn't tell us much information, but we can add labels to this vector to help organize. 

    > names(Remain) <- Suits
    > Suits
    > Diamonds   Hearts   Spades    Clubs 
      13         13       13        13 
    
ALTERNATIVELY, do this WHILE you are making the vector:

    > Remain <- c(Diamonds = 13, Hearts = 13, Spades = 13, Clubs = 13)
    
Here, you don’t need to put quotes, but if you did, you would get the same results.
So now we have a vector that shows us how many cards of a given suit remain in the deck. 
In this scenario, let's pull 4 cards from the deck and list their suits in a new vector called DrawnSuits

    > DrawnSuits <- c(“Diamonds”,”Hearts”,”Spades”,”Spades”)

Now we can index DrawnSuits and see how many of each suit were drawn out. 

    > tmp <- DrawnSuits[DrawnSuits == "Diamonds"] # here, I used a temporary variable name. Sometimes, you will want to temporarily store information so you can used something like "tmp" that will likely get overwritten in your script. 
    > tmp 
    > [1] "Diamonds" 
    > length(tmp)
    > [1] 1
    
Here, I indexed DrawnSuits by asking to pull out how many elements were called "Diamonds". I then stored that in the variable tmp and then found of the length of that variable. Now we can update the variable Remain to reflect the loss of one diamond card from the deck. 

    > Remain["Diamonds"]
    Diamonds 
          13 
    > Remain["Diamonds"] <-  Remain["Diamonds"] - length(tmp)
    
 On the left side of the <-, I specified that I am working in the variable Remain in the "Diamonds" department. on the right side, we then reassigned that value (originally 13) to our new number, which is 13 minus the length of tmp (1). 
 
 
     > Remain["Diamonds"]
       Diamonds 
            12
            
 Let's repeat this for each suit 
 
 
    > tmp <- DrawnSuits[DrawnSuits == "Hearts"] 
    > length(tmp)
    > [1] 1
    > Remain["Hearts"] <-  Remain["Hearts"] - length(tmp)
    > Remain["Hearts"] 
      Hearts 
            12

     > tmp <- DrawnSuits[DrawnSuits == "Spades"] 
     > length(tmp)
     > [1] 2
     > Remain["Spades"] <-  Remain["Spades"] - length(tmp)
     > Remain["Spades"] 
       Hearts 
           11
           
     > tmp <- DrawnSuits[DrawnSuits == "Clubs"] 
     > length(tmp)
     > [1] 0
     > Remain["Clubs"] <-  Remain["Clubs"] - length(tmp)
     > Remain["Clubs"] 
       Hearts 
           13
           
With this lesson, we have now covered the following topics: 
- variables 
- writing R scripts 
- types of data
- vectors

Next time, we will begin with matricies, and then start learning about for and while loops, and if/else statements. 


