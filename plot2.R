plot2<-function (){
	loadData()
	png (filename="plot2.png", width=480, height=480, units="px")
	plot (truncated_data$Global_active_power/1000, type="n", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
	lines (truncated_data$Global_active_power/1000)
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