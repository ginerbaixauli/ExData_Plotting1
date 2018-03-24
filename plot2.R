## Exploratory Data Analysis - Course Project 1 - Plot 2

# Loads data set
data <- read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";", na.strings = "?")

# Converts date to date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Gets data from 2007-02-01 to 2007-02-02
data2 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converts date and time to date-time format
data2$datetime <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")

# Plots data
plot(x = data2$datetime, y = data2$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

# Saves plot to a PNG file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()