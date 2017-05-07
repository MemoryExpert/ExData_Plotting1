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

#open the png output device
png(filename = "plot1.png", width = 480, height = 480, bg = "white")

#create the historgram for plot 1
hist(powertable$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red")

#close connection to output device
dev.off()