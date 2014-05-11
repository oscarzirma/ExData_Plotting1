plot2 <- function()
#This function imports household energy usage data and plot a time series of household active power usage over time
  
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
png(file = 'plot2.png',width = 480,height = 480,units = 'px')

#Plot power
plot(Ds$Global_active_power,type = 'l',main = '',ylab = 'Glabal Active Power (kilowatts)',xlab = '',xaxt = 'n')
axis(1,at= label_indices,label = label_names)

#Close screen device
dev.off()