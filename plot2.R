# Read full dataset into R
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

# Create plot 2

plot(myData$Global_active_power ~ myData$DateTime, type="l", xlab = "", ylab="Global Active Power (kilowatts)")

#Save Graph to file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

# Remove leftovers from environment

rm(list = c("completeData", "myData", "dateTime"))