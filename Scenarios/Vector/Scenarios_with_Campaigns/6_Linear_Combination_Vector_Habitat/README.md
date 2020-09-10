# Vector Habitat

In this scenario you will configure and run a vector simulation in Namawala where the vectors reside
in multiple habitat types.

Investigating a linear-combination of habitats is important because in many cases, a mosquito
species will not be characterized by a single type of habitat. Instead, a mosquito species may
predominantly use a single habitat type, but also make use of other habitat types when available.
The new linear-combination habitat models allow you much more control over local vector ecology,
especially in dry seasons.


## Scenario configuration

To simplify the scenario, only one vector species will be used: *Anopheles arabiensis*.

This simulation uses the Vector model, not the Malaria model; this simulation type includes relevant
vector parameters but does not include malaria-specific parameters. The parameter **Simulation_Type**
is set to VECTOR_SIM.

This scenario introduces a node-level intervention, which is targeting mosquito populations. Previous
scenarios used individual-level interventions which are distributed to individuals, whereas node-
level events are distributed to particular nodes.

The campaign file for this scenario contains the OvipositionTrap intervention, where mortality is
imposed on mosquitoes hatching after oviposition.


### Parameters of note

Notice that there are still three mosquito species (arabiensis, funestus, and gambiae) and their
attributes listed under  **Vector_Species_Params**. To only focus on one species ("arabiensis"), the
parameter  **Vector_Species_Names** only contains "arabiensis" in the array (including the other two
species names would include them in the model. Omitting them allows EMOD to ignore them).

Under the **Vector_Species_Params** for "arabiensis," the **Larval_Habitat_Types** parameter contains
two habitat types and their available space for the larval population. For "arabiensis," the
configured habitat types are TEMPORARY_RAINFALL and WATER_VEGETATION. Notice that the other species
only have one habitat type listed.

For more information on available habitat types, see the parameter reference at
http://idmod.org/docs/malaria/parameter-configuration.html#larval-habitat



## Exercises

Run the model. Increase and decrease the values for the habitat parameters to determine how important
particular habitat types are for mosquito populations. To increase complexity, add more habitat
types from the list available in the EMOD parameter guide.