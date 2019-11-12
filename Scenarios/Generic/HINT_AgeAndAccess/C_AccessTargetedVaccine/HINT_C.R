########################
### EMOD with HINT #####
########################

# Set working directory
setwd(file.path(PROJECT_ROOT, 'Scenarios', 'Generic', 'HINT_AgeAndAccess', 'C_AccessTargetedVaccine'))

##
## Preamble
##
## Defines color palette
COLs <- brewer.pal(5,"Set1")[c(3,5,1,2)]

## Sets up labels and bins
AccBins <- c("Easy","Hard")
AgeLabels <- c("From_0_To_6","From_6_To_10","From_10_To_20","From_20_To_125")
AgeBins <- paste0("Age_Bin_Property_",AgeLabels)

## Read in necessary JSON files
config <- fromJSON(file = "config.json",  simplify=FALSE)

## We will need to know how long the simulation ran for
Duration <- config$parameters$Simulation_Duration

## We will be creating a new config file. We don't want to write
## over the old config file, so we will create a "temp" one.
config_temp <- config


## We will run a SIR model, so we can edit both beta and gamma

beta <- 5
gamma <- 1/5

# In EMOD, 'beta' is called the "Base_Infectivity"
config_temp$parameters$Base_Infectivity <- beta

# In EMOD, 'gamma' is incorporated as average infectious period
# Mathematically, gamma is 1/"average infectious period", so 
# changes to gamma are implemented as changes to its reciprocal in EMOD
config_temp$parameters$Base_Infectious_Period <- 1 / gamma

## We want to make this a SIR model, not SEIR, so we set
## incubation period to 0 (could make a SEIR model if we wanted to have
## this not 0)
config_temp$parameters$Incubation_Period_Constant <- 0

##################
##              ##
## Connectivity ##
##              ##
##################

## We will be also editing the overlay file for the connectivity
## matricies. We need to update the file name in the temporary
## config with out temporary overlay filename
config_temp$`parameters`$Demographics_Filenames[[2]] <- "hint_ageandaccess_overlay.temp.json"

## We read in the overaly file and again, make a new temporary one
overlay <- fromJSON(file = file.path(EMOD_INPUT_ROOT, "hint_ageandaccess_overlay.json"), simplify=FALSE)
overlay_temp <- overlay

## We also want to edit the connectivity matricies as 
## described in the slides
AccessibilityMatrix <- rbind(c(.9,.1),
														 c(.1,.5))

AgeMatrix <- rbind(c(.4,.2,.1,.3),
									 c(.2,.4,.1,.3),
									 c(.1,.2,.6,.1),
									 c(.1,.1,.1,.7))

## We need to update the connectivity matricies
for (i in 1:2){
	for (j in 1:2){
		overlay_temp$Defaults$`IndividualProperties`[[1]]$`TransmissionMatrix`$Matrix[[i]][[j]] <- AccessibilityMatrix[i,j]
	}
}

for (i in 1:4){
	for (j in 1:4){
		overlay_temp$Defaults$`IndividualProperties`[[2]]$`TransmissionMatrix`$Matrix[[i]][[j]] <- AgeMatrix[i,j]
	}
}

## We now place the temporary overlay file in the correct location
write(toJSON(overlay_temp, indent = 2), file=file.path(EMOD_INPUT_ROOT,"hint_ageandaccess_overlay.temp.json"))

##################
##              ##
## Intervention ##
##              ##
################## 

## We will be also editing the campaign file for the intervention
## We need to update the file name in the temporary
## config with out temporary campaign filename
config_temp$`parameters`$Campaign_Filename <- "campaign.temp.json"

## We read in the campaign file and again, make a new temporary one
campaign <- fromJSON(file = "campaign.json", simplify=FALSE)
campaign_temp <- campaign

## There are a number of configurable components that go into the
## intervention. This intervention is age based. 
## Here we will provide the capacity to alter a few. 
## Note: this is a small subset of the options available
##

## First, we can alter the features of the intervention

## How effective is the intervention?
campaign_temp$Events[[2]]$Event_Coordinator_Config$Intervention_Config$Waning_Config$Initial_Effect <- 0.95

