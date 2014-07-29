library(sqldf)
library(lubridate)

setwd("~/Data_Science/Exploratory_Data_Analysis/Project_1/")

sql <- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
data <- read.csv2.sql("household_power_consumption.txt", sql)

glob_pow <- data$Global_active_power
Sys.setlocale("LC_TIME", "C")
date_paste <- paste(data$Date, data$Time)
dates <- dmy_hms(date_paste)
plot(glob_pow ~ dates, xlab = " ", ylab = "Global Active Power (kilowatts)", type = "l")
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()
