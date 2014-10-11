# read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c(rep("character",2), rep("numeric",7)), na.strings = "?")
# subset
feb <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
# create datetime column
feb$DT <- strptime(paste(feb$Date, feb$Time), format = "%d/%m/%Y %H:%M:%S")
# plot
png(file="plot2.png", width=480, height=480)
plot(feb$DT, feb$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()