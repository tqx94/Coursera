# plot 4 ------------------------------------------------------------------
png(file = "plot4.png")
par(mfrow=c(2,2))
#plot1
with(data, plot(Date_time, Global_active_power,type="l",
                ylab = "Global Active Power (kilowatts)", xlab =""))
#Voltage
data$Voltage <- as.numeric(data$Voltage)
with(data, plot(Date_time,Voltage, type = "l"))

#energy sub metering
with(data, plot(Date_time,Sub_metering_1, type = "l",ylab = "Energy sub metering"))
with(data, lines(Date_time,Sub_metering_2, type = "l",col ="red", ylab = "Energy sub metering"))
with(data, lines(Date_time,Sub_metering_3, type = "l",col ="blue", ylab = "Energy sub metering"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), pch ="-")

#global reactive power
with(data, plot(Date_time,Global_reactive_power, type = "l"))
dev.off()
