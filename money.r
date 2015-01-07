
dons <- read.csv("../data/donations.csv");
doncoun <- read.csv("doncoun.csv");

dons = dons[grepl("2014", dons$Received.Date),];

couns = unique(doncoun$Country);

counhist = rep(0,length(couns));

for (i in 1:length(couns)) {

	ids = doncoun$id[doncoun$Country == couns[i]];
	counhist[i] = sum(dons$Amount[is.element(dons$Donor.ID,ids)]);
}

print("he")
unknown = counhist[couns==""];
us = counhist[couns=="US"];
counhist[couns=="Unites States"] = counhist[couns=="Unites States"]+counhist[couns=="US"];
us = counhist[couns=="FR"];
counhist[couns=="France"] = counhist[couns=="France"]+counhist[couns=="FR"];
us = counhist[couns=="CA"];
counhist[couns=="Canada"] = counhist[couns=="Canada"]+counhist[couns=="CA"];
us = counhist[couns=="GB"];
counhist[couns=="United Kingdom"] = counhist[couns=="United Kingdom"]+counhist[couns=="GB"];
us = counhist[couns=="DE"];
counhist[couns=="Germany"] = counhist[couns=="Germany"]+counhist[couns=="DE"];
counhist = counhist[couns!="" & couns!="US"  & couns!="FR" & couns!="CA" & couns!="GB" & couns!="DE"];
couns = couns[couns!="" & couns!="US" & couns!="FR" & couns!="CA" & couns!="GB" & couns!="DE"];
print("he")

couns = couns[rev(order(counhist))];
counhist = counhist[rev(order(counhist))];
png("money.png")

num = 12
lbls = labels=c(as.vector(couns[1:num ]),"Other");
print(couns)
lbls <- paste(lbls,round(c(counhist[1:num ],sum(counhist[(num+1):length(counhist)])),digits=0))
lbls <- paste(lbls," $",sep="")
colorrs=rainbow(num+1);
pie(c(counhist[1:num],sum(counhist[(num+1):length(counhist)])),labels=lbls,col=colorrs,main=c("Income distribution over countries",paste(round(unknown,digits=0), "$ unmatched in db")),sub="2014" )





dev.off()
