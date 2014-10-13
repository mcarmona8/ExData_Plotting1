filetoread<-"household_power_consumption.txt"
data<-read.table(filetoread,header=TRUE,sep=";")
x<-data$Date
xx<-as.Date(x,format="%d/%m/%Y")
y<-data$Time

xx1<-data$Sub_metering_1
xx2<-data$Sub_metering_2
xx3<-data$Sub_metering_3
xx1<-as.numeric(levels(xx1))[xx1] # To convert factor to numeric
xx2<-as.numeric(levels(xx2))[xx2] # To convert factor to numeric
#xx3<-as.numeric(levels(xx3))[xx3] # To convert factor to numeric

final<-data.frame(Date=xx,Time=y,Val1=xx1,Val2=xx2,Val3=xx3)
d<-c('2007-02-01','2007-02-02')
f2<-final[final$Date %in% as.Date(d),] #Filter by date

dates<-f2$Date
times<-f2$Time
f3<-paste(dates,times)
ap3<-as.POSIXct(f3,tz="")
plot(f2$Val1~ap3,
type = "l",
ylab = "Energy sub metering",
xlab = "")
lines(ap3,f2$Val2,col="blue")
lines(ap3,f2$Val3,col="Red")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="______")
dev.copy(png,file="Plot3.png")
dev.off()