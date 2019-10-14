# HIV transmission

This collection of scenarios illustrates how to configure HIV transmission, starting with how to
seed a population, and then how to configure sexual and vertical modes of transmission.




## Seeding an initial outbreak

The basic files use the **OutbreakIndividual** intervention to create an initial
prevalence of HIV in the population. The campaign file has been configured to start the epidemic at
2020, with half of all 20 year olds becoming infected; then all remaining individuals become
infected at age 30. When you run these files, you will see that there are two spikes of new
infections, which correspond to the timing of the two outbreak events.



## Sexual transmission

Running the files in the transmission folder results in two spikes of disease prevalence.
Multiple factors can influence the transmission rate of HIV, so to increase the sexual
transmission, change the following parameters in the config.json file:


* Set "Base_Infectivity": 0.02
  This parameter determines the transmission rate per number of coital acts. This increases
  the transmission by a factor of 10. If you compare the infected population of the base file
  to this new setting, you will see that nearly the entire population becomes infected very quickly,
  and the second spike (from the second introduction of HIV in the campaign file) is tiny (due to
  lack of susceptible individuals).

### Sexual transmission by age and gender

You can also utilize multipliers by gender and age to create an age and gender bias in transmission.
Use the "Male_to_Female_Relative_Infectivity_Ages" to create age bins for the age and gender bias;
use "Male_to_Female_Relative_Infectivity_Multipliers" to determine the relative  susceptibility of
females relative to males for the configured age bins. Both parameters are arrays, and the arrays
must be the same length. To remove the age dependence, just put one value in each array; when
multiple values are provided, the multiplier on the probability of transmission is linearly
interpolated between the specified ages. Ages do not have to be integer values. Ages younger than
the youngest specified age are assigned the value for the youngest specified age. Likewise, ages
older than the oldest specified age are assigned the value for the oldest specified age.


### Heterogeneity in transmission

The transmission rate can also be configured to be heterogeneous among individuals, with a
multiplier on infectiousness sampled from a log normal distribution.The multiplier is assigned to
each individual at birth and will be applied to every infection in that individual’s lifetime  The
heterogeneity is disabled by setting the heterogeneity parameter to zero. When the value is greater
than zero, the multiplier is applied to **Base_Infectivity**.

To use this feature, set **Heterogeneous_Infectiousness_LogNormal_Scale** to a value greater than
zero in the config.json file.



## Vertical transmission

The model supports vertical transmission of HIV via mother-to-child transmission (MTCT).
To configure MTCT, change the following parameters in the config.json file:

* "Enable_Maternal_Transmission": 1

* "Birth_Rate_Dependence": "INDIVIDUAL_PREGNANCIES_BY_AGE_AND_YEAR"
  This is because MTCT will only work when the model simulates individual pregnancies, e.g. linking
  the HIV status of specific mother with the exposure of a specific child.


When a child is born to an HIV-infected mother who is not receiving any interventions, the
probability that the child will be born with an HIV infection is set by the config.json parameter
Maternal_Transmission_Probability. If the mother is on antiretroviral therapy at the time of
childbirth, then the Maternal_Transmission_ Probability is multiplied by a factor,
Maternal_Transmission_ART_Multiplier.

For example, if the following parameters are set in the config.json file:

* "Maternal_Transmission_Probability": 0.3,

* "Maternal_Transmission_ART_Multiplier": 0.1,

then the rate of MTCT is reduced ten-fold, from 30% to 3%. You can experiment with different values
for these parameters to explore the impact of vertical transmission on HIV dynamics.

To run an intervention to prevent MTCT, see the scenarios in the Interventions folder.



## Co-infections

The HIV model does not currently support simultaneous transmission of HIV and other
sexually transmitted co-infections, but does support the inclusion of non-transmitting co-infections that
increase the infectiousness and susceptibility of HIV. A co-infection can be set or cleared for an individual
using interventions, thereby allowing targeting of co-infections by IndividualProperties (e.g., by
sociodemographic category or HIV risk group).

Co-infection causes an increase in both acquisition and transmission of HIV. The impact of co-
infection is determined through a multiplier, **STI_Coinfection_Multiplier**, which is set in the
config.json file.

As with seeding an initial HIV outbreak, to initiate a co-infection, it is necessary to use a
campaign event. the intervention class **ModifyStiCoInfectionStatus** will introduce a coinfection
into the population.


To configure a coinfection,

* Set "STI_Coinfection_Multiplier": 10 in the config.json file.

* Use the Coinfection_campaign.json file instead of the campaign.json file to run the simulation.
  Set "Campaign_Filename": "Coinfection_campaign.json" in the config.json file, and then rerun
  the simulation.

This campaign introduces an STI coinfection, and then clears the coinfection in the year 2025.