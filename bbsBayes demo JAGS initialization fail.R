##############
## script that demonstrates JAGS 4.3 initilization failure, commpared to JAGS 4.2
####################################
# 0: Initial Setup
# NOTE: commented-out sections 0, 1, and 2 need not be run locally, if the saved *.RData file can be loaded
# If this code is run on JAGS version 4.2 the initialization phase requires < 1 minute
# If run on JAGS version 4.3, the initilization phase often hangs indefinitely
####################################
# devtools::install_github("AdamCSmithCWS/bbsBayes")
# library(bbsBayes)
# 
# 
# 
# # ####################################
# # # 1: Fetch 2018 version of the North American Breeding Bird Survey (BBS) Data
# # # note: this can take a few minutes to complete
# # ####################################
# #
# # # # Fetch data from FTP site and save as a file
# #   bbs_data <- fetch_bbs_data()
# #  yes
# 
# 
# # ####################################
# # # 2: Prepare Data
# # ####################################
# 
# # Stratify the data
# strat = "bbs_cws" #standard stratification used by the Canadian Wildlife Service (CWS)
# bbs_strat <- stratify(by = strat)
# species = "Wood Thrush"
# # Prepare data for JAGS.
# # This includes subsetting based on species of interest,
# # adding in zeros, and performing model-specific calculations
# jags_data <- prepare_jags_data(strat_data = bbs_strat,
#                                species_to_run = species,
#                                min_max_route_years = 3,
#                                min_year = 2000,
#                                model = "slope")
# 
# 
### these next few lines just remove some portions of the data object that aren't relevant 
### when running through rjags, They're only necessary when using the run-model function in bbsBayes package
# rjags_data = jags_data
# rjags_data$model = NULL
# rjags_data$strat_name = NULL
# rjags_data$stratify_by = NULL
# rjags_data$r_year = NULL
# rjags_data$route = NULL
# rjags_data$nonzeroweight = NULL
######
##### saves the demonstration data for quicker loading
##### all BBS data for Wood thrush, 
#save(rjags_data,file = "demo Wood Thrush bbs data.RData")
####################################
# 3: Run JAGS model
####################################
#

load("demo Wood Thrush bbs data.RData")



######## rjags

library(rjags)
mod = "slopeSimple.txt" 

### this is a trimmed-down version of the model used to produce population status and trend estimates from the BBS
### by the CWS and the United States Geological Survey: https://doi.org/10.1525/auk.2010.09220

load.module("glm")
t1 = Sys.time()
rj1 = jags.model(file = mod,
                 data = rjags_data,
                 n.chains = 3,
                 n.adapt = 1000)
Sys.time()-t1



















