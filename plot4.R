plot4<-function (){
	loadData()
	png (filename="plot4.png", width=480, height=480, units="px")
	par (mfrow=c(2,2))
	plot (truncated_data$Global_active_power/1000, type="n", ylab="Global Active Power", xlab="", xaxt="n")
	lines (truncated_data$Global_active_power/1000)
	axis (side=1, at=truncated_data$days, labels=format(truncated_data$Date, "%a"))

	plot (truncated_data$Voltage, type="n", ylab="Voltage", xlab="datetime", xaxt="n")
	lines (truncated_data$Voltage)
	axis (side=1, at=truncated_data$days, labels=format(truncated_data$Date, "%a"))

	plot (truncated_data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="", xaxt="n")
	lines (truncated_data$Sub_metering_1)
	lines (truncated_data$Sub_metering_2, col="red")
	lines (truncated_data$Sub_metering_3, col="blue")
	axis (side=1, at=truncated_data$days, labels=format(truncated_data$Date, "%a"))

	plot (truncated_data$Global_reactive_power/1000, type="n", ylab="Global_reactive_power", xlab="datetime", xaxt="n")
	lines (truncated_data$Global_reactive_power/1000)
	axis (side=1, at=truncated_data$days, labels=format(truncated_data$Date, "%a"))
	dev.off()
}

loadData<-function (){
	data<-read.csv ("household_power_consumption.txt", sep=";")
	transformed_data<-transform(data, Date=as.Date(Date))
	transformed_data<-transform(transformed_data, Global_active_power=as.numeric(Global_active_power))
	transformed_data<-transform(transformed_data, Global_reactive_power=as.numeric(Global_reactive_power))
	transformed_data<-transform(transformed_data, Voltage=as.numeric(Voltage))
	transformed_data<-transform(transformed_data, Global_intensity=as.numeric(Global_intensity))
	transformed_data<-transform(transformed_data, Sub_metering_1=as.numeric(Sub_metering_1))
	transformed_data<-transform(transformed_data, Sub_metering_2=as.numeric(Sub_metering_2))
	transformed_data<-transform(transformed_data, Sub_metering_3=as.numeric(Sub_metering_3))
	truncated_data<-transformed_data[transformed_data$Date=="2007-02-01" || transformed_data$Date=="2007-02-02", ]
	truncated_data$days=as.numeric(format(truncated_data$Date, "%w"))
	
} 