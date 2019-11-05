######################
### EMOD as SEIR #####
######################

# Set working directory
setwd(file.path(PROJECT_ROOT, 'Scenarios', 'Generic', 'SEIR'))

##
## Preamble
##
## Defines color palette
COLs <- brewer.pal(5,"Set1")[c(3,5,1,2)]


## Read in necessary JSON file
config <- fromJSON(file = "config.json",  simplify=FALSE)

## We will need to know how long the simulation ran for
Duration <- config$parameters$Simulation_Duration

## We will be creating a new config file. We don't want to write
## over the old config file, so we will create a "temp" one.
config_temp <- config

## Here you can alter the parameters that govern the SEIR
## model. As you become more familiar with the JSON files
## and the associated names for different model parameters
## you can add to this list

beta <- 5
gamma <- 1/5
sigma <- 1/8

## Here we will alter the temporary JSON config file
## In EMOD, 'beta' is called the "Base_Infectivity"
config_temp$parameters$Base_Infectivity <- beta
## In EMOD, 1/'gamma' is incorporated as average infectious period
config_temp$parameters$Base_Infectious_Period <- 1 / gamma
## In EMOD, 1/'sigma' is incorporated as average incubation period
config_temp$parameters$Base_Incubation_Period <- 1/sigma

## Different model runs will result in different output
## due to the stochasticity within the model. We can observe
## this stochasticity by running the model a number of times.
## You can increase this number, but the code will take longer to run
NumSims <- 15

## We need to set up locations to store output
Ss <- Es <- Is <- Rs <- matrix(NA, NumSims, Duration)

## Here is where we will run and re-run EMOD using the 
## temporary config file
for (i in 1:NumSims){
	config_temp$parameters$Run_Number <- i
	write(toJSON(config_temp), file="config.temp.json")
  emod(config = "config.temp.json")
	output <- fromJSON(file = "output/InsetChart.json")

	Ss[i,] <- output$Channels$`Susceptible Population`$Data
	Es[i,] <- output$Channels$`Exposed Population`$Data
	Is[i,] <- output$Channels$`Infectious Population`$Data
	Rs[i,] <- output$Channels$`Recovered Population`$Data
}


## We can calculate summary statistics of the model runs
## Here we are calculating the 2.5th, 50th, and 97.5th
##percentiles
SOut <-  apply(Ss,2,quantile,pro=c(0.025,.5,.975))
EOut <-  apply(Es,2,quantile,pro=c(0.025,.5,.975))
IOut <-  apply(Is,2,quantile,pro=c(0.025,.5,.975))
ROut <-  apply(Rs,2,quantile,pro=c(0.025,.5,.975))

## This plots the summary output
plot(1, type='n', ylim=c(0,1),xlim=c(1,max(which(diff(ROut[2,]) != 0))),xlab="Day",ylab="Fraction of population")
mtext(bquote(beta == .(beta)*", " ~ gamma == .(gamma)*", and " ~ sigma == .(sigma)),3)
polygon(c(1:Duration, rev(1:Duration)),c(SOut[1,],rev(SOut[3,])), col=adjustcolor(COLs[1],alpha=.1), border=NA)
lines(SOut[2,],col=COLs[1])
polygon(c(1:Duration, Duration:1),c(EOut[1,],rev(EOut[3,])),  col=adjustcolor(COLs[2],alpha=.1), border=NA)
lines(EOut[2,],col=COLs[2])
polygon(c(1:Duration, Duration:1),c(IOut[1,],rev(IOut[3,])),  col=adjustcolor(COLs[3],alpha=.1), border=NA)
lines(IOut[2,],col=COLs[3])
polygon(c(1:Duration, Duration:1),c(ROut[1,],rev(ROut[3,])),  col=adjustcolor(COLs[4],alpha=.1), border=NA)
lines(ROut[2,],col=COLs[4])
legend("topright",col=COLs,lwd=2,legend=c("Susceptible","Exposed","Infectious","Recovered"),bg="white")


## We will want to run new models with different parameter
## values. Below, we have code that will first save the 
## last run, then repeat the above process with new parameter
## values. 


## Note, if you've already evaluated this a few times and 
## you have a run you like, you can skip this part and 
## just update lines 117-119 to try other parameters
## against your current favorite
LastSOut <- SOut
LastEOut <- EOut
LastIOut <- IOut
LastROut <- ROut
LastBeta <- beta
LastGamma <- gamma
LastSigma <- sigma

