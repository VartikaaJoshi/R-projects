print("Vartika Joshi")

install.packages("FSA")
library(FSA)

install.packages("FSAdata")
library(FSAdata)

install.packages("magrittr")
library(magrittr)

install.packages("dplyr")
library(dplyr)

install.packages("tidyverse")
library(tidyverse)


getwd()

bio_data <- read.csv("inchBio.csv")
head(bio_data)
tail(bio_data)
str(bio_data)
summary(bio_data)


count_biodata <-  length(bio_data$species)
count_biodata

unique(bio_data$species)

table_biodata <- table(bio_data$species)
table_biodata

subset_biodata <- subset(bio_data, select=species)
head(subset_biodata, 5)


class_biodata <- table(bio_data$species)
class_biodata
class(class_biodata)

dataframe_biodata<- data.frame(class_biodata)
class(dataframe_biodata)

dataframe_biodata$Freq

species_category <- table(bio_data$species)
species_category 

class(species_category)

summary(bio_data)

#Converting the Char variables into factors for plotting the ggpot
bio_data$species <- factor(bio_data$species)
bio_data$tag <- factor(bio_data$tag)
bio_data$scale <- factor(bio_data$scale)
str(bio_data)
summary(bio_data)

install.packages("ggplot2")
library(ggplot2)
q <- ggplot(data=bio_data, aes(x= tl, y= species)) + geom_point() + geom_smooth() 
q


gg <- ggplot(bio_data, aes(x=w, y=tl)) + geom_point(aes(col=species)) + geom_smooth(method="loess", se=F)  + 
  labs(subtitle="weight vs length", y="Length", x="Weight",  title="Scatterplot",  caption = "Source: bio_inch")

plot(gg)

ggplot(bio_data, aes(x=species, y=w)) + geom_bar(stat='identity', aes(fill=tl), width=1)  + coord_flip()

ggplot(bio_data, aes(x=species, y=tag + 
  geom_point(col="tomato2", size=0.02) +   # Draw points
 # Draw dashed lines
  labs(title="Dot Plot", 
       subtitle="species Vs tag", 
       caption="source: bioinch") 

 
 a <- ggplot(bio_data, aes(w)) + scale_fill_brewer(palette = "Spectral")
 
 a+ geom_histogram(aes(fill=species), 
                    binwidth = 100, 
                    col="black", 
                    size=.1) +  # change binwidth
   labs(title="Histogram with weight")

 
 
 g <- ggplot(bio_data, aes(tl)) + scale_fill_brewer(palette = "Spectral")
 
 g + geom_histogram(aes(fill=species), 
                    binwidth = 10, 
                    col="black", 
                    size=.1) +  # change binwidth
   labs(title="Histogram with length")