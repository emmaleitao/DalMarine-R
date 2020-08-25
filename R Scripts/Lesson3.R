# Lesson 3 - Data Wrangling 

# Installing packages ----------------------------------------------------------

# This lesson requires you to install two packages: dplyr and tidyr. Use 
# install.packages() to first install the package from CRAN, then use library() 
# to enable the package in your library 

install.packages("dplyr")
library(dplyr)

install.packages("tidyr")
library(tidyr)

# There is an additional package that is optional to download. We are just using
# it today to play around with additional datasets 

install.packages("devtools")
library(devtools)
devtools::install_github("rstudio/EDAWR")
library(EDAWR)


# dplyr  -----------------------------------------------------------------------

# tables/tibbles/tbl

# dplyr makes dataframes easier to read by converting them to tables (tibbles). 
# you can convert dataframes into tibbles by using as_tibble()

x <- data.frame(
  height = c(150.452,162.226,126.162,189.902,175.428),
  age = c(15,17,12,26,35))
print(x)

x <- as_tibble(x)
print(x)

# pipe operator 

#this package also introduces a new operator called the pipe operator. This helps
# you to build chains of functions and can optimize your code and save storage. 

x$height %>%
  mean()

# the pipe operator takes the value on it's left and puts it in the first argument
# of the function on the right. Now, you can create a chain of functions: 

x$height %>%
  mean() %>%
  round(1)

# the pipe operator eliminates the need to save intermediate values in your calculations 

# dplyr's functions

# The functions in this package are designed to integrate common grammar in 
# data analysis into R functions. We will go over all the functions briefly so 
# you get the idea of how this package can help your data analysis. For this, we }
# use the starwars tibble. Try calling this tibble in your console

starwars

# column functions in dplyr

select(starwars, name, height, sex) # just select the columns name, height, and sex
select(starwars, hair_color:eye_color) # selects all columns including and between hair_colour and eye_color
select(starwars, !(hair_color:eye_color)) # excludes all columns including and between hair_colour and eye_color from the selection

rename(home_world = homeworld) # here, home_world is the new name and homeworld was the old name

mutate(starwars, height_m = height/100)

relocate(starwars,homeworld:species, .before = height)

# row functions in dplyr

filter(starwars, height > 100)

arrange(starwars,height)

slice(starwars,15) # 15th row
slice_head(starwars) # first row
slice_tail(starwars) # last row
slice_min(starwars,height) # row with the lowest height
slice_max(starwars,height) # row with the largest height

# summarise function (use the mtcars tibble this time)

summarise(mtcars,mean = mean(disp), n = n()) 

# This is too simple. Let's make groups within the tibble based on the column "cyl"

mtcars %>% 
  group_by(cyl) %>%
  summarize(disp_mean = mean(disp),
            sd = sd(disp),
            qs_25 = quantile(disp,0.25),
            qs_75 = quantile(disp,0.75),
            n = n())

# tidyr  -----------------------------------------------------------------------

# tidyr comes with 3 datasets: 

?EDAWR::storms # this variable was masked so you have to call it directly from the package with ::
?cases 
?pollution

storms <- EDAWR::storms 
# Each of these datasets is structured differently. 

storms
cases
pollution

# If we wanted to use each of these dataframes in a script, we would have to index them very differently: 

storms$storm
storms$wind
storms$pressure

cases$country 
names(cases)[-1] # this gets us the years
unlist(cases[1:3,2:4]) # These are the observations 

pollution$city[c(1,3,5)]
pollution$amount[c(1,3,5)] # Large particle amounts
pollution$amount[c(2,4,6)] # Small particle amounts 

# This would not be efficient to work with...If we had to work with each of 
# these files in one script, there would be a lot of excess codes and inefficient 
# processing. Ideally, all our data should follow the format of storms. 
#For instance, in storm, we can easily do element-wise operations:

storms$ratio <- storms$pressure/storms$wind


# gather 
gather(cases,"year","n",2:4)

# spread 
spread(pollution, size, amount)


