

##file to read
fileName <- "exdata-data-household_power_consumption/household_power_consumption.txt"

##Read the file
dt <- read.table(fileName, sep=";", header=TRUE)

##Convert Date and filter by it to reduce dataset
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")

##Filter by needed dates
minDate <- as.numeric(as.Date('2007-02-01', "%Y-%m-%d"))
maxDate <- as.numeric(as.Date('2007-02-02', "%Y-%m-%d"))
dt <- dt[as.numeric(dt$Date)<= maxDate & as.numeric(dt$Date)>= minDate, ]

##Combine date and time as strings
dt$DateTime <- paste(as.character(dt$Date), as.character(dt$Time))

#Convert date time string to date time
dt$DateTime <- strptime(dt$DateTime, "%Y-%m-%d %H:%M:%S")

#Convert numerics
dt$Sub_metering_1 <- as.numeric(as.character(dt$Sub_metering_1))
dt$Sub_metering_2 <- as.numeric(as.character(dt$Sub_metering_2))
dt$Sub_metering_3 <- as.numeric(as.character(dt$Sub_metering_3))


#plot to png file
png('plot3.png', width=480, height=480)
plot(dt$DateTime, dt$Sub_metering_1,  col=c('black'), type='l', ylab='Energy sub metering', xlab='')
lines(dt$DateTime, dt$Sub_metering_2,  col=c('red'))
lines(dt$DateTime, dt$Sub_metering_3,  col=c('blue'))
legend("topright", pch=1, col= c('black', 'red', 'blue'),  legend= c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()


