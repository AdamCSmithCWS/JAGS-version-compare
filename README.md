# JAGS-version-compare
Comparing JAGS 4.3 and 4.2 with the model used by the CWS and USGS to analyse population status and trends from the North American Breeding Bird Survey.

I've been using this model for ~10 years to estimate status and trends for birds from the North American Breeding Bird Survey.
After updating JAGS from version 4.2 to version 4.3, it has stopped working.
This script demonstrates the problem. If run using JAGS 4.2, the model initializes in less than 1 minute. Running JAGS 4.3 the model fails to initialize, and often results in the R-session hanging. I've let it run for days and still no initilization.
I've packaged up an RData file that contains sufficient data to demonstrate the problem (Wood Thrush data from 2000 - 2018), but alternative datasets are available using the commented-out sections 0 - 2 of the main script. One can choose different species and extend the time-series if desired.




