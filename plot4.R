## Filename plot4.R 
## This R-Script constructs a plot named plot4.png for the first project in course Exploratory Data Analysis
## the scripts reads a file and creates the plot
## the file is read from the working directory

# Reads from file household_power_consumption.txt
completeFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";" , na.strings="?")
# convert the Date column to Date type
completeFile$Date <- as.Date(completeFile$Date, "%d/%m/%Y")
# subset dates from 2007/02/01 to 2007/02/02
myFile <- subset(completeFile, Date>="2007/2/1" & Date<="2007/2/2")
# Concatenate date and time
myFile$Time <- as.POSIXct(paste(myFile$Date, myFile$Time), format="%Y-%m-%d %H:%M:%S")

# activates png device and sends plots to file  
png(file="plot4.png", width=480, height=480, units="px")

# set the canvas to 2x2 matrix
par(mfrow=c(2,2), mar=c(4,4,2,1))

#draw first plot (upper left corner)
with(myFile, plot(Time, Global_active_power, type="l", ylab="Global Active Power", xlab=""))

#draw second plot (upper right corner)
with(myFile, plot(Time, Voltage, type="l", xlab="datetime"))  

# Third plot (lowerleft corner)
with(myFile, plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(myFile, points(Time, Sub_metering_1, type="l"))
with(myFile, points(Time, Sub_metering_2, col="red", type="l"))
with(myFile, points(Time, Sub_metering_3, col="blue", type="l"))
legend("topright", pch="_", col=c("black", "blue", "red"), legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

# fourth plot (lower right corner)
with(myFile, plot(Time, Global_reactive_power, type="l", xlab="datetime"))  

dev.off()
