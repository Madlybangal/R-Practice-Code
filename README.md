# R-Practice-Code Canada Labour Market: Future Perspectives
For anyone looking for job opportunities, it is nice to have an idea how the job market will perform in the future for your chosen career or industry. Many countries have open data sets that offer this kind of data. In these exercises we will use R to analyze the future perspective of Canadian labour market.
Exercise 1
Download and read into R all data sets from
http://open.canada.ca/data/en/dataset/e80851b8-de68-43bd-a85c-c72e1b3a3890
Exercise 2
Load library tidyr. Use gather to rearrange any occupation related data set that present time series data into a tidy data format.

Exercise 3
Use gather to rearrange ALL other occupation related data sets that present time series data into a tidy data format, and pile out them in a unique data frame.

Exercise 4
Remove lines that present NA values, columns in French, and the “X” in front every year. Take a look at your tidy data set.
Exercise 5
Let’s do the same with industries data sets. Start by taking one of the industries data sets that present data in a time series an use gather.

Exercise 6
Do the same procedure of exercise 5 to all other industries data sets. Pile out them in a new data frame.

Exercise 7
Remove NAs, and French columns. In addition, set year and value as numeric, and take a look at your new tidy data set about industries.

Exercise 8
Find out the industries that have que lowest number of jobseekers, and create a new data set by sub setting the previous one.
