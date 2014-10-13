filetoread<-"household_power_consumption.txt"
data<-read.table(filetoread,header=TRUE,sep=";")
x<-data$Date
xx<-as.Date(x,format="%d/%m/%Y")
xxx<-data$Global_active_power
xxx<-as.numeric(levels(xxx))[xxx] # To convert factor to numeric
 final<-data.frame(Date=xx,Value=xxx)
d<-c('2007-02-01','2007-02-02')
f2<-final[final$Date %in% as.Date(d),] #Filter by date
hist(f2$Value,xlab="Global Active Power (kilowatts)",col="Red",main="Global Active Power")

dev.copy(png,file="Plot1.png")
dev.off()


