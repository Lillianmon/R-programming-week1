# The <- symbol is the assignment operator
# The # character indicates a comment

x <- 1 #nothing printed
print(x) #explicit printing
x #auto-printing occurs
#[1] indicates that x is a vector and 1 is the first element

msg <- "hello"

x <- 1:20
x

# R objects: R has five classes of objects: character, numeric (real numbers), integer, complex, logical (True/False)
# Inf: infinity, e.g. 1/0 = Inf
# NaN: undefined value, e.g. 0/0 = NaN

# Creating vectors
# The c() function can be used to create vectors of objects
x <- c(0.5, 0.6) #numeric
x <- c(TRUE, FALSE) #logical
x <- c(T, F) #logical
x <- c("a", "b", "c") #character
x <- 9:29
x <- c(1+0i, 2+4i) #complex

# Using the vector() function
x <- vector("numeric", length = 10)
x

# Mixing objects
y <- c(1.7, "a") #character
y <- c(TRUE, 2) #numeric TRUE is 1
y <- c(FALSE, 2) #numeric FALSE is 0
y <- c("a", TRUE) #character

#explicit coercion: objects can be explicitly coercoed from one class to another using the as. functions
x <- 0:6
class(x) #intger
as.numeric(x)
as.logical(x)
as.character(x)

#List: Lists are a special type of vector that can contain elements of different classes. Lists are a very important data type in R
x <- list(1, "a", TRUE, 1+4i)
x

#Matrices: matrices are vectors with a dimension attribute, the dimemsion attribute is itself an integer vector of length 2 (nrow, ncol)
m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)


m <- matrix (1:6, nrow = 2, ncol =3)
m
#matrices can also be created directly from vectors by adding a dimension attribute
m <- 1:10
dim(m) <- c(2,5)
m
view(m)
#cbind-ing and rbind-ing:matrices can be created by column-binding or row-binding with cbind() and rbind()
x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

#factors: factors are used to represent categorical data. can be unordered or ordered. factor can be thought as an integer vector where each integer has a label
#factors is better than using integers because factors are self-describing: a variable has value "Male" and "Female" is better than a variable has 1 and 2
#factors are treated specially by modelling functions like lm() and glm()
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x)
#The order of the levels can be set using the levels argument to factor()
#important in linear modelling because the first level is used as the baseline level
x <- factor(c("yes", "yes", "no", "yes", "no")) 
levels = c("yes", "no")
x

#missing values: missing values are denoted by NA or NaN for undefined mathematical operations
is.na() # test objects if they are NA
is.nan() # test for NaN
#NA values have a class, integer NA, character NA, etc. A NaN value is also NA but the converse is not true
x <- c(1, 2, NA, 19, 3)
is.na(x)
is.nan(x)
x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)

#Data frames: data frames are used to store tabular data
#they are represented as a special type of list where every element of the list has to have the same length
#each element can be though as a column and length of each element is the number of row
#data frames can store diffent classes of objects in each column (unlike matrices)
row.names # data frames also havea special attribute called row.names 
read.table()
read.csv() # data frames are usually created by calling read.table() or read.csv()
data.matrix() # can be converted to a matrix by calling data.matrix()
x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
x
nrow(x)
ncol(x)

#Names: R objects can have names, useful for writing readable code and self-describing objects
x <- 1:3
names(x) <- c("foo", "bar", "norf")
x
names(x)
#list can also have names
x <- list(a = 1, b = 2, c = 3)
x
#matrices can also have names
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))







##Reading data
#for reading tabular data
read.table
read.csv
#for reading lines of a text file
readLines
#for reading in R Code files(inverse of dump)
source
#for reading in R code file(inverse of dput)
load
#for reading in saved workspaces
unserialize
#for reading single R objects in binary form

##There are analogous functions for writing data to files
wirte.table
writeLines
dump
dput
save
serialize

#reading data files with read.table
file #the name of a file, or a connection
header #logical indicating if the file has a header line
sep # a string indicating how the columns are separated
colClasses # a character vector inducating the class of each column in the dataset
nrows # the number of rows in the dataset
comment.char # a character string indicating the comment character
skip # the number of lines to skip from the beginning
stringsAsFactors # should character variables be coded as factors, default to TRUE

data <-read.table("foo.txt")

#reading in larger datasets with read.table
#use the colClasses argument: can save time(e.g. if all the columns are "numeric", then you can just set colClasses = "numeric"). in order to use this option, you have to know the class of each column in your data frame
#a way to figure out the classes of each column is the following:
#only read 100 rows, helps with memory usage
initial <- read.table ("datatable.txt", nrows = 100)
classes <- sapply(initial, class)
tabAll <- read.table("datatable,txt", colClasses = classes)

