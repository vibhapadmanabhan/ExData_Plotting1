#read data
data<-read.table('household_power_consumption.txt', na.strings='?', header
                 =TRUE, sep=';')

#subset relevant data and create new datetime column
data$Date<-as.Date(strptime(data$Date, format='%d/%m/%Y'))
data$datetime<-strptime(paste(data$Date, data$Time, sep=" "), format='%Y-%m-%d %H:%M:%S')
newData<-subset(data, Date==as.Date('2007-02-01') | Date==as.Date('2007-02-02'))

#construct plot
plot(newData$datetime, newData$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')

#save plot
dev.copy(png, file='plot2.png')
dev.off()
