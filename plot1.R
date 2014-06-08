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
png(filename = "plot1.png", width = 480, height = 480)

# Create histogram showing the frequency of different levels of Global Active Power
with(dataSub, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

# Close PNG device and save
dev.off()