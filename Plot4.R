#This script was written by Patrick Devlin for the Coursera Exploratory Data Analysis class week 1 assignment.

setwd("C:/Users/PWORKLAP/Documents/R-Projects/Exploratory Data Analysis")

powertable <- fread(input = "household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("Date", "POSIXct","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
powertable$Date <- as.Date(powertable$Date, "%d/%m/%Y")

powertable <- filter(powertable, between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))

time_for_plot <- paste(powertable$Date, powertable$Time)
time_for_plot <- strptime(time_for_plot, "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, bg = "white")
par(mfrow = c(2,2))

plot(time_for_plot, powertable$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(time_for_plot, powertable$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(time_for_plot, powertable$Sub_metering_1, type = "l", col = "black", ylim = range(c(powertable$Sub_metering_1, powertable$Sub_metering_2, powertable$Sub_metering_3)), xlab = "", ylab = "Energy sub metering")
par(new = TRUE)
plot(time_for_plot, powertable$Sub_metering_2, type = "l", col = "red", ylim = range(c(powertable$Sub_metering_1, powertable$Sub_metering_2, powertable$Sub_metering_3)), xlab = "", ylab = "Energy sub metering")
par(new = TRUE)
plot(time_for_plot, powertable$Sub_metering_3, type = "l", col = "blue", ylim = range(c(powertable$Sub_metering_1, powertable$Sub_metering_2, powertable$Sub_metering_3)), xlab = "", ylab = "Energy sub metering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"), bty = "n")

plot(time_for_plot, powertable$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()