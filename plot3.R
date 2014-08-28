library(data.table)
library(lubridate)

data <- fread("household_power_consumption.txt", na.strings="?")

# Subset and transform Date
sub_data <- data[grep("^1/2/2007|^2/2/2007", Date)]
Sys.setlocale("LC_TIME", "C")
sub_data[, Date := paste(Date, Time)]
sub_data[, Date := dmy_hms(Date)]

# Plotting
sub_met = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(Sub_metering_1 ~ Date, sub_data, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(Sub_metering_2 ~ Date, sub_data, type = "l", col = "red")
lines(Sub_metering_3 ~ Date, sub_data, type = "l", col = "blue")
legend("topright", legend = sub_met, lty = c(1,1), cex = 1.1,  col = c("black","red", "blue"))
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()
