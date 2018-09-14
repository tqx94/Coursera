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

#converts Global Active Power column from "factor" to "numeric"
data[,3] <- as.numeric(levels(data[,3]))[data[,3]]

#initializes the png image file
png(file="plot2.png", width=480, height = 480)
#creates plot of Global Active Power over time
plot(data[,2], data[,3], type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
#ends plotting to the png file
dev.off()