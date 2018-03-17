#Load the dataset
rm(list = ls())
dataset <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

dataset <- subset(dataset, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

dataset$datetime <- strptime(paste(dataset$Date, dataset$Time), "%Y-%m-%d %H:%M:%S")

#Plot 4
dataset$datetime <- as.POSIXct(dataset$datetime)
par(mfrow = c(2,2))
attach(dataset)

plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", xlab = "")
plot(Voltage ~ datetime, type = "l")
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n")
plot(Global_reactive_power ~ datetime, type = "l")
dev.copy(png, file = "plot4.png", height = 480, width = 480)

dev.off()
detach(dataset)
