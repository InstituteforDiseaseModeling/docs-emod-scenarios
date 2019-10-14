# Multi-route HINT

In its default setting, EMOD assumes that transmission within a population is homogeneous. However,
it is known that the specifics of disease transmission are often more complex: populations are
typically not well-mixed, people differ in susceptibility and exposure, and different groups may
have heterogeneity in access to preventatives or treatments. To account for these differences,
there is a model feature called "HINT: heterogeneous intra-node transmission." This feature is
explained in the Generic model scenarios, in a series of three examples.

Some pathogens, such as Salmonella typhi, which is responsible for typhoid fever, has a more complex
transmission pathway than is enabled by the Generic version of EMOD.  These pathogens can spread
via the contact route (as the Generic model uses), but also through a secondary route: through the
environment. To adequately capture these dynamics, the ENVIRONMENTAL_SIM has two modes of
transmission: a contact route and an environmental route. The TYPHOID_SIM is built on the
ENVIRONMENTAL_SIM framework (it takes the features of ENVIRONMENTAL_SIM and adds typhoid-specific
disease parameters to it).

For these simulation types, the HINT framework has been modified into multi-route HINT (MR-HINT), so
that heterogeneous transmission can occur over both transmission routes. As a user, the main change
in the code will be for the TransmissionMatrix in the demographics file: it will now have two
matrices, one for "contact" and one for "environmental."

The following scenarios are designed to introduce the functionality of the MR-HINT feature, and will
use the ENVIRONMENTAL_SIM simulation type.


## A. Baseline Multi-Route HINT

This scenario illustrates a simple example of using the MR-HINT feature. The node is split into  10
separate geographic areas, labeled "A" through "J". Disease transmission can occur via both the
contact and environmental routes; the "TransmissionMatrix" parameter in the demographics file has
one matrix for "Contact" and a second for "Environmental." The entry in row i and column j of each
matrix represents the "epidemiological connectedness" of HINT group i and HINT group j for that
route. Note here that the HINT groups represent geographic areas. In this example, both of the
matrices are identity matrices, meaning that there is only local mixing. For example, individuals in
location "A" only can transmit to other individuals in location "A", "B" with "B" and so on.
Similarly, environmental contamination only occurs locally, such that location "A" does not
contaminate location "B." Values in the matrix represent the scale factor applied to contagion
shedding, which is set using Base_Infectivity. This sets contagion for both routes--to modify the
level of contagion in each route, modify the scalars in each TransitionMatrix appropriately.

Individuals in each location now have a chance of getting an infection due to either the contact or
environmental route. There is no superinfection, so once infected via one route, exposure from the
other route will have no effect.

## Exercises

Using the "PlotPropertyReport" batch file, examine the plots of infections for each geographic area.
Notice that in this simulation, where every geography has the same multiplier for the contagion pool
in both routes, each geography experiences the same number of infections, and they take the same
duration to reach the maximum.

Try modifying the contact route scalars (the values in the "Contact" TransmissionMatrix, to see how
individuals in different geographies (areas)  can be more or less likely to be infected. Recall that
the matrices for both the contact and environmental routes are identity matrices, so individuals
only are exposed locally (they will not come into contact with contagions from other areas).



## B. Multi-Route HINT: "Down the River"

This scenario is a slight modification of the Baseline MR-HINT scenario. Disease transmission through
the environmental route has been modified so that it simulates a "down the river" situation, such as
when a contaminant starts at one location, and travels downstream to others. Here, the environmental
matrix is configured such that transmission occurs from area "A" to "B," "B" to "C," "C" to "D," etc.

## Exercises

Using the "PlotPropertyReport" batch file, examine the plots of infections for each geographic area.
Notice that in this scenario, while the "Contact" TransmissionMatrix is the same from the first
scenario, the "Environmental" TransmissionMatrix has been modified. Now, individuals are exposed
to local contact contagion, but only get environmental contagion from the prior geographic area.
You should see that geography "A" has a very slow increase in the number of infections, and never
reaches the maximum value of 10,000 (everyone infected). Similarly, geography "B" has a slow rate
of increase, although as it experiences environmental exposure from geography "A," the rate of
infection is faster than in "A" and does reach the maximum.

To explore how this dynamic changes transmission, try modifying the scalar values in the environmental
route matrix. Initially all values are set at 2.0, but if this truly were a river-borne contaminant,
there might be dilution as it travels downstream. Try setting each subsequent value in the matrix
to a lower value to observe the dynamics.

