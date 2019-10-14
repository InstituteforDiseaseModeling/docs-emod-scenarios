# Garki Retrospective: IRS and MDA

This scenario examines the historical combination of indoor residual spraying (IRS) and mass drug
administration (MDA) by using data from the Garki project. The Garki project ran from 1969 - 1976 in
Jigawa State, Nigeria, and was conducted by the WHO for two main purposes: first, to examine the
impacts of IRS and MDA on malaria transmission; and second, to determine the utility of mathematical
modeling in epidemiology.

Unfortunately, the interventions did not disrupt transmission to the desired level. However, the
use of modeling was extremely successful, and was able to greatly enhance understanding of the
epidemiology of the *Plasmodium* parasite. For more information on the Garki project, see
http:/garkiproject.nd.edu.



## Scenario configuration

This intervention contains two events: an IRSHousingModification event and an AntimalarialDrug
event. While the IRSHoussingModification event was used in the scenario "Multiple Interventions,"
the MDA intervention AntimalarialDrug is a new event.


### Parameters of note

In previous scenarios, you used vaccination campaigns to stop malaria transmission. In those
scenarios, you had the **Simulation_Type** set to "VECTOR_SIM", AND used a generic vaccine where the
efficacy of the vaccine was set in the campaign file. (See the **Intervention_Config** parameters on
**Vaccine_Type**, **Vaccine_Take**, and **Waning_Config**).


Now, to use an MDA campaign, you will be using malaria-specific antimalarial drugs, and the
**Simulation_Type** parameter is set to "MALARIA_SIM". Instead of a generic vaccine, you can now
use specific antimalarial drugs, and can configure particular aspects of drug functionality. These
parameters are set under **Malaria_Drug_Params** in the configuration file. In the campaign file,
you can specify which drugs are used, whom they are given to, and when they are distributed (see
the parameters included under **Intervention_Config**).



## Exercises

Run the model to see how IRS and MDA impact malaria transmission.  You can modify the campaign
file to test one intervention at a time: simply change the **Demographic_Coverage** parameter to 0
for the intervention that should not be distributed.

Next, try using different drugs in the MDA. The different drugs available are listed under
**Malaria_Drug_Params** in the config file; simply change the name of the **Drug_Type** parameter
in the campaign file to one of the others listed in the config file. Compare the efficacy of the
various drugs, and see if you can determine what aspects of the drug are most important for
disrupting malaria transmission.