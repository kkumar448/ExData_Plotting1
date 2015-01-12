plot1<-function (){
	loadData()
	 png (filename="plot1.png", width=480, height=480, units="px")
	hist (transformed_data$Global_active_power[transformed_data$Date == "2007-02-01" | transformed_data$Date=="2007-02-02"]/1000, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
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
	
} 