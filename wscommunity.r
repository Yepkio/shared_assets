
comments <- read.csv("cs.csv");

memgrowth = read.csv("memgrowth.csv");

users = rep(0,240); 

for (i in 1:240) {
if (sum(memgrowth$month==(i-1))>0) {
users[i] = memgrowth$c[memgrowth$month==(i-1)];
}
}

wscomnumber <- rep(0, 240);
for (m in 1:240) {
	wscomnumber[m] = sum(comments$age == m-1);
}

wscomnumber <- rep(0, 240);
for (m in 1:240) {
	wscomnumber[m] = length(union(comments$FromM[comments$age <= m-1],comments$ToM[comments$age <= m-1]));
}

wsnumber <- rep(0, 240);
for (m in 1:88) {
	wsnumber[m] = length(union(comments$FromM[comments$age == m-1],comments$ToM[comments$age == m-1]));
}

print("here")

wsnrecom <- rep(0, 240);
for (m in 1:240) {
	befcomments = comments[comments$age <= m-1,]; 
        print(m)
        if (length(befcomments) > 0) {
		befids = union(befcomments$ToM,befcomments$FromM);
		recom = rep(0,length(befids));
        	for (idc in 1:length(befids)) {
		recom[idc] = sum(befcomments$ToM==befids[idc] | befcomments$FromM==befids[idc]);
		}
	}
	wsnrecom[m] = mean(recom);
}


wsdifnumber = wscomnumber;
for (m in 2:240) {
	wsdifnumber[m] = wscomnumber[m] - wscomnumber[m-1];
}



png("wscommune.png")

par(mar=c(5,4,4,4)+.1)
plot(133:240,users[133:240],lty=1,type="l",ylim=c(0,3000),col="blue",xaxt="n",xlab="",ylab="Monthly growth at users/members")
polygon(c(133,133:240,240), c(0,users[133:240],0), border = NA, col='blue')
par(new=TRUE)
plot(133:240,wsdifnumber[133:240],type='l',ylim=c(0,3000),xaxt="n",yaxt="n",xlab="",ylab="")
polygon(c(133:240,240), c(wsdifnumber[133:240],0), border = NA, col='red')
par(new=TRUE)
plot(133:240,wsnrecom[133:240],type='l',,ylim=c(0,8),lty=1,lwd=2,xaxt="n",yaxt="n",xlab="",ylab="")
#polygon(c(1:88,88), c(mfail*100,0), border = NA, col='black')
axis(4)
mtext("Average number of real life connections",side=4,line=3)
mtext("August 20..",side=1,line=3)
axis(side = 1, at = 7+12*c(11:19), labels = c("06", "07", "08", "09","10", "11", "12","13", "14"))
legend("topleft",col=c("blue","red","black"),lty=1,lwd=c(5,5,2),legend=c("Monthly growth at users","Monthly growth at members","Average real life connections"))
#polygon(c(0,6,6,0),c(55.3,55.3,54.3,54.3), border = 'black', col='black',density = -1)
#title(main = "'no login' rate is independent of general interest after Aug 11",sub="(no significant correlations)")

dev.off()


