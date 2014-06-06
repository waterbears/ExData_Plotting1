# load the data
data <- read.csv('data/household_power_consumption.txt', sep=';', na.string='?')

# transform the date and time variable
data <- transform(data, DateTime=as.POSIXlt(paste(Date, Time), '%d/%m/%Y %H:%M:%S', tz='GMT'))

# subset the data
data.subset <- data[data$DateTime >= as.POSIXlt('2007-02-01', tz='GMT') & data$DateTime < as.POSIXlt('2007-02-03', tz='GMT'), ]

# plot the histogram
png(filename='plot3.png')
with(data.subset, plot(DateTime, Sub_metering_1, type='l', col='black', xlab='', ylab='Energy sub metering'))
with(data.subset, lines(DateTime, Sub_metering_2, col='red'))
with(data.subset, lines(DateTime, Sub_metering_3, col='blue'))
legend('topright', lwd=1, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()