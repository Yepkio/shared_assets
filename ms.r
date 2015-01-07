# counting pure outgoing messages
# counting pure ingoing messages
# counting connections
messages <- read.csv("msfirst.csv");

links <- data.frame(from= numeric(0), to= numeric(0), lapse=numeric(0));

for (mm in 1:length(messages$Source)) {
	if ((mm %% 1000) == 0) {
		print(mm)
	}
        source = messages$Source[mm];
        target = messages$Target[mm];

	if (sum((source == links$from) & (target == links$to)) == 0 &&
            sum((target == links$from) & (source == links$to)) == 0) {
		

		tomessages = messages[(source == messages$Source & target == messages$Target),];
		remessages = messages[(source == messages$Target & target == messages$Source),];
						
		if (length(remessages$timefromcreated) == 0 || length(tomessages$timefromcreated) == 0) {

			links[length(links$to)+1,] <- c(source,target,NA);
		} else {
			
			links[length(links$to)+1,] <- c(source,target,max(remessages$timefromcreated)-max(tomessages$timefromcreated));
		}
	}

}

write.csv(links,file="links.csv")
####
