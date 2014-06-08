#Homework 1 All Plots

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
dataSub <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

dataSub$Global_active_power <- as.numeric(dataSub$Global_active_power)
dataSub$DateTime <- paste(dataSub$Date, dataSub$Time, sep = " ")
dataSub$DateTime <- strptime(dataSub$DateTime, "%d/%m/%Y %H:%M:%S")

#Plot 1
png(filename = "plot1.png", width = 480, height = 480)
with(dataSub, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()

#Plot 2
png(filename = "plot2.png", width = 480, height = 480)
with(dataSub, plot(DateTime,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

#Plot 3
png(filename = "plot3.png", width = 480, height = 480)
with(dataSub, plot(DateTime,Sub_metering_1, type = "l", xlab = "", ylab = "Enery sub metering"))
with(dataSub, lines(DateTime,Sub_metering_2, type = "l", col = "red"))
with(dataSub, lines(DateTime,Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


# Plot 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

# Top left
with(dataSub, plot(DateTime,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# Top Right
with(dataSub, plot(DateTime,Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# Bottom Left
with(dataSub, plot(DateTime,Sub_metering_1, type = "l", xlab = "", ylab = "Enery sub metering"))
with(dataSub, lines(DateTime,Sub_metering_2, type = "l", col = "red"))
with(dataSub, lines(DateTime,Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

# Bottom Right
with(dataSub, plot(DateTime,Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()