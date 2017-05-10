## Filename plot1.R 
## This R-Script constructs a plot named plot1.png for the first project in course Exploratory Data Analysis
## the scripts reads a file and creates the plot
## the file is read from the working directory

# Reads from file household_power_consumption.txt
completeFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";" , na.strings="?")
# convert the Date column to Date type
completeFile$Date <- as.Date(completeFile$Date, "%d/%m/%Y")
# subset dates from 2007/02/01 to 2007/02/02
myFile <- subset(completeFile, Date>="2007/2/1" & Date<="2007/2/2")

# activates png device and sends plot to file  
png(file="plot1.png")
hist(myFile$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


