# load the data
data <- read.csv('data/household_power_consumption.txt', sep=';', na.string='?')

# transform the date and time variable
data <- transform(data, DateTime=as.POSIXlt(paste(Date, Time), '%d/%m/%Y %H:%M:%S', tz='GMT'))

# subset the data
data.subset <- data[data$DateTime >= as.POSIXlt('2007-02-01', tz='GMT') & data$DateTime < as.POSIXlt('2007-02-03', tz='GMT'), ]

# plot the histogram
png(filename='plot2.png')
with(data.subset, plot(DateTime, Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab=''))
dev.off()