#read data
data<-read.table('household_power_consumption.txt', na.strings='?', header
                 =TRUE, sep=';')

#subset relevant data and create datetime column
data$Date<-as.Date(strptime(data$Date, format='%d/%m/%Y'))
data$datetime<-strptime(paste(data$Date, data$Time, sep=" "), format='%Y-%m-%d %H:%M:%S')
newData<-subset(data, Date==as.Date('2007-02-01') | Date==as.Date('2007-02-02'))

#set parameter for multiple plots
par(mfcol=c(2, 2))

#add first subplot
plot(newData$datetime, newData$Global_active_power, type='l', xlab='', ylab='Global Active Power')

#add second subplot
with(newData, plot(datetime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))
lines(newData$datetime, newData$Sub_metering_2, col='red')
lines(newData$datetime, newData$Sub_metering_3, col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, bty='n')

#add third subplot
with(newData, plot(datetime, Voltage, type='l'))

#add fourth subplot
with(newData, plot(datetime, Global_reactive_power, type='l'))

#save plot
dev.copy(png, 'plot4.png')
dev.off()
