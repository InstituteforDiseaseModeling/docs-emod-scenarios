# Full Malaria Model


This scenario uses the malaria model, which adds malaria-specific features onto the vector model.
For example, the MALARIA_SIM type builds upon the VECTOR_SIM type by adding detailed microsolvers
that include  within-host parasite dynamics of malaria. Development of clinical and parasitological
immunity is tracked through innate and adaptive immune responses to specific antigens. A detailed
parasite count over time is tracked for each infected individual, permitting simulation of measured
prevalence over time by slide microscopy, Rapid Diagnostic Tests (RDTs), or other diagnostics.
Gametocyte production and decay are included to study the human infectious reservoir.


## Scenario configuration

This simulation uses the malaria model, which adds disease-specific parameters on top of vector
transmission. The parameter **Simulation_Type** is set to MALARIA_SIM.

Notice that in the configuration file, the parameter **Malaria_Drug_Params** contains a list of
anti-malaria drugs and parameters that describe their efficacy. To actually distribute these drugs
to portions of the population, it is necessary to use the intervention **AntiMalarialDrug** which
is configured in a campaign file (note that this scenario does not include a campaign file, so
no drugs will be distributed).

Instead of generic disease parameters, the MALARIA_SIM type contains malaria-specific parameters.
For example, while  **Base_Incubation_Period** is still  present in the malaria model, the
parameters **Base_Infectous_Period** and **Base_Infectivity** have  been replaced with parasite
parameters.


## Exercises

Run the full malaria model in Namawala. The duration of infection is solved dynamically. Experiment
by varying parameters to observe sensitivities. The gametocyte parameters are the most uncertain in
the solver. Key outputs include the measured prevalence by different diagnostic methods, the
prevalence of fever, and the human infectious reservoir over time.









