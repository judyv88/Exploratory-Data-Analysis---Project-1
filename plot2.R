#Load the dataset
rm(list = ls())

dataset <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

dataset <- subset(dataset, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

dataset$datetime <- strptime(paste(dataset$Date, dataset$Time), "%Y-%m-%d %H:%M:%S")

#Plot 2
dataset$datetime <- as.POSIXct(dataset$datetime)
attach(dataset)
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(dataset)
