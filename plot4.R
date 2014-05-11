plot4 <- function()
  #This function imports household energy usage data and produces a figure with four subplots documenting power usage
  
  #Read data
  D <- data.frame()
D <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = '?')

#Pull date column
d <- as.Date(D$Date,'%d/%m/%Y')

#Get indices of dates of interest
ind <-  d==as.Date('2007-02-01') | d==as.Date('2007-02-02')

#Subset data frame
Ds <- D[ind,]
ds <- as.Date(Ds$Date,'%d/%m/%Y')
dsf <- factor(weekdays(ds))
label_indices = c(which(dsf == 'Thursday')[1],which(dsf == 'Friday')[1],length(dsf)+1)
label_names = c('Thu','Fri','Sat')

#Create PNG file
png(file = 'plot4.png',width = 480,height = 480,units = 'px')

#Set subplots
par(mfrow = c(2,2))

#Plot active power 
plot(Ds$Global_active_power,type = 'l',main = '',ylab = 'Glabal Active Power (kilowatts)',xlab = '',xaxt = 'n')
axis(1,at= label_indices,label = label_names)

#Plot voltage 
plot(Ds$Voltage,type = 'l',main = '',ylab = 'Voltage',xlab = 'datetime',xaxt = 'n')
axis(1,at= label_indices,label = label_names)

#Plot sub metering
plot(Ds$Sub_metering_1,type = 'l',main = '',ylab = 'Energy sub metering',xlab = '',xaxt = 'n')
axis(1,at= label_indices,label = label_names)
lines(Ds$Sub_metering_2,col = 'red')
lines(Ds$Sub_metering_3,col = 'blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty = c(1,1,1),lwd = c(2.5,2.5,2.5),col = c('black','red','blue'),bty = 'n')

#Plot reactive power
plot(Ds$Global_reactive_power,type = 'l',main = '',ylab = 'Global_reactive_power',xlab = 'datetime',xaxt = 'n')
axis(1,at= label_indices,label = label_names)

#Close screen device
dev.off()

