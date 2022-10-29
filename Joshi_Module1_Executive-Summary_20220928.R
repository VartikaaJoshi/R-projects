print("Vartika Joshi")
install.packages("vcd")
library("vcd")
sales <- c(8,11,15,20,21,11,18,10,6,22) 
temp <- c(69,80,77,84,80,77,87,70,65,90) 
plot(sales, temp)
mean(temp)
sales <- sales[-3]
sales
sales <- append(sales,16,2)
sales
names <- c("Tom","Dick","Harry")
names
my_matrix <- matrix(1:10, byrow = TRUE, nrow=5)
my_matrix
icSales <- data.frame(sales, temp)
icSales
str(icSales)
summary(icSales)
my_data <- read.csv2(file.choose())
my_data
var_names <- colnames(my_data)
var_names


