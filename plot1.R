plot1 <- function()
#This function imports household energy usage data and plots a histogram showing the distribution of energy uses

#Read data
D <- data.frame()
D <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = '?')

#Pull date column
d <- as.Date(D$Date,'%d/%m/%Y')

#Get indices of dates of interest
ind <-  d==as.Date('2007-02-01') | d==as.Date('2007-02-02')

#Subset data frame
Ds <- D[ind,]

#Create PNG file
png(file = 'plot1.png',width = 480,height = 480,units = 'px')

#Plot histogram
hist(as.numeric(as.character(Ds$Global_active_power)),col='red',
     main = "Global Active Power",xlab = 'Glabal Active Power (kilowatts)')

#Close screen device
dev.off()