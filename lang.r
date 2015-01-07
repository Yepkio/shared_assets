langs = read.csv("langs.csv");

png("langs.png")
vec = as.vector(langs$lang[1:6]);
vec[6] <- 'Other'
print(vec)
lbls = labels=vec;
lbls <- paste(lbls,c(langs$c[1:5],sum(langs$c[6:length(langs$c)])))
lbls <- paste(lbls,"",sep="")
colorrs=rainbow(6);
pie(c(langs$c[1:5],sum(langs$c[6:length(langs$c)])),labels=lbls,col=colorrs,main="Distribution of WS users over languages",sub="Dez 2014" )
dev.off()

