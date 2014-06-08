# This script was created as part of the Exploratory Data Analysis Course on Coursera
# The goal of this script is to create a plot using the base plotting system.

# Read in data and subset to relevant portion
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
dataSub <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Convert data into usable form (numeric and date objects as relevant)
dataSub$Global_active_power <- as.numeric(dataSub$Global_active_power)
dataSub$DateTime <- paste(dataSub$Date, dataSub$Time, sep = " ")
dataSub$DateTime <- strptime(dataSub$DateTime, "%d/%m/%Y %H:%M:%S")

# Plotting time!
# Open PNG object 
png(filename = "plot4.png", width = 480, height = 480)

# Subset plot into 2 X 2 regions
par(mfrow=c(2,2))

# Top left Plot
with(dataSub, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# Top Right Plot
with(dataSub, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# Bottom Left Plot
with(dataSub, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Enery sub metering"))
with(dataSub, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(dataSub, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

# Bottom Right Plot
with(dataSub, plot(DateTime,Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

# Close PNG device and save
dev.off()