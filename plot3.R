# read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c(rep("character",2), rep("numeric",7)), na.strings = "?")
# subset
feb <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
# create datetime column
feb$DT <- strptime(paste(feb$Date, feb$Time), format = "%d/%m/%Y %H:%M:%S")
# plot
png(file="plot3.png", width=480, height=480)
with(feb, plot(DT, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l"))
with(feb, lines(DT, Sub_metering_2, col="red"))
with(feb, lines(DT, Sub_metering_3, col="blue"))
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()