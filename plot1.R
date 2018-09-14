getwd()

packages <- c("readr", "dplyr", "tidyverse", "data.table","tidyverse")
lapply(packages, require, character.only = TRUE)
setwd("~/Documents/Coursera/ExploratoryDataAnalysis/")
data <- fread("~/Documents/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt")

# plot 1 ------------------------------------------------------------------
data <- data  %>% filter(Date == "2/2/2007" | Date == "1/2/2007")
data$Global_active_power <- as.numeric(data$Global_active_power)
png(file = "plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()

