# Relationship networks

This collection of scenarios will demonstrate how to configure the contact networks used for person-
to-person transmission of HIV. As HIV is sexually transmitted, contact networks are composed of
sexual partners. The following sections will demonstrate how to create relationships with preference
for particular partners, as well as the behavior of individuals in particular relationship types.

Notice in the config.json file that the parameter Simulation_Type is set to "STI_SIM". The STI
simtype is what enables person-to-person transmission. To model HIV specifically,
Simulation_Type will need to be set to "HIV_SIM".


## Age of sexual debut

All files for this scenario are located in the "Sexual_debut" folder.

Individuals are only eligible to enter relationships after they have reached the age of sexual
debut. For each individual in the model, the age of sexual debut is randomly drawn from a
Weibull distribution.

To define the distribution for the age of sexual debut, the following configuration parameters
(located in the config.json file) are used:

* Sexual_Debut_Age_Female_Weibull_Heterogeneity

* Sexual_Debut_Age_Female_Weibull_Scale

* Sexual_Debut_Age_Male_Weibull_Heterogeneity

* Sexual_Debut_Age_Male_Weibull_Scale

* Sexual_Debut_Age_Min

Heterogeneity parameters govern the shape (heterogeneity = 1/shape), and as heterogeneity becomes
very small, the shape forms a sharp peak. The scale parameter is used to shift the curve left or
right.

There is typically a lag time between relationship eligibility and actual formation; you can
examine this difference in the RelationshipStart.csv output file, which is generated when
the parameter Report_Relationship_Start is set to 1.


## Configuring relationship networks

Once individuals become eligible to form partnerships, there are multiple factors that determine
who they will form partnerships with.

All parameters that configure pair formation and mixing patterns are demographics parameters, and
will be located in the demographics file(s). All files for running the following scenarios are
located in the "Forming_relationships" folder.

The "hiv_uniform_demographics.json" base demographics file used with this scanario creates a
population of 10,000 individuals with a fixed (population-independent) birth rate. The initial
population age distribution is uniform (configured by setting AgeDistributionFlag to 1) between the
ages of zero (configured by AgeDistribution1) and 55 years (20,075 days, configured with
AgeDistribution2). To maintain the uniform population structure, the mortality rate goes from zero
to 100% per day at the age of 55. The mortality rate is specified independently for males and
females by adding a second "gender" axis with the categories "male=0,female=1". However, the
mortality assigned to each gender is identical in this example. There is no geographic substructure,
so only a single geographic  location (e.g., node) is specified.


### Choice of sexual partner age

An overlay file, "hiv_pfa_transitory.json" is used to categorize types of partners, and to specify
the proportion of couples that should be formed between each pair of categories. Factors such as
infection status and risk group are inherently categorical, but ages must be categorized into age
“bins” of a specified width. Analogous to the process of creating a histogram, the edges between the
age bins are specified in increasing order. Age bins are created between each sequential pair of
edges. In addition, a bin is created for all individuals younger than the lowest edge, and a
separate bin is created for all individuals older than the highest edge. In this file, only one edge
is specified for each gender at the age of forty. This creates two age bins for each gender:
individuals younger than forty, and those older than forty. The total number of bins for each gender
is set to 2, and the age of the first bin is set to 40.

The preference matrix specifies that 70% of relationships should be between males under forty and
females under forty; 20% be between males over forty and females over forty; 10% be between males
over forty and females under forty, and none should be between males under forty and females over
forty.

The ages of both partners are recorded in RelationshipStart.csv (which is generated when the
parameter Report_Relationship_Start is set to 1) and can be plotted to verify that the age pattern
at the time of relationship formation is close to the prescribed mixing pattern.

The number of relationships actually formed in each category will be close  but not identical to the
prescribed preferences. This is because the desired partner type is not always available at the time
of pair formation. In this case, the pair formation algorithm will either pair the individual with
whoever is available, or it will have the individual wait in a queue until the next round of pair
formation. The decision between waiting and choosing who is available is determined by the parameter
PFA_Cum_Prob_Selection_Threshold. When some categories of potential partners are unavailable, the
parameter determines the minimum level of preference for the available partners required for the
individual to choose among whoever is available, rather than wait. For example, when
PFA_Cum_Prob_Selection_Threshold is set to zero, if a chosen type of partner is not available
then any partner for whom the individual has a nonzero preference can be chosen instead.

Note that there are no interventions included in the campaign file, and no disease outbreak (or
subsequent transmission). These files are simply to demonstrate the contact networks formed in the
STI simulation.

