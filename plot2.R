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

## Converting Date/Time
        date_time <- strptime(paste(power_data_feb$Date, power_data_feb$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Converting global active power to numeric
        global_active_power <- as.numeric(power_data_feb$Global_active_power)

## Plot2
        png("plot2.png", width=480, height=480)
        plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        dev.off()
