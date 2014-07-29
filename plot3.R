library(sqldf)
library(lubridate)

setwd("~/Data_Science/Exploratory_Data_Analysis/Project_1/")

sql <- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
data <- read.csv2.sql("household_power_consumption.txt", sql)

Sys.setlocale("LC_TIME", "C")
date_paste <- paste(data$Date, data$Time)
dates <- dmy_hms(date_paste)
sub_met = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(data$Sub_metering_1 ~ dates, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(data$Sub_metering_2 ~ dates, type = "l", col = "red")
lines(data$Sub_metering_3 ~ dates, type = "l", col = "blue")
legend("topright", legend = sub_met, lty = c(1,1), cex = 1.1,  col = c("black","red", "blue"))
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()
