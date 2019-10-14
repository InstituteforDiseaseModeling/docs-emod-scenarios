# HIV-specific biology

This collection of scenarios starts with an initial seeding of HIV into the population, and then
demonstrates how untreated HIV will progress. The infections are initialized in specific age groups,
so that it is possible to observe CD4 counts and mortality over time.

To simplify the example, the population starts with a cohort of 10,000 individuals, with no
additional births. Non-disease deaths are disabled, and there is no additional disease transmission,
as **Base_Infectivity** has been set to 0. The campaign file uses the **OutbreakIndividual**
intervention to infect specific age groups at specific time points: half the individuals will be
infected at age 20 (the year 2020 in this simulation), and the remainder will be infected at age 30.
When you run these files, you will see that there are two spikes of new infections, which correspond
to the timing of the two outbreak events.

To target specific ages and genders, you will need to edit the campaign.json file. The following
settings will target half of all individuals in the age range of 19 to 21 year olds. The output will
be the same as the original settings, as everyone in the population is 20 years old in the year 2020.

* "Target_Demographic": "ExplicitAgeRangesAndGender"

* "Demographic_Coverage": 0.5

Add the following parameters below **Target_Demographic**:

* "Target_Age_Min": 19,

* "Target_Age_Max": 21,

* "Target_Age_Gender": "All",


## Survival time for children

Children become infected with HIV via mother-to-child transmission (MTCT), which is described in
the transmission section of the model. To utilize MTCT, see the exercises in the Transmission
folder. Here we will use the **OutbreakIndividual** campaign to create infections in infants in order
to demonstrate HIV progression in children.

To run a simulation designed to explore HIV progression in children, use the campaign file
"child_campaign.json". When using this campaign file, make sure to set:

* "Campaign_Filename": "child_campaign.json" in the config.json file.


The following config.json parameters govern childhood survival:

* "HIV_Age_Max_for_Child_Survival_Function": 15.0,

* "HIV_Child_Survival_Rapid_Progressor_Fraction": 0.57,

* "HIV_Child_Survival_Rapid_Progressor_Rate": 1.52,

* "HIV_Child_Survival_Slow_Progressor_Scale": 16.0,

* "HIV_Child_Survival_Slow_Progressor_Shape": 2.7,

You can change the values of the parameters to explore how childhood survival will be impacted. Use
the Weibull.xlsx worksheet (located in the HIV folder) to learn how Weibull parameters influence the
shape of the distribution. The output report HIVMortality.csv is created by setting
**Report_HIV_Mortality** to 1, and will enable you to examine survival times for the simulated
cohort.



## Survival time for Adults

Survival time with untreated HIV infection depends on the age of the individual at the time of
infection. At infection, survival time is drawn from a Weibull distribution with shape parameter κ
and scale parameter λ. The scale parameter λ is allowed to vary linearly with age as follows:

λ = HIV_Adult_Survival_Scale_Parameter_Intercept + HIV_Adult_Survival_Scale_Parameter_Slope*Age (in years).

Because survival time with HIV becomes shorter with increasing age, HIV_Adult_Survival_Scale_Parameter_Slope should be set to a negative number.

Although the scale parameter for survival time declines with age, it cannot become negative. To avoid
negative survival times at older ages, an additional parameter, HIV_Age_Max_for_Adult_Age_Dependent_Survival, determines the age beyond which HIV survival is no longer affected by further
aging.

To examine the effects of untreated HIV on adult survival, run a simulation using the campaign.json
file "adult_campaign.json". When using this file, make sure to set:

* "Campaign_Filename": "adult_campaign.json" in the config.json file.

This campaign uses the **OutbreakIndividual** intervention to infect a random 1/4 of individuals in
the year 2020, 1/4 in 2030, 1/4 in the year 2040, and the remaining 1/4 in the year 2050. This will
infect similar numbers of individuals at ages 20, 30, 40, and 50.

The output report HIVMortality.csv is created by setting **Report_HIV_Mortality** to 1, and will
enable you to examine survival times for each age group.


## CD4 count and WHO stage

To examine how CD4 count and WHO stage progress through the course of untreated HIV, run a
simulation with the base files (config.json and campaign.json). Set the following parameters in
the config.json file:

* "Report_HIV_Infection": 1,

* "Report_HIV_Infection_Start_Year": 2000,

* "Report_HIV_Infection_Stop_Year": 2100,

Note that the population is set to 100 individuals for this example to help minimize the size of
the ReportHIVInfection.csv output file. If the population is too large, this file will become
extremely large and the simulation will slow down.



## Heterogeneity in CD4 count at the time of seroconversion and death

The initial CD4 count at the time of HIV infection can be made heterogeneous in the model by setting
**CD4_Post_Infection_Weibull_Heterogeneity**  to a value greater than zero. This parameter
is equal to the inverse of the Weibull shape parameter: very small values of heterogeneity are
equivalent to very large values of the Weibull shape parameter, and will create a sharp peak near
the value set by **CD4_Post_Infection_Weibull_Scale**. When **CD4_Post_Infection_Weibull_Heterogeneity**
is equal to zero, the initial CD4 count will be always be set to the value of
**CD4_Post_Infection_Weibull_Scale**. Similarly, heterogeneous final CD4 count can be configured by
setting **CD4_At_Death_LogLogistic_Heterogeneity** to a value greater than zero, which sets the scale parameter for a log-logistic distribution.