### Choice of partner by risk group

In addition to mixing patterns by age, you can also  specify partner preference by any
IndividualProperty, which can be used to represent factors such as HIV risk, geography,
socioeconomic group, accessibility to health care, and quality of health care. The demographics
file "hiv_Demographics_With_Risk_Group.json" demonstrates how to configure IndividualProperties
to have two risk groups, "Low" and "High". In this example 80% of people are in the "Low" risk
group and 20% of people are in the "High" risk group. The file "hiv_pfa_overlay_risk_assortivity.json"
then demonstrates how to configure preference for particular risk groups (the "Assortivity"
parameters).

* To use these files, you will need to change the parameter "Demographics_Filenames"
  to include (in the following order) "hiv_Demographics_With_Risk_Group.json",
  "hiv_pfa_overlay.json", "hiv_pfa_add_informal_marital.json", and "hiv_pfa_Concurrency.json".


### Relationship types and durations

The overlay file, "hiv_pfa_transitory.json" includes parameters that govern the relationship types
and durations. In addition to this file, this scenario will include a second overlay file, the
"hiv_pfa_overlay_rates.json" file. To run a simulation exploring this scenario, make the following
changes on your config.json file:

* Set "x_Base_Population": 0.2

* Set "Demographics_Filenames" to "hiv_uniform_demographics.json", "hiv_pfa_overlay_rates.json"
  Note that the files need to be the third file in the order listed.

* Set "Enable_Vital_Dynamics":0

* Set "PFA_Cum_Prob_Selection_Threshold": 0.2

* Set "Report_Relationship_End": 1

* Set "Simulation_Duration": 14600

* Set "Simulation_Timestep": 1

In the previous scenario, only relationships of the type "transitory" were formed. Here you will
see the addition of informal and marital relationship types.

All relationship durations are Weibull distributed. The duration of the relationship is used to
calculate the end time of the pairing, and may end prior to the scheduled end time (e.g. due to
the death of one partner). The file RelationshipEnd.csv records the end time of all relationships
formed during the simulation.

Note that there are no interventions included in the campaign file, and no disease outbreak (or
subsequent transmission). These files are simply to demonstrate the contact networks formed in the
STI simulation.

### Choice of partner age by relationship type

This scenario builds upon the previous two, by creating more complex mixing patterns by age and
relationship type/duration. To run this set of files, make the following changes in the
config.json file:

* Set the array for "Demographics_Filenames" to include only "hiv_uniform_demographics.json" and
  "hiv_pfa_overlay.json".


Note that there are no interventions included in the campaign file, and no disease outbreak (or
subsequent transmission). These files are simply to demonstrate the contact networks formed in the
STI simulation.


### Concurrency in relationships

You can configure the model to allow individuals to have multiple simultaneous relationships.
Concurrency is controlled by "flags" for each relationship type that determine if an individual is
eligible to seek multiple relationships when in a particular relationship type. For example, for an
individual to have simultaneous "transitory" and "marital" relationships, they must have both the
"extra_transitory" and "extra_marital" flags. In the demographics file, you can configure the
probability of receiving the flag for each relationship type and gender, as well as setting a limit
on the maximum number of simultaneous relationships for an individual.

....


To configure concurrency in the model, make the following changes in the config.json file:

* Set "x_Base_Population": 1

* Set "Campaign_Filename": concurrency_campaign.json

* Use the demographics files "hiv_uniform_demographics", "hiv_pfa_simple.json",
  "hiv_pfa_add_informal_marital.json", and "hiv_pfa_concurrency" for the parameter
  "Demographics_Filenames" (the order must be kept the same, with "hiv_uniform_demographics.json
  first). These demographics files have concurrency parameters set, so that multiple relationship
  types will form, and individuals will engage in concurrent partnerships.

* Set "Enable_Vital_Dynamics": 1

* Set the "Listed_Events" array to include ["PostDebut", "PreDebut"]

* Set "PFA_Cum_Prob_Selection_Threshold": 0.2

* Set "Report_Event_Recorder": 1

* Set the "Report_Event_Recorder_Events" array to include ["PostDebut", "PreDebut"]

* Set "Report_Relationship_End": 1

* Set "Simulation_Duration": 14600

* Set "Simulation_Timestep": 30.41667


Although the configuration parameters allow high levels of concurrency, the actual levels of
concurrency at any given time are considerably lower. That is because the extra-relational flags
only create the potential for individuals to add relationships, but depending on the formation rate
and mixing pattern, actual formation may not occur. This is similar to the way that sexual debut
occurs earlier than actual formation of the first relationship.