#calculating memory requirements
#a data frame with 1,500,000 rows and 120 columns, numeric data
#1,500,000 x 120 x 8 bytes/numeric = 1440000000 bytes
#=1440000000/2^20 btes/MB
#=1,373,29 MB
#=1.34GB





#Textual Data Formats: dput() and dump()
#dput R objects: a way to pass data around by deparsing the R object with dput and reading it back in using dget
y <- data.frame(a = 1, b = "a")
dput(y)
##structure(linst(a = 1,
                ##b = structure(1L, .label = "a",
                              ##class = "factor")),
          ##.Names = c("a", "b"), row.names = c(NA, -1L),
          ##class = "data.frame")
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y
#dump R object: multiple objects can be deparsed
x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "data.R")
rm(x,y)
source("data.R")





#interfaces to the outside world: dat are read in using connection interfaces
file #opens a connection to a file
gzfile #opens a connection to a file compressed with gzip
bzfile #opens a connection to a file compressed with bzip2
url #opens a connection to a webpage

#File connections
str(file)
#function (description = "", open = "", blocking = TRUE, encoding = getOption("encoding"))
#description is the name of the file
#open is a code indicadicating: "r" read only, "w" writing, "a" appending, "rb""wb""ab" reading, writing, or appending in binary mode

#connections
con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)
#is the same as
data <- read.csv("foo.txt")

#reading lines of a textfile, read parts of file, 10 lines
con <- gzfile("words.gz")
x <- readLines(con, 10)
x

#reading lines of webpages
con <- url("http://www/jhsph.edu", "r")
x <- readLines(con)
head(x)
#it is another way to read data instead of read.table or read.csv




#Subsetting R objects
#operators that can be used to extract subsets of R objects
#[ #always returns as object of the same class as the origical, can be used to select more than one element
#[[ #used to extract elements of a list or a data frame (can have multiple classes of objects), it can only be used to extract  a single element
#$ #used to extract elements of a list or data frame by name  

x <- c("a", "b", "c","c", "d", "a")
x[1]
x[1:4]
x[x > "a"]
u <- x >"a"
u
x[u]

#Subsetting lists
x <- list(foo = 1:4, bar = 0.6)
x[1]
x[[1]]
x$bar
x[["bar"]]
x["bar"]

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1,3)]
#cannot extract multiple elements using $ or [[]]

#the [[]] operator can be used with computed indices; $ can only be used with literal names
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]] ##computed index for 'foo'
x$name ## element 'name' does not exist
x$foo ## element 'foo' does exist

#The [[]] can take an integer sequence
x <- list(a = list(10, 12,14), b = c(3.14, 2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]



#subsetting a matrix
#matrices can be subsetted with (i,j) type indices
x <- matrix(1:6, 2, 3)
x[1,2]
x[2,1]
#indices can also be missing
x[1, ]
x[ ,2]

#by default, when a single element of a matrix is retrieved, it is returned as a vesctor of lengh 1 rather than a 1x1 matrix. this behavior can be turned off by setting drop = FALSE
x <- matrix(1:6, 2, 3)
x[1,2]
x[1,2, drop = FALSE]

#similarly subsetting a single column or a row will give a vector, not a matrix
x <- matrix(1:6, 2, 3)
x[1, ]
x[1, , drop = FALSE]


#subsetting with Names
#Partial matching of names is allowed with [[]] and $
x <- list(aardvark = 1:5)
x$a
x[["a"]] #NULL
x[["a", exact = FALSE]]

#Subsetting: removing missing values (NA)
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]

#what if there are multiple things and you want to take the subset with no missing values
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x,y)
good
x[good]
y[good]


#To subset a matrix with logic
data <- read.csv("hw1_data.csv")
bad <- is.na(data$Ozone)
good <- data$Ozone[!bad]
mean(good)

test1 <- data$Ozone > 31
data1 <- data[test1, ]
test2 <- data$Temp > 90
data2 <- data1[test2, ]
bad <- is.na(data2$Solar.R)
good <- data2$Solar.R[!bad]
mean(good)

test3 <- data$Month == 6
data3 <- data[test3, ]
bad <- is.na(data3$Temp)
good <- data3$Temp[!bad]
mean(good)
max(good)



#Vectorized operations: things can happen in parallel
x <- 1:4; y <- 6:9
x + y
x > 2
x >= 2
y == 8 #test for equality
x * y
x / y

#vectorized matrix operations
x <- matrix(1:4, 2,2); y <- matrix(rep(10,4), 2, 2)
x + y
x / y
x %*% y #ture matrix multiplication
