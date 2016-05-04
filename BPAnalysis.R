library(ggplot2)
library(reshape2)

## Read the raw data file in CSV format 
temp <- read.csv("BPReadings.csv", header=T);
bpdata<-temp[, 1:7]
bpdata$Date<-as.Date(bpdata$Date,"%m/%d/%Y")
bpdata$Time<-as.POSIXct(bpdata$Time,"%I:%M %p", tz="America/New_York")

ggplot(bpdata, aes(x=Date,y=Systolic, col=Medicine)) + 
  geom_point(shape=16)
ggplot(bpdata, aes(x=Date,y=Diastolic, col=Medicine)) + 
  geom_point(shape=17)
ggplot(bpdata, aes(x=Date,y=Systolic, col=Medicine)) + 
  geom_boxplot() + geom_jitter()
ggplot(bpdata, aes(x=Date,y=Diastolic, col=Medicine)) + 
  geom_boxplot() + geom_jitter()