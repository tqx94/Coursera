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
data[,2] <- as.POSIXct(paste(data$Date, data$Time), formate = "%Y/%d/%m %H:%M:%S")

#converts Energy Sub Metering columns from "factor" to "numeric"
data[,7] <- as.numeric(levels(data[,7]))[data[,7]]
data[,8] <- as.numeric(levels(data[,8]))[data[,8]]

#initializes the png image file
png(file="plot3.png", width=480, height = 480)
#creates plot of the Sub Metering from 3 different sources
plot(data[,2], data[,7], type = "l", xlab = "", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
#ends plotting to the png file
dev.off()