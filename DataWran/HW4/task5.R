data(rivers)
rivers[(rivers %% 5) == 0] <- NA

#was getting an error that NA was not subscriptable so had to check to see if the value was NA

rivers[(rivers %% 2) == 0 & !is.na(rivers)] <- sqrt(rivers[(rivers %% 2) == 0 & !is.na(rivers)])
