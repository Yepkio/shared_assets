continents = read.csv("continents.csv");

print(continents)

png("continents.png")
lbls = labels=c("Africa","Asia","Europa","North A.","Oceania","South A.");
lbls <- paste(lbls,continents$members)
lbls <- paste(lbls,"",sep="")
colorrs=rainbow(6);
pie(continents$members,labels=lbls,col=colorrs,main="Distribution of WS users over continents",sub="Dez 2014" )
dev.off()

