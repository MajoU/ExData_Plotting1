library(sqldf)

setwd("~/Data_Science/Exploratory_Data_Analysis/Project_1")

sql <- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
data <- read.csv2.sql("household_power_consumption.txt", sql)

glob_pow <- data$Global_active_power
hist(glob_pow, col = "red", main = "Global active power", xlab = "Global active power (kilowatts)")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()


