# Bednets and Pre-erythrocytic Vaccines

This scenario builds upon the "Bednet Distribution" scenario, by including a vaccination campaign
along with bednet distribution.

Stopping malaria transmission, and ultimately eradicating it, is a complicated process with no
simple solution. It will require the use of multiple intervention strategies, such as the use
of bednets, vaccination or mass drug administration campaigns, and insecticide spraying. The overall
distribution of each intervention will depend on the climate and transmission properties of the
particular location, so one strategy will not be "universal."  This scenario will demonstrate how
multiple interventions can be layered to start exploring how to create the more complex strategies.


## Scenario configuration

The configuration file is identical to the file used in the "Bednet Distribution" scenario. The
campaign file contains the same bednet distribution settings as well, but has added  an acquisition-
blocking vaccine ("SimpleVaccine", with the **Vaccine_Type** set to "AcquisitionBlocking").


### Parameters of note

The first half of the campaign file is the same as the file used in the Bednet Distribution
scenario.  Notice the addition of the **SimpleVaccine** intervention class, which is targeted to
80% of the population (**Demographic_Coverage** is set to 0.8), and has an efficacy of 90%
(the **Initial_Effect** parameter under **Waning_Effect** is set to 0.9). As the **Waning_Effect**
parameters have been configured, the efficacy of the vaccine will wane over time.

Notice that both the bednets and the vaccine will be distributed at the start of year 4.



## Exercises

Run the scenario and compare the output to the output from the "Bednet Distribution" scenario. With
the addition of vaccines, there will be an overall decrease in the number of malaria infections.

Experiment with the settings: manipulate the demographic coverage for bednets and vaccines, as well
as the initial effects for each.  Is one intervention more effective at reducing the number of
new malaria infections than the other?