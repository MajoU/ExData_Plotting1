library(sqldf)
library(lubridate)

setwd("~/Data_Science/Exploratory_Data_Analysis/Project_1/")

sql <- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
data <- read.csv2.sql("household_power_consumption.txt", sql)

glob_pow <- data$Global_active_power
Sys.setlocale("LC_TIME", "C")
date_paste <- paste(data$Date, data$Time)
dates <- dmy_hms(date_paste)
par(mfrow = c(2,2))

# First plot
plot(glob_pow ~ dates, xlab = " ", ylab = "Global Active Power", type = "l")

# Second plot
plot(data$Voltage ~ dates, type = "l", ylab = "Voltage", xlab = "datetime")

# Third plot
sub_met = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(data$Sub_metering_1 ~ dates, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(data$Sub_metering_2 ~ dates, type = "l", col = "red")
lines(data$Sub_metering_3 ~ dates, type = "l", col = "blue")
legend("topright", legend = sub_met, bty = "n", lty = c(1,1), cex = 1.0, col = c("black","red", "blue"))

# Fourth plot
grp <- data$Global_reactive_power
plot(grp ~ dates, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, file="plot4.png",width=480,height=480)
dev.off()
