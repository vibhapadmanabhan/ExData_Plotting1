data<-read.table('household_power_consumption.txt', na.strings='?', header
                 =TRUE, sep=';')
data$Date<-as.Date(strptime(data$Date, format='%d/%m/%Y'))
newData<-subset(data, Date==as.Date('2007-02-01') | Date==as.Date('2007-02-02'))
hist(newData$Global_active_power, col='red', main='Global Active Power', 
     xlab="Global Active Power (kilowatts)", ylab='Frequency')
dev.copy(png, file='plot1.png')