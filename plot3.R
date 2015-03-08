# Read dataset into R
completeData <- read.csv("household_power_consumption.txt",
                         sep = ";",
                         na.strings = "?"
)

# Convert Date column into the appropriate format

completeData$Date <- as.Date(completeData$Date, format = "%d/%m/%Y")


# Subset data to include only observaions between 01/02/2007 and 02/02/2007

myData <- subset(completeData, subset = Date >= "2007-02-01" & Date <= "2007-02-02")

# Format date and time into POSIXct

dateTime <- paste(as.Date(myData$Date), myData$Time)
myData$DateTime <- as.POSIXct(dateTime)

# Create plot 3 and save to file

png("plot3.png", width=480, height=480, units="px")

plot(myData$Sub_metering_1 ~ myData$DateTime, xlab="", ylab="Energy Sub Metering", type="l", col="green")
lines(myData$Sub_metering_2 ~ myData$DateTime, col="blue")
lines(myData$Sub_metering_3 ~ myData$DateTime, col="red")
legend("topright", col=c("green", "blue", "red"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=1, lwd=2)

dev.off()


# Remove leftovers from environment

rm(list = c("completeData", "myData", "dateTime"))