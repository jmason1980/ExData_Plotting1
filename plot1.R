## Getting Data
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL, destfile = "household_power_consumption.zip")
        unzip("household_power_consumption.zip")

## Cleaning Data
        power_data_file <- "household_power_consumption.txt"
        power_data <- read.table(power_data_file, sep = ";", 
                colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric",
                        "numeric", "numeric"), header = TRUE, na.strings = "?")
## Checking Header
        head(power_data)
                
## Reading 2 days in Feb
                power_data_feb <- subset(power_data, power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007")

## Plot 1 - Contruct Histogram
                hist(power_data_feb$Global_active_power, col = "red", 
                     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## Plot 1 - Save to PNG file
                dev.copy(png, file = "plot1.png", width = 480, height = 480)
                dev.off()
