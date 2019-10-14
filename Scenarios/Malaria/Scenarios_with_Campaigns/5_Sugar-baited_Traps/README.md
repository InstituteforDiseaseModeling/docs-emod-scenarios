# Sugar-baited traps


This scenario introduces a new vector-lifecycle targeting intervention, the sugar-baited trap, or
attracting toxic sugar bait. This is a node-level intervention of class “SugarTrap”.

Sugar-baited traps are used to collect host-seeking mosquitoes.  All mosquitoes living or feeding
in a particular node have an equal chance of being caught by the trap.


## Scenario configuration

This simulation uses the Vector model, not the Malaria model; this simulation type includes relevant
vector parameters but does not include malaria-specific parameters. The parameter **Simulation_Type**
is set to VECTOR_SIM.

This scenario introduces a node-level intervention, which is targeting mosquito populations. Previous
scenarios used individual-level interventions which are distributed to individuals, whereas node-
level events are distributed to particular nodes.

### Parameters of note

In the configuration file, the parameter **Vector_Sugar_Feeding_Frequency** determines the frequency
of sugar feeding for mosquitoes. The potential settings for this parameter are

- VECTOR_SUGAR_FEEDING_NONE: No sugar feeding.

- VECTOR_SUGAR_FEEDING_ON_EMERGENCE_ONLY: Sugar feeding once at emergence.

- VECTOR_SUGAR_FEEDING_EVERY_FEED: Sugar feeding occurs once per blood meal.

- VECTOR_SUGAR_FEEDING_EVERY_DAY: Sugar feeding occurs every day.

As sugar traps only effect mosquitoes that are seeking sugar feeding, this parameter determines the
impact the SugarTrap intervention will have on the mosquito population. Note that these types of
interventions are typically less effective that more targeted interventions, the parameter
**Initial_Effect** is set to 10% to reflect this.


## Exercises

Run the simulation. Compare the output to the output from the "Simple Vector Model" scenario, to
examine how a node-level intervention that targets mosquitoes impacts the population size.

Change the value of **Vector_Sugar_Feeding_Frequency** from "VECTOR_SUGAR_FEEDING_EVERY_DAY" to
another of the options listed above, and compare the resulting output. How does feeding frequency
impact the efficacy of the intervention?