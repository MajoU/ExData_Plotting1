library(data.table)
library(lubridate)

data <- fread("household_power_consumption.txt", na.strings="?")

sub_data <- data[grep("^1/2/2007|^2/2/2007", Date)]
Sys.setlocale("LC_TIME", "C")

# paste and assign Data and Time values into Date column
sub_data[, Date := paste(Date, Time)]

# assign to Date column time format through lubridate function
sub_data[, Date := dmy_hms(Date)]

# create plot
plot(Global_active_power ~ Date, sub_data, xlab = " ", ylab = "Global Active Power (kilowatts)", type = "l")
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()
