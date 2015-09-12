## Read the data in from the file, setting directory to file loc first
setwd("~/Coursera R")
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")

## Convert dates from dd/mm/yyyy to POSIXlt
dFormat <- "%d/%m/%Y %H:%M:%S"


## Take only dates 2007-02-01 and -02-02
data <- data[ data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data["DateTime"]<- paste( data$Date, data$Time)

data$DateTime <- as.POSIXct(strptime( data[,"DateTime"], format = dFormat ))

## Used for saving file
png("~/Coursera/DS Repo/ExData_Plotting1/plot3.png", width=504, height=504)

plot(data$DateTime, data$Sub_metering_1, type="n", xlab="",ylab="Energy sub metering")
points(data$DateTime, data$Sub_metering_1, type="l", col="green")
points(data$DateTime, data$Sub_metering_2, type="l", col="orange")
points(data$DateTime, data$Sub_metering_3, type="l", col="purple")
legend("topright", col=c("green","orange","purple"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)

dev.off()