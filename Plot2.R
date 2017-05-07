#This script was written by Patrick Devlin for the Coursera Exploratory Data Analysis class week 1 assignment.

require(data.table)
require(dplyr)

setwd("C:/Users/PWORKLAP/Documents/R-Projects/Exploratory Data Analysis")
#import file to data table
powertable <- fread(input = "household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("Date", "POSIXct","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

#Convert Date column to type Date
powertable$Date <- as.Date(powertable$Date, "%d/%m/%Y")

#use dplyr filter to choose data from only the two dates of interest
powertable <- filter(powertable, between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))

#combine Date and Time data to provide proper reference for time
time_for_plot <- paste(powertable$Date, powertable$Time)

#use strptime to convert to character to POSIXlt
time_for_plot <- strptime(time_for_plot, "%Y-%m-%d %H:%M:%S")

#open the png output device
png(filename = "plot2.png", width = 480, height = 480, bg = "white")

#create time series line plot
plot(time_for_plot, powertable$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#close connection to output device
dev.off()