<h2> Data Wrangling with dplyr and tidyr </h2> 

Up until this point, we have primarily been working with the base functions already in the R language. However, people can create packages that you can download that contain useful functions. For any data science work, two useful packages to have installed are the dplyr and tidyr package. 

We will go over some of the things you can do with these packages, but if you want some more explanations, check out these youtube tutorials by the creators of the packages themselves! This lesson will cover the same content as presented in these videos. 

https://www.youtube.com/watch?v=jOd65mR1zfw
https://www.youtube.com/watch?v=1ELALQlO-yM
https://www.youtube.com/watch?v=Zc_ufg4uW4U

Data wrangling is essentially the process of manipulating your raw data into something thats easy to read and work with. 

<h4> dplyr </h4>

to install packages, use the function install.packages() in your console. Make sure to put the package in quotes. To then use the package, use the library() function:

	> install.packages("dplyr")
	> library(dplyr)
		
dplyr introduces a new form of data frames called "tibbles" (tbl/table).
when you normally print a large dataframe in your console, the rows take up too much space and is pretty hard to read. You can convert your dataframe into a tibble by using the as_tibble() function: 

	> as_tibble(df) 

A new operator that comes with the dplyr is the pipe operator: %>%
The way this tool works, is that instead of providing your data source in the function directly, you 'pipe' your data into the first argument of your function.
Let's say we have a dataframe with age and height values. For this example, we want to first take an average of the height values and then round that answer to one decimal place. Normally, you could type something like this:  

	> x <- data.frame(
		height = c(150.452,162.226,126.162,189.902,175.428),
		age = c(15,17,12,26,35))
	> tmp <- mean(x$height)
	> avg_height <- round(tmp,1)
	
The pipe operator allows us to essentially stack multiple operations into one line of code

	> x$height %>% 
		mean() %>%
		round(1)
	
The operator allows us to build these chains without having to save our answers in temporary variables, like tmp. Depending on what you are doing, it may be more efficient to use the pipe operator or just the regular functions. 


When you download dplyr, the package comes with a dataframe/tibble that we can use as an example. To check out the tibble, just type starwars into the console

	> starwars
	
As you can see, R will now only print 10 rows of data as opposed to all of the rows. It is also sensitive to how big your console tab is. Try shrinking the tab and calling the tibble again. 

The main purpose of the dplyr package is to integrate common data management grammer as useable functions. For example, let's say that you were just interested in learning more about starwars characters that have a height greater than 100cm. You can *filter* your data to get that information.

	> filter(starwars, height > 100)
	
Or you can have multiple specifications: 

	> filter(starwars, height > 100 & species == "Human" & homeworld == "Tatooine")
	
And with the pipe operator: 

	> starwars %>% filter(height > 100 & species == "Human" & homeworld == "Tatooine")
	
Here's a list of all the dplyr functions catagorized by what component of your dataframe you're manipulating

<h5> Columns </h5>

select() changes whether or not a column is included. 

	> select(starwars, name, height, sex) # just select the columns name, height, and sex
	> select(starwars, hair_color:eye_color) # selects all columns including and between hair_colour and eye_color
	> select(starwars, !(hair_color:eye_color)) # excludes all columns including and between hair_colour and eye_color from the selection
	
rename() changes the name of columns.

	> rename(home_world = homeworld) # here, home_world is the new name and homeworld was the old name
	
mutate() changes the values of columns and creates new columns.

	> mutate(starwars, height_m = height/100)
	
relocate() changes the order of the columns.

	> relocate(starwars,homeworld:species, .before = height)

<h5> Rows </h5>

filter() chooses rows based on column values.

	> filter(starwars, height > 100)
	
arrange() changes the order of the rows.

	> arrange(starwars,height)
	
slice() chooses rows based on location.
	
	> slice(starwars,15) # 15th row
	> slice_head(starwars) # first row
	> slice_tail(starwars) # last row
	> slice_min(starwars,height) # row with the lowest height
	> slice_max(starwars,height) # row with the largest height

<h5> Groups of rows </h5>

summarise() collapses a group into a single row.

