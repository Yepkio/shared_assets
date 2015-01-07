# counting pure outgoing messages
# counting pure ingoing messages
# counting connections
messages <- read.csv("msfirst.csv");

links <- data.frame(from= numeric(0), to= numeric(0), lapse=numeric(0));

while (length(messages)>0) {
	if ((length(messages) %% 1000) == 0) {
		print(mm)
	}

	source = messages$Source[1];
        target = messages$Target[1];
	tims = messages$timefromcreated[1];
        messages = messages[2:length(messages[,1]),]
	retims = NA;        

        reid = ((messages$Source==target) && (messages$Target==source));

	if (sum(reid)>0) {
		retims = tims - messages$timefromcreated[reid];
		messages = messages[!reid,];
	}
	 
	links[length(links$to)+1,] <- c(source,target,retims);
}

write.csv(links,file="linksB.csv")
####
