#file location on the web and download the file to the current directory
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "./data.zip")

#unzip the data, read in the data and limit the number of rows to save memory
data <- read.table(unz("data.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings="?", nrow=70000)

#subset the data based on the dates wanted
data <- data[which(data$Date == c("1/2/2007", "2/2/2007")), ]

#converts Date column from "factor" class to "date" class
data[,1] <- as.Date(data[,1], "%d/%m/%Y")

#converts Global Active Power column from "factor" to "numeric"
data[,3] <- as.numeric(levels(data[,3]))[data[,3]]

#initializes the png image file
png(file="plot1.png", width=480, height = 480)
#creates histogram of Global Active Power with x label and red color
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red")
#ends plotting to the png file
dev.off()