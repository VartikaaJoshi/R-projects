#Import the Data
getwd()
setwd("/Users/vj/Documents/ALY 6000")
mov <- read.csv("Section6-Homework-Data.csv")

#Data Exploration
head(mov) #top rows
summary(mov) #column summaries
str(mov) #structure of the dataset

#Installing e1071 package to check kurtosis
install.packages("e1071")
library(e1071)
k_Budget <-mov$Budget...mill.
kurtosis(k_Budget)

#Converting the Char variables into factors for plotting the ggpot

mov$Genre  <- factor(mov$Genre)
mov$Studio  <- factor(mov$Studio)
mov$Movie.Title  <- factor(mov$Movie.Title)
mov$Adjusted.Gross...mill.  <- factor(mov$Adjusted.Gross...mill.)
mov$Gross...mill.  <- factor(mov$Gross...mill.)
mov$Director  <- factor(mov$Director)
mov$Day.of.Week  <- factor(mov$Day.of.Week)
mov$Release.Date  <- factor(mov$Release.Date)
mov$Overseas...mill.  <- factor(mov$Overseas...mill.)
mov$Profit...mill.  <- factor(mov$Profit...mill.)

str(mov)


#Activate GGPlot2
#install.packages("ggplot2")
library("ggplot2")


#Generating the histogram using ggpot to check Budget distribution among each genre
t<- ggplot(data=mov, aes(x=Budget...mill. ))
t+ geom_histogram(binwidth=10, fill="Yellow", colour="Black")

#Genre vs Budget
t<- ggplot(data=mov, aes(x=Genre, y= Budget...mill.))
t+  geom_point()

#Studio vs Gross
plot(x,type="o",col= "red", xlab= "Studio", ylab="Gross...US ", main = "Studio vs Gross")

#Net worth vs Industry
ggplot(data=mov, aes(x=Runtime..min. , y= Genre))+ geom_point() + geom_smooth()


# No movies are released on a Monday. Ever.

ggplot(data=mov, aes(x=Day.of.Week)) + geom_bar()


#Now we need to filter our dataset to leave only the 
#Genres and Studios that we are interested in
#We will start with the Genre filter and use the Logical 'OR'
#operator to select multiple Genres:
filt <- (mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")

#Now let's do the same for the Studio filter:
filt2 <- (mov$Studio == "Buena Vista Studios") | (mov$Studio =="WB") | (mov$Studio =="Fox") | (mov$Studio =="Universal") | (mov$Studio == "Sony") | (  mov$Studio =="Paramount Pictures")
  
#Apply the row filters to the dataframe
mov2 <- mov[filt & filt2,]

#Prepare the plot's data and aes layers
#Note we did not rename the columns. 
#Use str() or summary() to fin out the correct column names
p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))
p #Nothing happens. We need a geom.

#Add a Point Geom Layer
p + geom_point()
 
#Add a boxplot instead of the points
p + geom_boxplot()
  
#Add points
p + geom_jitter(aes(size=Budget...mill., colour=Studio)) +
  geom_boxplot(alpha=0.5, outlier.colour=NA) 
  

#Non-data ink
q <- p +
  xlab("Genre") + #x axis title
  ylab("Gross % US") + #y axis title
  ggtitle("Domestic Gross % by Genre") #plot title
q



#Theme
q <- q + 
  theme(
    #this is a shortcut to alter ALL text elements at once:
    text = element_text(family="Comic Sans MS"),
    
    #Axes titles:
    axis.title.x= element_text(colour="Blue", size=30),
    axis.title.y= element_text(colour="Blue", size=30),
    
    #Axes texts:
    axis.text.x= element_text(size=20),
    axis.text.y= element_text(size=20),  
    
    #Plot title:
    plot.title= element_text(colour="Black",
                              size=40),
    
    #Legend title:
    legend.title= element_text(size=20),
    
    #Legend text
    legend.text= element_text(size=12)
  )
q
titles:
q$labels$size = "Budget $M"
q
