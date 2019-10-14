# Typhoid Infection

Typhoid fever is an enteric disease caused by the pathogen *Salmonella typhi*.  Individuals contract
typhoid through contaminated water and food sources. Once infected, they will go through several
stages beginning as susceptible, progressing through prepatent (the stage when the bacterium
is incubating), and then into three disease states: subclinical, acute, and chronic. The
acute and subclinical stages may progress to the chronic state, or individuals may recover. Note
that there is a chance of death for those with acute typhoid, and those with chronic typhoid never
recover.

This scenario is designed to demonstrate the typhoid-specific features of EMOD. The TYPHOID_SIM
is built upon the framework of the ENVIRONMENTAL_SIM, and therefore contains all features of the
environmental model--most notably, multi-route HINT, user-configurable seasonality, and diagnostic
tests that determine environmental contamination. Those features are described in more detail
in the EMOD documentation as well as in other scenarios. Here, the focus in on the typhoid-specific
parameters which configure transmission to mimic the progression and transmission of typhoid.

# Exercises

Run the simulation.  This scenario uses a realistic set of demographic files for a location
that has typhoid outbreaks; the campaign.json file only contains an outbreak, there are no
interventions included. Using the "plotAllCharts" batch file, examine the plots for the disease
dynamics. Notice that there are multiple spikes of new infections: this is due to the repeated
outbreak configured in the campaign.json file.

The plots show a break down of infections by disease state as well as the route which caused the
infection (contact vs. environmental). Note that the "symptomatic" individuals are those individuals
that move from the prepatent stage to the acute stage (the non-symptomatic individuals will move to
the subclinical stage).

Open the "ReportTyhphoidByAgeAndGender.csv" file (located in the "outputs" folder). This file will
provide  a detailed breakdown of the individuals with typhoid, the disease state they're experiencing,
and the time during the simulation when they became infected.

To understand the transmission of typhoid, experiment by changing the typhoid-specific parameters
in the config.json file.  There are parameters to control each stage of the disease, including
infectiousness, duration, and other relevant factors.
