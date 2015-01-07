couns <- read.csv("countries.csv");

dons <- read.csv("../data/donators.csv");

#levels(dons$Country) <- union(levels(couns$name),levels(dons$Country))
#levels(couns$name) <- union(levels(couns$name),levels(dons$Country))
#levels(dons$Full.Name) <- union(levels(dons$Full.Name),levels(couns$fullname))
#levels(couns$fullname) <- union(levels(dons$Full.Name),levels(couns$fullname))
#levels(dons$Email.Address) <- union(levels(dons$Email.Address),levels(couns$mail))
#levels(couns$mail) <- union(levels(dons$Email.Address),levels(couns$mail))

dons$Country <- as.vector(dons$Country);
couns$name <- as.vector(couns$name);
dons$Full.Name <- as.vector(dons$Full.Name);
couns$fullname <- as.vector(couns$fullname);
dons$Email.Address <- as.vector(dons$Email.Address);
couns$mail <- as.vector(couns$mail);

for (i in 1:length(dons$Full.Name)) {

if (sum(couns$fullname==dons$Full.Name[i])==1) {
dons$Country[i] = couns$name[couns$fullname==dons$Full.Name[i]]
}

if (sum(couns$mail==dons$Email.Address[i])==1) {
dons$Country[i] = couns$name[couns$mail==dons$Email.Address[i]]

}

}
warnings()
write.csv(dons,file="doncoun.csv")

