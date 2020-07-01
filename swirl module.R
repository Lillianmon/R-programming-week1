#install swirl
install.packages("swirl")

#check version
packageVersion("swirl")

#load swirl
library(swirl)

#install the R programming course
install_from_swirl("R Programming")

#start swirl and complete the lessons
swirl()

#
ls() # to see a list of the variables in your workspace
rm(list=ls()) # to clear your workspace

#  When you are at the R prompt (>):
#Typing skip() allows you to skip the current question.
#Typing play() lets you experiment with R on your own; swirl will ignore what you do...
#UNTIL you type nxt() which will regain swirl's attention.
#Typing bye() causes swirl to exit. Your progress will be saved.
#Typing main() returns you to swirl's main menu.
#Typing info() displays these options again.

#determine which directory your R session is using currently
getwd()

#list all the objects in local workspace
ls()

#list all the files in the working directory
list.files()
dir()

#create a new directory
dir.create("xxx")

#to set the working directory
setwd("xxx")

#to create a file in the directory
file.create("yyy")

#checking if file exists
file.exists("yyy")

#access information about the file
file.info("yyy")
#You can use the $ operator --- e.g., file.info("yyy")$mode --- to grab specific items.

#change the name of the file
file.rename("from", "to")

#make a copy of the file
file.copy("from", "to")

#The `<` and `>=` symbols in these examples are called'logical operators'. Other logical operators include `>`, `<=`, `==` for exact equality, and `!=` for inequality.