# Impact of Climate on Seasonality

In this scenario, you will explore the impact of climate on the seasonality of malaria transmission.
You have three different locations to test: Namawala, Muheza, and Garki. The configuration files
share the same settings for all mosquito and disease parameters, and only differ in the location-
specific climates. The differences among the three locations go beyond the differences in annual
EIR. The dry season is much drier in Garki compared to Namawala, and thus the depth of the low
transmission season is lower. This causes a stronger variation in human infection in Garki,
especially if the tutorial is re-run with the full malaria microsolvers (eg. if you run the model
with **Simulation_Type** set to MALARIA_SIM).

Each configuration file and their associated batch files (used to run and plot simulations) are
located in a folder with the name of the location.


## Scenario configuration

This simulation uses the Vector model, not the Malaria model; this simulation type includes relevant
vector parameters but does not include malaria-specific parameters. The parameter **Simulation_Type**
is set to VECTOR_SIM.


## Exercises

Run the file for each of the three locations, Namawala, Muheza, and Garki. After each simulation
has completed, plot the output using the "plotAllCharts" batch file.


To examine the impact of climate on EIR, compare the output graphs to one another. Notice the
differences among vector population size, daily EIR, and infection rates. These differences are
attributable to the variation in rainfall, temperature, and humidity found in the different
locations.

To explore the dynamics further, try running the model with the The parameter **Simulation_Type**
set to MALARIA_SIM.