## We will turn this off... for now
## campaign_temp$Events[[2]]$Event_Coordinator_Config$Target_Age_Max <- 10
## campaign_temp$Events[[2]]$Event_Coordinator_Config$Target_Age_Min <- 6

## For the population we will target with the intervention
## (which could be everyone), what fraction of them will we reach?
campaign_temp$Events[[2]]$Event_Coordinator_Config$Demographic_Coverage <- 0.95

## Once we find a person, they may not be receptive to the intervention,
## or they may just refuse it. For what fraction of those who we reach
## is the intervention effective?
campaign_temp$Events[[2]]$Event_Coordinator_Config$Intervention_Config$Vaccine_Take <- 0.95

## Finally, when do we want to start the intervention? 
## Note: for simplicity, we will execute our intervention
## within the stipulations made above on a single day
## (this is a very simplifying assumption that can be 
## remidied).
campaign_temp$Events[[2]]$Start_Day <- 20


## Finally, we write our campaign file
write(toJSON(campaign_temp, indent = 2), file="campaign.temp.json")

## Different model runs will result in different output
## due to the stochasticity within the model. We can observe
## this stochasticity by running the model a number of times.
## You can increase this number, but the code will take longer to run
NumSims <- 30

## We need to set up locations to store output
Ss <- Is <- Rs <- matrix(NA, NumSims, Duration)
CumSumIs <- NewIs <- AllIs <- AllNs <- array(NA, dim=c(2,4,NumSims,Duration))

## Here is where we will run and re-run EMOD using the 
## temporary config file
for (i in 1:NumSims){
	config_temp$parameters$Run_Number <- i
	write(toJSON(config_temp), file="config.temp.json")
    emod(config = "config.temp.json")
	output_IC <- fromJSON(file = "output/InsetChart.json")
	output_PR <- fromJSON(file = "output/PropertyReport.json")

	for (j in 1:2){
		for (k in 1:4){
			tmptxt <- sprintf("Statistical Population:Accessibility:%s,Age_Bin:%s", AccBins[j], AgeBins[k])
			AllNs[j,k,i,] <- output_PR$Channels[tmptxt][[1]]$Data
			tmptxt <- sprintf("Infected:Accessibility:%s,Age_Bin:%s", AccBins[j], AgeBins[k])
			AllIs[j,k,i,] <- output_PR$Channels[tmptxt][[1]]$Data
			tmptxt <- sprintf("New Infections:Accessibility:%s,Age_Bin:%s", AccBins[j], AgeBins[k])
			NewIs[j,k,i,] <- output_PR$Channels[tmptxt][[1]]$Data
			CumSumIs[j,k,i,] <- cumsum(NewIs[j,k,i,])
		}
	}

	Ss[i,] <- output_IC$Channels$`Susceptible Population`$Data
	Is[i,] <- output_IC$Channels$`Infectious Population`$Data
	Rs[i,] <- output_IC$Channels$`Recovered Population`$Data
}

## There are (likely) a number of 'outbreaks' that failed 
## from the pathogens perspective. Check out the campaign.JSON
## file (lines 5, 16, and 17). We could alter these lines to
## increase the chance of an outbreak. For now, let's toss those
## failed pathogen invasions.

Toss <- which(apply(Is, 1, max)==0)
if (length(Toss)){
  Ss <- Ss[-Toss,]
  Is <- Is[-Toss,]
  Rs <- Rs[-Toss,]
}

## We can calculate summary statistics of the model runs
## Here we are calculating the 2.5th, 50th, and 97.5th
##percentiles
SOut <-  apply(Ss,2,quantile,pro=c(0.025,.5,.975))
IOut <-  apply(Is,2,quantile,pro=c(0.025,.5,.975))
ROut <-  apply(Rs,2,quantile,pro=c(0.025,.5,.975))

