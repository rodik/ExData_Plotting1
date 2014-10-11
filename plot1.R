# read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c(rep("character",2), rep("numeric",7)), na.strings = "?")
# subset
feb <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
# plot
png(file="plot1.png", width=480, height=480)
hist(feb$Global_active_power, col="red" , xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()