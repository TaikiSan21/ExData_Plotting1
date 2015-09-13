## Read the data in from the file, setting directory to file loc first
setwd("~/Coursera/DS Repo/ExData_Plotting1")
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")

## Convert dates from dd/mm/yyyy to POSIXlt
dFormat <- "%d/%m/%Y %H:%M:%S"


## Take only dates 2007-02-01 and -02-02
data <- data[ data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data["DateTime"]<- paste( data$Date, data$Time)

data$DateTime <- as.POSIXct(strptime( data[,"DateTime"], format = dFormat ))

## Used for saving file
## png("plot4.png", width=504, height=504)

##Create 2x2 grid for plotting
par(mfrow=c(2,2))

## Top left plot is same as plot 2
plot(data$DateTime, data$Global_active_power, type="l",xlab="", ylab="Global Active Power", col="royalblue")

## Top right plot
plot(data$DateTime, data$Voltage, type="l",xlab="datetime", ylab="Voltage", col="tan1")

## Bottom left plot is same as plot 3
plot(data$DateTime, data$Sub_metering_1, type="n", xlab="",ylab="Energy sub metering")
points(data$DateTime, data$Sub_metering_1, type="l", col="lightseagreen")
points(data$DateTime, data$Sub_metering_2, type="l", col="firebrick1")
points(data$DateTime, data$Sub_metering_3, type="l", col="darkorchid4")
legend("topright", col=c("lightseagreen","firebrick1","darkorchid4"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty="n")

## Bottom right plot
plot(data$DateTime, data$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power", col="yellowgreen")

## dev.off()