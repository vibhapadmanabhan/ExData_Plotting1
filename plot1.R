#read data
data<-read.table('household_power_consumption.txt', na.strings='?', header
                 =TRUE, sep=';')

#subset relevant data
data$Date<-as.Date(strptime(data$Date, format='%d/%m/%Y'))
newData<-subset(data, Date==as.Date('2007-02-01') | Date==as.Date('2007-02-02'))

#construct plot
hist(newData$Global_active_power, col='red', main='Global Active Power', 
     xlab="Global Active Power (kilowatts)", ylab='Frequency')

#save plot
dev.copy(png, file='plot1.png')
dev.off()
