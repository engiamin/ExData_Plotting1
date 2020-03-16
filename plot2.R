### Download and unzip file ###
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipped_file <- "household_power_consumption.zip"
download.file(url, zipped_file)

if(file.exists(zipped_file)) unzip(zipped_file)


### Read data ###
data <- read.table(text=grep("^[1,2]/2/2007", 
                             readLines("household_power_consumption.txt"), value=TRUE),
                   header=TRUE, sep=";", na.strings = "?")


names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


data$Date <- as.Date(data$Date, format="%d /%m /%Y")
data["DateTime"] <- as.POSIXct(paste(data$Date, data$Time)) 


### Plot 2 ###

plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)',
     type="l")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()