The model offers a way to control the proportion of “potential concurrency” that is realized. The
rate of formation of relationships can be modified specifically for individuals who received a
concurrency-enabling flag. Use the parameters "Extra_Relational_Rate_Ratio_Female" or
"Extra_Relational_Rate_Ratio_Male" to adjust the rates for males and females.

You can change the Rate ratios from 1 to 10 to compare the effect on contact networks. When the
rate ratio is 10, there will be fewer paired people, more single post-debut men, and more active
relationships overall. Another way to examine the outcome of this parameter is to look at the
distribution of the number of relationships that individuals engage in at a specific point in time.
Setting the rate to 10 leads to fewer individuals participating in exactly one relationship, and
more individuals with no or multiple relationships. To adjust the rate ratios, edit the values in
the file  "hiv_pfa_simple.json", or use the overlay file "hiv_pfa_rate_ratio.json". To use this
overlay, add the file name to the parameter "Demographics_Filenames" in the config.json as the final
name in  the array.

Note that the rate of concurrency can also be controlled by specifying the minimum number of days
between two consecutive relationships. In the config.json file, the parameter
"Min_Days_Between_Adding_Relationships" can be set to a specified value to help control concurrency
formation.

Concurrency flags can be configured to be handed out independently, as the current scenario files
use, or correlated. When "Extra_Relational_Flag_Type" is set to "Independent", flags are distributed
independently by relationship type. This makes it unlikely for an individual to independently
receive all three extra-relational flags. Without a flag for a particular type of relationship,
joining that relationship prohibits the addition of any further relationships (of any type). When
"Extra_Relational_Flag_Type" is set to "Correlated", risk can be concentrated in a  subset of the
population. The flag is handed out randomly as before, but flags are distributed for each
relationship type in the order listed, with the first flags distributed randomly and each subsequent
flag distributed only among individuals who have the prior flag.

* To examine how the "Extra_Relational_Flag_Type" parameter impacts concurrency, change the value
  from "Independent" to "Correlated" in the file "hiv_pfa_simple.json". You will also need to add
  the parameter "Correlated_Relationship_Type_Order": ["Transitory", "Informal", "Marital", "Commercial"]
  under it in the json file. Note that the order of the relationship types is up to the user.

## Coital frequency and coital dilution

For each relationship type, the parameter "Coital_Act_Rate" can be used to specify the frequency of
coital acts (in units of acts per day). For example, a value of 0.33 means that relationships will
be consummated once per three days on average. Note that the timing of coital acts is random (i.e.,
the time until the next coital act is exponentially distributed with the configured rate), so that
it is not guaranteed that exactly 3 days will elapse between coital acts.


When individuals engage in concurrent relationships, coital dilution can occur. Coital dilution is
a change in the frequency of coital acts as the result of having multiple partnerships. To utilize
coital dilution, make the following changes in the config.json file:

* Set "x_Base_Population": 0.002

* Use the campaign file "campaign.json" and set "Campaign_Filename": "campaign.json"

* Use the demographics files "hiv_uniform_demographics.json", "hiv_pfa_simple.json",
  "hiv_pfa_overlay_rates.json", and "hiv_pfa_Concurrency.json". The array for "Demographics_Filenames"
  must be filled out with the files in the listed order.

* Set "Enable_Coital_Dilution": 1

* Set "Enable_Vital_Dynamics": 0

* Set "Coital_Dilution_Factor_2_Partners": 0.5

* Set "Coital_Dilution_Factor_3_Partners": 0.33

* Set "Coital_Dilution_Factor_4_Plus_Partners": 0.25

* Set "PFA_Cum_Prob_Selection_Threshold": 0.2

* Set "Report_Coital_Acts": 1

* Set "Sexual_Debut_Age_Female_Weibull_Heterogeneity": 0,

* Set "Sexual_Debut_Age_Female_Weibull_Scale": 0,

* Set "Sexual_Debut_Age_Male_Weibull_Heterogeneity": 0,

* Set "Sexual_Debut_Age_Male_Weibull_Scale": 0,

* Set "Sexual_Debut_Age_Min": 0,

* Set "Simulation_Duration": 730,

* Set "Simulation_Timestep": 1,

Note that the reduction in coital dilution is independently configurable for individuals with two,
three, or more than three partners. When the two participants in a relationship have different
numbers of partners, then the reduction factor from the person with more partners is applied. You can
observe coital dilution by examining the RelationshipsConsummated.csv file, which is created when
the parameter Report_Coital_Acts is set to 1.