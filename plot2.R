data <- data %>% unite(Date_time, Date, Time, sep = " ")
data$Date_time <- strptime(data$Date_time, format = "%d/%m/%Y %H:%M:%S")
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$weekday <- weekdays(data$Date)
png(file = "plot2.png")
with(data, plot(Date_time, Global_active_power,type="l",
                ylab = "Global Active Power (kilowatts)", xlab =""))
dev.off()
