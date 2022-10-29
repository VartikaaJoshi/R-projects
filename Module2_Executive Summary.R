#Checking the directory
getwd()
#Setting the directory to the desired place
setwd("/Users/vj/Documents/ALY 6000")

#Rechecking the directory
getwd()

#Importing the data set of the 500 richest people in  2021
rich_people_data <- read.csv("500 richest people 2021(II).csv")

#Checking the heading to see if all the columns are imported
head(rich_people_data)

#Using the summary function to get the summary of the data set
summary(rich_people_data)

#Checking the dimension of the data set
dim(rich_people_data)

#Using the str() function to check the structure of the data set
str(rich_people_data)

#Renaming the attributions of the data set for easier usage
names(rich_people_data)<- c("Rank", "Name","Net_worth", "Last_change","YTD_change","Country", "Industry")
names(rich_people_data)

#Rechecking the Summary and Structure after renaming the data set
summary(rich_people_data)
str(rich_people_data)

#Checking the standard deviation of the dataset
sd(rich_people_data$Last_change)
sd(rich_people_data$Net_worth, na.rm=TRUE)
sd(rich_people_data$YTD_change)

#Installing e1071 package to check kurtosis
install.packages("e1071")
library(e1071)
k_YTD <-rich_people_data$YTD_change
kurtosis(k_YTD)

#Converting the Char variables into factors for plotting the ggpot
rich_people_data$Name <- factor(rich_people_data$Name)
rich_people_data$Country <- factor(rich_people_data$Country)
rich_people_data$Industry <- factor(rich_people_data$Industry)

#Rechecking the structure
str(rich_people_data)


library(ggplot2)

#Generating the histogram using ggpot to check Net_worth distribution among each people
t<- ggplot(data=rich_people_data, aes(x=Net_worth))
t+ geom_histogram(binwidth=10, fill="Yellow", colour="Black")

#Industry vs Net_worth
t<- ggplot(data=rich_people_data, aes(x=Indusrty, y= Net_worth))
t+  geom_point()

#Country vs YTD change
plot(x,type="o",col= "red", xlab= "Country", ylab="YTD_change", main = "Country vs YTD Change")

#Net worth vs Industry
ggplot(data=rich_people_data, aes(x= Net_worth, y= Industry))+ geom_point() + geom_smooth()

#YTD change vs Country
ggplot(data=rich_people_data, aes(x= YTD_change, y= Country))+ geom_point() + geom_smooth()

#Industry vs Last change
ggplot(data=rich_people_data, aes(x= Industry, y= Last_change))+ geom_point() + geom_smooth()
