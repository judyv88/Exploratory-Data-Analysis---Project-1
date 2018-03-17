## Load the dataset
rm(list = ls())
dataset <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
# convert the date variable to Date class
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

# Subset the data
dataset <- subset(dataset, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
dataset$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Plot 1
attach(dataset)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(dataset)
