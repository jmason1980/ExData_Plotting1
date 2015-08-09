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

## Converting global active power, submetering, voltage, and global reactive power to numeric
        global_active_power <- as.numeric(power_data_feb$Global_active_power)
        sub_metering1 <- as.numeric(power_data_feb$Sub_metering_1)
        sub_metering2 <- as.numeric(power_data_feb$Sub_metering_2)
        sub_metering3 <- as.numeric(power_data_feb$Sub_metering_3)
        voltage <- as.numeric(power_data_feb$Voltage)
        global_reactive_power <- as.numeric(power_data_feb$Global_reactive_power)
        
## Plot4
        png("plot4.png", width=480, height=480)
        par(mfrow = c(2, 2))
        plot(date_time, global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        plot(date_time, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        plot(date_time, sub_metering1, type="l", ylab="Energy sub metering", xlab="")
                lines(date_time, sub_metering2, type="l", col = "red")
                lines(date_time, sub_metering3, type = "l", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                lty=1, lwd=2.5, col=c("black", "red", "blue"))
        plot(date_time, global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        dev.off()