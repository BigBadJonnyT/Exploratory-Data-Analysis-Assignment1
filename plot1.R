# Read full dataset into R
completeData <- read.csv("household_power_consumption.txt",
                   sep = ";",
                   na.strings = "?"
                   )

# Convert Date column into the appropriate format

completeData$Date <- as.Date(completeData$Date, format = "%d/%m/%Y")

# Subset data to include only observaions between 

myData <- subset(completeData, subset = Date >= "2007-02-01" & Date <= "2007-02-02")

# Create plot 1

hist(myData$Global_active_power, 
     main="Global Active Power", 
     xlab = "Global Active Power (Kilowatts)", 
     ylab = "Frequency", 
     col = "red")

#Save Graph to file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

# Remove leftovers from environment

rm(list = c("completeData", "myData"))