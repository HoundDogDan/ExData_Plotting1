##
##  Our overall goal here is simply to examine how household energy usage 
##   varies over a 2-day period in February, 2007.
##
##

library("lubridate")

#These are the dates we are interested in exploring
s1 <- as.POSIXct("2007-02-01", tz="UTC")
s2 <- as.POSIXct("2007-02-02", tz="UTC")

#set up column classes so the read.table goes faster
classes <- c("character", "character", rep("numeric",7))

#unzip and read the data
data.pwr <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, colClasses=classes)

#pull together the short date and time into one column
data.pwr$DateTime <- paste(data.pwr$Date, data.pwr$Time)

#use lubridate to make the Date variable POSIXct
data.pwr$Date <- dmy(data.pwr$Date)

#pull out only the data records we want to explore
d.pwr <- subset(data.pwr, Date==s1 | Date==s2)


# use lubridate to fix the date time and format
d.pwr$DateTime <- dmy_hms(d.pwr$DateTime)



png(filename = "plot2.png", 
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

plot( d.pwr$DateTime, d.pwr$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")



dev.off()

#rm(list=ls())






























