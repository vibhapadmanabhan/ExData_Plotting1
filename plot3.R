data<-read.table('household_power_consumption.txt', na.strings='?', header
                 =TRUE, sep=';')
data$Date<-as.Date(strptime(data$Date, format='%d/%m/%Y'))
data$datetime<-strptime(paste(data$Date, data$Time, sep=" "), format='%Y-%m-%d %H:%M:%S')
newData<-subset(data, Date==as.Date('2007-02-01') | Date==as.Date('2007-02-02'))

with(newData, plot(datetime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))
lines(newData$datetime, newData$Sub_metering_2, col='red')
lines(newData$datetime, newData$Sub_metering_3, col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)

dev.copy(png, file='plot3.png')
dev.off()