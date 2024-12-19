# InternProject
Swift Project for internship


1 - First I added the DuckDB package into my Xcode, initially I was getting an error which I've attached the screenshot of("import DuckDB was not working even after installing the DuckDB),i managed to get it working a different machine 

2- Downloaded the recemonded CSV data file and renamed it to "Data.CSV" for better understanding of references.

3- made a function named importCSVToDuckDB to import my data.csv file into the duck database.

4- then I made a function FetchData to pull all the data from "accidents" tab and make it into a 2d array or a table named data.

5-Created a program "intern3" to display the data in a tabular form.

6- Created another function by name FetchData (function overloading) with attributes as how many results you want to fetch (Limit and offset) for easy scrolling as the dataset have a lot of data(pagination).

7-Created Search Function for searching data in any row.

File Intern2 has all the importing and linking functions
Data.CSV file is not attached in this as it was above 25MB but ive used the same file as was given in the task as example
