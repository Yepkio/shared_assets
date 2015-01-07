memeu = read.csv("memeu.csv");
memna = read.csv("memna.csv");
memas = read.csv("memas.csv");
memaf = read.csv("memaf.csv");
memoc = read.csv("memoc.csv");
memsa = read.csv("memsa.csv");

users =  data.frame(eu=rep(0,240),na=rep(0,240),as=rep(0,240),af=rep(0,240),oc = rep(0,240),sa=rep(0,240))

for (i in 1:240) {
if (sum(memeu$month==(i-1))>0) {
users$eu[i] = memeu$c[memeu$month==(i-1)];
}
if (sum(memna$month==(i-1))>0) {
users$na[i] = memna$c[memna$month==(i-1)];
}
if (sum(memas$month==(i-1))>0) {
users$as[i] = memas$c[memas$month==(i-1)];
}
if (sum(memaf$month==(i-1))>0) {
users$af[i] = memaf$c[memaf$month==(i-1)];
}
if (sum(memoc$month==(i-1))>0) {
users$oc[i] = memoc$c[memoc$month==(i-1)];
}
if (sum(memsa$month==(i-1))>0) {
users$sa[i] = memsa$c[memsa$month==(i-1)];
}
}

cusers = users;

augusts <- 12+12*c(11:19)

png("memcontr.png")

plot(133:240,apply(cusers[133:240,1:6],1,sum),ylim=c(0,2700),type="l",col="red",lwd=3,xaxt="n",xlab="",ylab="")
polygon(c(133:240,240,133), c(apply(cusers[133:240,1:6],1,sum),0,0), border = NA, col='red')
par(new=TRUE)
plot(133:240,apply(cusers[133:240,2:6],1,sum),ylim=c(0,2700),type="l",col="blue",lwd=3,xaxt="n",xlab="",ylab="")
polygon(c(133:240,240,133), c(apply(cusers[133:240,2:6],1,sum),0,0), border = NA, col='blue')
par(new=TRUE)
plot(133:240,apply(cusers[133:240,3:6],1,sum),ylim=c(0,2700),type="l",col="green",lwd=3,xaxt="n",xlab="",ylab="")
polygon(c(133:240,240,133), c(apply(cusers[133:240,3:6],1,sum),0,0), border = NA, col='green')
par(new=TRUE)
plot(133:240,apply(cusers[133:240,4:6],1,sum),ylim=c(0,2700),type="l",col="black",lwd=3,xaxt="n",xlab="",ylab="")
polygon(c(133:240,240,133), c(apply(cusers[133:240,4:6],1,sum),0,0), border = NA, col='black')
par(new=TRUE)
plot(133:240,apply(cusers[133:240,5:6],1,sum),ylim=c(0,2700),type="l",col="cyan",lwd=3,xaxt="n",xlab="",ylab="")
polygon(c(133:240,240,133), c(apply(cusers[133:240,5:6],1,sum),0,0), border = NA, col='cyan')
par(new=TRUE)
plot(133:240,cusers[133:240,6],ylim=c(0,2700),type="l",col="yellow",lwd=3,xaxt="n",xlab="",ylab="")
polygon(c(133:240,240,133), c(cusers[133:240,6],0,0), border = NA, col='yellow')

mtext("Dezember 20..",side=1,line=3)
mtext("monthly signup",side=2,line=3)
axis(side = 1, at = augusts,labels = c("06", "07", "08", "09","10", "11", "12","13", "14"))
legend("topleft",col=c("red","blue","green","black","cyan","yellow"),lty=1,lwd=6,legend=c("Europa","North America","Asia","Africa","Oceania","South America"))
dev.off()

cusers = apply(users, 2, cumsum);

png("memcont.png")

plot(133:240,apply(cusers[133:240,1:6],1,sum),ylim=c(0,56000),type="l",col="red",lwd=3,xaxt="n",xlab="",ylab="")
polygon(c(133:240,240,133), c(apply(cusers[133:240,1:6],1,sum),0,0), border = NA, col='red')
par(new=TRUE)
plot(133:240,apply(cusers[133:240,2:6],1,sum),ylim=c(0,56000),type="l",col="blue",lwd=3,xaxt="n",xlab="",ylab="")
polygon(c(133:240,240,133), c(apply(cusers[133:240,2:6],1,sum),0,0), border = NA, col='blue')
par(new=TRUE)
plot(133:240,apply(cusers[133:240,3:6],1,sum),ylim=c(0,56000),type="l",col="green",lwd=3,xaxt="n",xlab="",ylab="")
polygon(c(133:240,240,133), c(apply(cusers[133:240,3:6],1,sum),0,0), border = NA, col='green')
par(new=TRUE)
plot(133:240,apply(cusers[133:240,4:6],1,sum),ylim=c(0,56000),type="l",col="black",lwd=3,xaxt="n",xlab="",ylab="")
polygon(c(133:240,240,133), c(apply(cusers[133:240,4:6],1,sum),0,0), border = NA, col='black')
par(new=TRUE)
plot(133:240,apply(cusers[133:240,5:6],1,sum),ylim=c(0,56000),type="l",col="cyan",lwd=3,xaxt="n",xlab="",ylab="")
polygon(c(133:240,240,133), c(apply(cusers[133:240,5:6],1,sum),0,0), border = NA, col='cyan')
par(new=TRUE)
plot(133:240,cusers[133:240,6],ylim=c(0,56000),type="l",col="yellow",lwd=3,xaxt="n",xlab="",ylab="")
polygon(c(133:240,240,133), c(cusers[133:240,6],0,0), border = NA, col='yellow')

mtext("Dezember 20..",side=1,line=3)
mtext("total signup",side=2,line=3)
axis(side = 1, at = augusts,labels = c("06", "07", "08", "09","10", "11", "12","13", "14"))
legend("topleft",col=c("red","blue","green","black","cyan","yellow"),lty=1,lwd=6,legend=c("Europa","North America","Asia","Africa","Oceania","South America"))
dev.off()

#"95","96","97","98","99","00","01","02","03","04","05",
