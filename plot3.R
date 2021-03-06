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


data.pwr$DateTime <- paste(data.pwr$Date, data.pwr$Time)

data.pwr$Date <- dmy(data.pwr$Date)

#pull out only the data records we want to explore
d.pwr <- subset(data.pwr, Date==s1 | Date==s2)


# use lubridate to fix the date time and format
d.pwr$DateTime <- dmy_hms(d.pwr$DateTime)


#storing our plot in the png graphics object
png(filename = "plot3.png", 
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))


#empty plot
plot( d.pwr$DateTime, d.pwr$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

#add each of the three varaibles as lines
lines(d.pwr$DateTime, d.pwr$Sub_metering_1, col="black")
lines(d.pwr$DateTime, d.pwr$Sub_metering_2, col="red")
lines(d.pwr$DateTime, d.pwr$Sub_metering_3, col="blue")

#add the legend
legend("topright",lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#finish the graphic and close the file
dev.off()


#rm(list=ls())





























