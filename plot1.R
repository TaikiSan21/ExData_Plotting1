## Read the data in from the file, setting directory to file loc first
setwd("~/Coursera R")
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")

## Convert dates from dd/mm/yyyy to POSIXlt
dFormat <- "%d/%m/%Y"
data$Date <- strptime( data[,"Date"], format = dFormat )

## Take only dates 2007-02-01 and -02-02
data <- data[ data$Date == "2007-02-01" | data$Date == "2007-02-02",]

## Convert times from hh:mm:ss to POSIXlt
tFormat <- "%H:%M:%S"
data$Time <- strptime( data[,"Time"], format=tFormat)

## Used for saving file
png("~/Coursera/DS Repo/ExData_Plotting1/plot1.png", width=504, height=504)

hist(data$Global_active_power, col='seagreen', xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
