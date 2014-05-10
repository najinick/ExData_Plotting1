

##file to read
fileName <- "exdata-data-household_power_consumption/household_power_consumption.txt"

##Read the file
dt <- read.table(fileName, sep=";", header=TRUE)

##Convert Date
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")

##Filter by needed dates
minDate <- as.numeric(as.Date('2007-02-01', "%Y-%m-%d"))
maxDate <- as.numeric(as.Date('2007-02-02', "%Y-%m-%d"))
dt <- dt[as.numeric(dt$Date)<= maxDate & as.numeric(dt$Date)>= minDate, ]

#Convert time
dt$Time <- strptime(dt$Time, "%H:%M:%S")

#Convert numerics
dt$Global_active_power <- as.numeric(as.character(dt$Global_active_power))

png('plot1.png', width=480, height=480)
hist(dt$Global_active_power, col=c('red'), main='Global Active Power', xlab='Global Active Power (Kilowatts)')
dev.off()