(let's use a different dataframe built into R) 

	> summarise(mtcars,mean = mean(disp), n = n())
	
This summary table doesn't tell us much about different types of cars. So you can group your data by a column name: 
 
	> mtcars %>% 
		group_by(cyl) %>%
		summarize(disp_mean = mean(disp),
              sd = sd(disp),
              qs_25 = quantile(disp,0.25),
			  qs_75 = quantile(disp,0.75),
              n = n())

<h4> tidyr </h4> 

	> install.packages("tidyr")
	> library(tidyr)
	
Tidyr is a package that helps you organize your dataframes into the most efficient organization for R. 

When working on a project, the raw datasets you get are rarely ever going to be in a neat and organized dataframe or tibble. It's up to you to organize the data, which can be very time consuming. I like to think that the goal of your code should be to make it as automized as possible. Any human interaction and checking makes the code weaker. While this may not always be the case, it is definitely time consuming to stanardize a bunch of different styles of datasets. 

To visualize this, let's also install the following packages from the creator of tidyr. Keep in mind, that this is just for demonstration, you don't need to install this to use tidyr.

	> install.packages("devtools")
	> devtools::install_github("rstudio/EDAWR")
	
In this package, we have three datasets. 

	> ?storms
	> ?cases 
	> ?pollution
	
Type the name of each dataset in the console to see the summary of the tibble. After doing this, you'll notice that the structure of each dataset is quite different. In storms, each variable gets its own column. In cases, the variables are headers, rows, and in the cells. Pollution is similar to storms, but is still putting variables inside the cells (as opposed to just observations). 

If we wanted to index these datasets, we would have to do a different style for each tibble. 

For storms, we could simply use $ to get each variable

	> storms$storm
	> storms$wind
	> storms$pressure

For cases, we would have to do this: 

	> cases$country 
	> names(cases)[-1] # this gets us the years
	> unlist(cases[1:3,2:4]) $ These are the observations 
	
In pollution, the indexing would look like this: 

	> pollution$city[1,3,5]
	> pollution$amount[1,3,5] # Large particle amounts
	> pollution$amount[2,4,6] # Small particle amounts 
	
If we had to work with each of these files in one script, there would be a lot of excess codes and inefficient processing. Ideally, all our data should follow the format of storms. For instance, in storm, we can easily do element-wise operations: 

	> storms$ratio <- storms$pressure/storms$wind

This is a very easy format to work with and is perfect for data analysis. This what we call "Tidy" data. Tidy data has 3 key characteristics: 

- each variable has its own column
- each observation has its own row
- each type of observation is saved in a single table

the package tidyr has two main functions to help make tidy data 

- gather()
- spread()

Let's use gather() on cases 

gather collapses multiple columns into two columns: 

- a **key** column that contains the former column names
- a **value** column that contains the former column cells

	> gather(cases,"year","n",2:4) 
	
The first argument in this function is the dataframe we want to reshape
The second argument is the name of the new key column 
The third argument is the name of the new value column 
The final argument is the names or numeric indexes of columns to collaps 

Now, let's use spread() on pollution 

Again, we have a key and value column. In pollution, size is our key column and amount is our value column. 

	> spread(pollution, size, amount)
	
tidyr has two other functions that we can use: unite() and seperate(). These can take a single column, and seperate their elements into multiple columns, or combine multiple columns into one. 

for instance, storms has the date column. We can use seperate() to make 3 new columns: year, month, and day.

	> storms2 <- seperate(storms, date, c("year","month","day"), sep = "-") 
	
unite() does the opposite

	> unite(storms2,"date",year,month,day,sep = "-")
	
Tip: the sep = "-" is indicating how R will recognize the seperation between each part of your observation. in seperate, you are telling R that the three values are seperated by a hyphen. R will then take the element and split the values into your new colunmns based on the placements of the hyphen. In unite, you are telling R to combine each column but seperate those values by a hyphen. Here, it could be any character of your choice. Commonly, you see hyphens, commas, spaces, or nothing. 
	
<h4> Recap </h4>

In this lesson, we went over 

- installing packages
- pipe syntax
- dplyr 
- tidyr 

If you want more information on these two packages, check out these cheatsheets published by the creators of the package!

tidyr: https://github.com/rstudio/cheatsheets/blob/master/data-import.pdf
dplyr: https://github.com/rstudio/cheatsheets/blob/master/data-transformation.pdf