## We can now restart the process and try different values
beta <- 4
gamma <- 1/4
sigma <- 1/6

## Everything from this point on should be familiar
## evaluate through the bottom of the code to see 
## a comparison of the new parameter values to those
## you saved on lines 108-114

config_temp$parameters$Base_Infectivity <- beta
config_temp$parameters$Base_Infectious_Period <- 1 / gamma
config_temp$parameters$Base_Incubation_Period <- 1/sigma


Ss <- Es <- Is <- Rs <- matrix(NA, NumSims, Duration)

for (i in 1:NumSims){
	config_temp$parameters$Run_Number <- i
	write(toJSON(config_temp), file="config.temp.json")
  	emod(config="config.temp.json")
	output <- fromJSON(file = "output/InsetChart.json")

	Ss[i,] <- output$Channels$`Susceptible Population`$Data
	Es[i,] <- output$Channels$`Exposed Population`$Data
	Is[i,] <- output$Channels$`Infectious Population`$Data
	Rs[i,] <- output$Channels$`Recovered Population`$Data
}

SOut <-  apply(Ss,2,quantile,pro=c(0.025,.5,.975))
EOut <-  apply(Es,2,quantile,pro=c(0.025,.5,.975))
IOut <-  apply(Is,2,quantile,pro=c(0.025,.5,.975))
ROut <-  apply(Rs,2,quantile,pro=c(0.025,.5,.975))

par(mfrow=c(1,2))
plot(1, type='n', ylim=c(0,1),xlim=c(1,max(which(diff(LastROut[1,]) != 0))),xlab="Day",ylab="Fraction of population")
mtext(bquote(beta == .(LastBeta)*", " ~ gamma == .(LastGamma)*", and " ~ sigma == .(LastSigma)),3)
polygon(c(1:Duration, rev(1:Duration)),c(LastSOut[1,],rev(LastSOut[3,])), col=adjustcolor(COLs[1],alpha=.1), border=NA)
lines(LastSOut[2,],col=COLs[1],lwd=2)
polygon(c(1:Duration, Duration:1),c(LastEOut[1,],rev(LastEOut[3,])),  col=adjustcolor(COLs[2],alpha=.1), border=NA)
lines(LastEOut[2,],col=COLs[2],lwd=2)
polygon(c(1:Duration, Duration:1),c(LastIOut[1,],rev(LastIOut[3,])),  col=adjustcolor(COLs[3],alpha=.1), border=NA)
lines(LastIOut[2,],col=COLs[3],lwd=2)
polygon(c(1:Duration, Duration:1),c(LastROut[1,],rev(LastROut[3,])),  col=adjustcolor(COLs[4],alpha=.1), border=NA)
lines(LastROut[2,],col=COLs[4],lwd=2)
legend("topright",col=COLs,lwd=2,legend=c("Susceptible","Exposed","Infectious","Recovered"),bg="white")

plot(1, type='n', ylim=c(0,1),xlim=c(1,max(which(diff(ROut[1,]) != 0))),xlab="Day",ylab="Fraction of population")
mtext(bquote(beta == .(beta)*", " ~ gamma == .(gamma)*", and " ~ sigma == .(sigma)),3)
polygon(c(1:Duration, rev(1:Duration)),c(SOut[1,],rev(SOut[3,])), col=adjustcolor(COLs[1],alpha=.1), border=NA)
lines(SOut[2,],col=COLs[1],lwd=2)
polygon(c(1:Duration, Duration:1),c(EOut[1,],rev(EOut[3,])),  col=adjustcolor(COLs[2],alpha=.1), border=NA)
lines(EOut[2,],col=COLs[2],lwd=2)
polygon(c(1:Duration, Duration:1),c(IOut[1,],rev(IOut[3,])),  col=adjustcolor(COLs[3],alpha=.1), border=NA)
lines(IOut[2,],col=COLs[3],lwd=2)
polygon(c(1:Duration, Duration:1),c(ROut[1,],rev(ROut[3,])),  col=adjustcolor(COLs[4],alpha=.1), border=NA)
lines(ROut[2,],col=COLs[4],lwd=2)
legend("topright",col=COLs,lwd=2,legend=c("Susceptible","Exposed","Infectious","Recovered"),bg="white")




