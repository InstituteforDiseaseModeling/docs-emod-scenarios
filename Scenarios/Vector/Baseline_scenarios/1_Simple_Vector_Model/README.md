# Simple Vector Model


In this scenario you will configure and run a simple, three-species vector simulation in Namawala.
You will calculate the baseline EIR, and by varying the parameter **x_Temporary_Larval_Habitat**,
observe the dependence of EIR on larval habitat.


## Scenario configuration

This simulation uses the Vector model, not the Malaria model; this simulation type includes relevant
vector parameters but does not include malaria-specific parameters. The parameter **Simulation_Type**
is set to VECTOR_SIM.

To create a simulation with multiple vector species, it is necessary to create  a separate
“VectorPopulation” object  for each vector species in the simulation.   Modeling multiple vector
species simultaneously allows for a mechanistic description of vector   abundances and behavior
through the effects of climate and weather on different preferred larval   habitats. The three
vector species present in this tutorial are *Anopheles arabiensis*, *Anopheles   gambiae*, and
*Anopheles funestus*, as these vectors drive most transmission in the Namawala region.   *An.
funestus* has more relative importance during the dry season, but *An. arabiensis* and *An.
gambiae* combined carry most of the annual transmission.


### Parameters of note

**Vector_Species_Names** is set to "arabiensis", "funestus", and "gambiae", as those are the three
species included in this simulation. **Vector_Species_Params** will then contain relevant information
for each of the species names.

**Enable_Interventions** is set to 0, as there are no campaigns included in this scenario.

Disease parameters are set to mimic malaria:  **Incubation_Period_Distribution** is set to
FIXED_DURATION and **Base_Incubation_Period** is set to 25 days corresponding to the duration from
an infectious mosquito bite to the development of sufficiently numerous gametocytes to infect
mosquitoes.

The following parameters are set for *Anopheles arabiensis*, as described in the article
" A malaria transmission-directed model of mosquito life cycle and ecology" by Philip Eckhoff, 2011.
*Malaria Journal* 10:303. https://doi.org/10.1186/1475-2875-10-303.

- **Acquire_Modifier** = 0.2
- **Adult_Life_Expectancy** = 10
- **Anthropophily** = 0.95
- **Aquatic_Arrhenius1** = 84200000000
- **Aquatic_Arrhenius2** = 8328.
- **Aquatic_Mortality_Rate** = 0.1
- **Days_Between_Feeds** = 3
- **Egg_Batch_Size** = 100
- **Immature_Duration** = 2
- **Indoor_Feeding_Fraction** = 1
- **Infected_Arrhenius1** = 117000000000
- **Infected_Arrhenius2** = 8336
- **Infected_Egg_Batch_Factor** = 0.8
- **Infectious_Human_Feed_Moratality_Factor** = 1.5
- **Larval_Habitat_Types** = "TEMPORARY_RAINFALL": 11250000000
- **Transmission_Rate** = 0.5



## Exercises

To test how larval habitat impacts baseline EIR, vary the habitat level. A simple way to do this,
without having to modify multiple parameters, is to use the parameter **x_Temporary_Larval_Habitat**.

This parameter is a scale factor that will modify the available habitat size for all mosquito
species listed in the configuration file. To test LOW EIR settings, set it to 0.1 and run the
simulation. To test HIGH EIR settings, set it to 1.0 and run the simulation again. Feel free to
experiment with other values as well.

