#read data
data<-read.table('household_power_consumption.txt', na.strings='?', header
                 =TRUE, sep=';')

#subset relevant data and create datetime column
data$Date<-as.Date(strptime(data$Date, format='%d/%m/%Y'))
data$datetime<-strptime(paste(data$Date, data$Time, sep=" "), format='%Y-%m-%d %H:%M:%S')
newData<-subset(data, Date==as.Date('2007-02-01') | Date==as.Date('2007-02-02'))

#add Sub_metering_1
with(newData, plot(datetime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))

#overlay Sub_metering_2 and Sub_metering_3
lines(newData$datetime, newData$Sub_metering_2, col='red')
lines(newData$datetime, newData$Sub_metering_3, col='blue')

#add a legend
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)

#save plot
dev.copy(png, file='plot3.png')
dev.off()
