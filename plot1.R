##
##  Our overall goal here is simply to examine how household energy usage 
##   varies over a 2-day period in February, 2007.
##
##

library("lubridate")

s1 <- as.POSIXct("2007-02-01", tz="UTC")
s2 <- as.POSIXct("2007-02-02", tz="UTC")


classes <- c("character", "character", rep("numeric",7))

data.pwr <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, colClasses=classes)



data.pwr$Date <- dmy(data.pwr$Date)


d.pwr <- subset(data.pwr, Date==s1 | Date==s2)



png(filename = "plot1.png", 
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

#Histogram
hist(d.pwr$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#finish the graphic and close the file
dev.off()

rm(list=ls())




