filetoread<-"household_power_consumption.txt"
data<-read.table(filetoread,header=TRUE,sep=";")
x<-data$Date
xx<-as.Date(x,format="%d/%m/%Y")
y<-data$Time

xxx<-data$Global_active_power
xxx<-as.numeric(levels(xxx))[xxx] # To convert factor to numeric
final<-data.frame(Date=xx,Value=xxx,Time=y)
d<-c('2007-02-01','2007-02-02')
f2<-final[final$Date %in% as.Date(d),] #Filter by date

dates<-f2$Date
times<-f2$Time
f3<-paste(dates,times)
ap3<-as.POSIXct(f3,tz="")

plot(ap3,f2$Value,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


dev.copy(png,file="Plot2.png")
dev.off()