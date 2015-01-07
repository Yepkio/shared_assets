memgrowth = read.csv("memgrowth.csv");

users = rep(0,240); 

for (i in 1:240) {
if (sum(memgrowth$month==(i-1))>0) {
users[i] = memgrowth$c[memgrowth$month==(i-1)];
}
}

cusers = cumsum(users);

augusts <- 7+12*c(11:19)

png("memgrowth.png")

par(mar=c(5,4,4,4)+.1)
plot(133:240,users[133:240],type='l',col="blue",lwd=3,xlab="", ylab="monthly WS signup", xaxt = "n")

par(new=TRUE)
plot(133:240,cusers[133:240],,type="l",col="red",lwd=3,xaxt="n",yaxt="n",xlab="",ylab="")

axis(4)
mtext("August 20..",side=1,line=3)
mtext("total signup",side=4,line=3)

axis(side = 1, at = augusts,labels = c("06", "07", "08", "09","10", "11", "12","13", "14"))
legend("topleft",col=c("blue","red"),lty=1,lwd=3,legend=c("monthly WS signup","total signup"))

dev.off()

#"95","96","97","98","99","00","01","02","03","04","05",
