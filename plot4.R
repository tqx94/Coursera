#file location on the web and download the file to the current directory
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "./data.zip")

#unzip the data, read in the data and limit the number of rows to save memory
data <- read.table(unz("data.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings="?", nrow=70000)

#subset the data based on the dates wanted
data <- data[which(data$Date == c("1/2/2007", "2/2/2007")), ]

#converts Date column from "factor" class to "date" class
data[,1] <- as.Date(data[,1], "%d/%m/%Y")

#converts Time column from "factor" class to POSIXct
data[,2] <- as.POSIXct(paste(data$Date, data$Time), format = "%Y/%d/%m %H:%M:%S")

#converts necessary columns from "factor" to "numeric"
data[,3] <- as.numeric(levels(data[,3]))[data[,3]]
data[,4] <- as.numeric(levels(data[,4]))[data[,4]]
data[,5] <- as.numeric(levels(data[,5]))[data[,5]]
data[,7] <- as.numeric(levels(data[,7]))[data[,7]]
data[,8] <- as.numeric(levels(data[,8]))[data[,8]]

#initializes the png image file
png(file="plot4.png", width=480, height = 480)
#sets the parameters for the plotting. a 2X2 matrix of plots, printed row by row and the margins.
par(mfrow=c(2,2), mar = c(4,4,2,2)+.1)
#creates the four plots
with(data, {
        plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        plot(Time, Voltage, type = "l", xlab = "datetime", ylab="Voltage")
        plot(Time, Sub_metering_1, type = "l", xlab="",ylab="Energy Sub Metering")
        lines(Time, Sub_metering_2, type="l", col="red")
        lines(Time, Sub_metering_3, type="l", col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=.75)
        plot(Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})
#ends plotting to the png file
dev.off()