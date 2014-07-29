library(sqldf)
library(lubridate)

setwd("~/Data_Science/Exploratory_Data_Analysis/Project_1/")

sql <- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
data <- read.csv2.sql("household_power_consumption.txt", sql)

glob_pow <- data$Global_active_power
Sys.setlocale("LC_TIME", "C")
date_paste <- paste(data$Date, data$Time)
dates <- dmy_hms(date_paste)
png(file="plot3.png", width = 480, height = 480)
sub_met = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(dates, data$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(dates, data$Sub_metering_2, type = "l", col = "red")
lines(dates, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1,col = c("black","red", "blue"), legend = sub_met)
dev.off()