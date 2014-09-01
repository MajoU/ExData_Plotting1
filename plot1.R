library(data.table)

# make "?" as NA values and read fast through fread
data <- fread("household_power_consumption.txt", na.strings="?")

# find row values through grep in Date column and subset
# Global_active_power values with this rows index
glob_pow <- data[grep("^1/2/2007|^2/2/2007", Date), Global_active_power]

# create histogram
hist(as.numeric(glob_pow), col = "red", main = "Global active power", xlab = "Global active power (kilowatts)")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()


