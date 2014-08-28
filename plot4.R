library(data.table)
library(lubridate)


data <- fread("household_power_consumption.txt", na.strings="?")

# Subset and transform Date
sub_data <- data[grep("^1/2/2007|^2/2/2007", Date)]
Sys.setlocale("LC_TIME", "C")
sub_data[, Date := paste(Date, Time)]
sub_data[, Date := dmy_hms(Date)]


# Start Plotting
par(mfrow = c(2,2))

# First plot
plot(Global_active_power ~ Date, sub_data, xlab = " ", ylab = "Global Active Power", type = "l")

# Second plot
plot(Voltage ~ Date, sub_data, type = "l", ylab = "Voltage", xlab = "datetime")

# Third plot
sub_met = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(Sub_metering_1 ~ Date, sub_data, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(Sub_metering_2 ~ Date, sub_data, type = "l", col = "red")
lines(Sub_metering_3 ~ Date, sub_data, type = "l", col = "blue")
legend("topright", legend = sub_met, bty = "n", lty = c(1,1), cex = 1.0, col = c("black","red", "blue"))

# Fourth plot
plot(Global_reactive_power ~ Date, sub_data, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, file="plot4.png",width=480,height=480)
dev.off()
