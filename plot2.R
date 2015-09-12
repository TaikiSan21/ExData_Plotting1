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
png("~/Coursera/DS Repo/ExData_Plotting1/plot2.png", width=504, height=504)

plot(data$DateTime, data$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()