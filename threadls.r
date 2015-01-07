thls = read.csv("threadls.csv");


png("threadls.png")
plot(1:length(thls$c),thls$c,type='l',xlab="length of the thread",ylab="number of threads")
dev.off()