par(mfrow=c(1,1))
## This plots the summary output
plot(1, type='n', ylim=c(0,1),xlim=c(1,max(which(diff(ROut[2,]) != 0))),xlab="Day",ylab="Fraction of population")
mtext(bquote(beta == .(beta)*", and " ~ gamma == .(gamma)),3)
polygon(c(1:Duration, rev(1:Duration)),c(SOut[1,],rev(SOut[3,])), col=adjustcolor(COLs[1],alpha=.1), border=NA)
lines(SOut[2,],col=COLs[1])
polygon(c(1:Duration, Duration:1),c(IOut[1,],rev(IOut[3,])),  col=adjustcolor(COLs[2],alpha=.1), border=NA)
lines(IOut[2,],col=COLs[2])
polygon(c(1:Duration, Duration:1),c(ROut[1,],rev(ROut[3,])),  col=adjustcolor(COLs[3],alpha=.1), border=NA)
lines(ROut[2,],col=COLs[3])
legend("topright",col=COLs,lwd=2,legend=c("Susceptible","Infectious","Recovered"),bg="white")

## This plots the raw output
plot(1, type='n', ylim=c(0,1),xlim=c(1,max(which(diff(ROut[2,]) != 0))),xlab="Day",ylab="Fraction of population")
mtext(bquote(beta == .(beta)*", and " ~ gamma == .(gamma)),3)
lines(SOut[2,],col=COLs[1])
lines(IOut[2,],col=COLs[2])
lines(ROut[2,],col=COLs[3])
for (k in 1:(NumSims-length(Toss))){
	lines(Ss[k,],col=adjustcolor(COLs[1],alpha=.1))
	lines(Is[k,],col=adjustcolor(COLs[2],alpha=.1))
	lines(Rs[k,],col=adjustcolor(COLs[3],alpha=.1))
}
legend("topright",col=COLs,lwd=2,legend=c("Susceptible","Infectious","Recovered"),bg="white")



## This plots the raw output by group
par(mfrow=c(2,4))
for (i in 1:2){
	for (j in 1:4){
	  if (length(Toss)){
	    plot(apply(AllIs[i,j,-Toss,]/AllNs[i,j,-Toss,],2,mean),ylim=c(0,1),type='l',xlim=c(1,max(which(diff(ROut[2,]) != 0))),
	         col=COLs[2],xlab="Day",ylab="Fraction of population")
	  } else {
	    plot(apply(AllIs[i,j,,]/AllNs[i,j,,],2,mean),ylim=c(0,1),type='l',xlim=c(1,max(which(diff(ROut[2,]) != 0))),
	         col=COLs[2],xlab="Day",ylab="Fraction of population")
	  }
		mtext(paste(AgeLabels[j], AccBins[i],sep=" & "))
		for (k in setdiff(1:NumSims,Toss)){
			lines(AllIs[i,j,k,]/AllNs[i,j,k,],col=adjustcolor(COLs[2],alpha=.1))
		}
	}
}

## This plots the cumulative number of new infections
par(mfrow=c(2,4))
for (i in 1:2){
  for (j in 1:4){
    if (length(Toss)){
      plot(apply(CumSumIs[i,j,-Toss,],2,mean),ylim=c(0,max(CumSumIs)),type='l',xlim=c(1,max(which(diff(ROut[2,]) != 0))),
           col=COLs[2],xlab="Day",ylab="Cumulative number of infections")
    } else {
      plot(apply(CumSumIs[i,j,,],2,mean),ylim=c(0,max(CumSumIs)),type='l',xlim=c(1,max(which(diff(ROut[2,]) != 0))),
           col=COLs[2],xlab="Day",ylab="Cumulative number of infections")
    }
    mtext(paste(AgeLabels[j], AccBins[i],sep=" & "))
    for (k in setdiff(1:NumSims,Toss)){
      lines(CumSumIs[i,j,k,],col=adjustcolor(COLs[2],alpha=.1))
    }
  }
}

## Finally, some estimate of the total outbreak size
par(mfrow=c(2,4))
for (i in 1:2){
  for (j in 1:4){
    hist(CumSumIs[i,j,,dim(CumSumIs[i,j,,])[2]],
           col=COLs[2],xlab="Day",ylab="Total number of infections",main="")
    mtext(paste(AgeLabels[j], AccBins[i],sep=" & "))
  }
}

