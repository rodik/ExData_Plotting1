# read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c(rep("character",2), rep("numeric",7)), na.strings = "?")
# subset
feb <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
# create datetime column
feb$DT <- strptime(paste(feb$Date, feb$Time), format = "%d/%m/%Y %H:%M:%S")
# plot
png(file="plot4.png", width=480, height=480)

par(mfrow = c(2,2))
# 1
plot(feb$DT, feb$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")
#2
with(feb, plot(DT, Voltage, type="l", xlab = "datetime"))
#3
with(feb, plot(DT, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l"))
with(feb, lines(DT, Sub_metering_2, col="red"))
with(feb, lines(DT, Sub_metering_3, col="blue"))
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
with(feb, plot(DT, Global_reactive_power, type="l", xlab = "datetime"))

dev.off()