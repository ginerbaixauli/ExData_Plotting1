## Exploratory Data Analysis - Course Project 1 - Plot 4

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
par(mfrow = c(2, 2))

# 1st plot
plot(x = data2$datetime, y = data2$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power")

# 2nd plot
plot(x = data2$datetime, y = data2$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")

# 3rd plot
plot(x = data2$datetime, y = data2$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(x = data2$datetime, y = data2$Sub_metering_2, col = "Red")
lines(x = data2$datetime, y = data2$Sub_metering_3, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.3,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

# 4th plot
plot(x = data2$datetime, y = data2$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

# Saves plot to a PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()