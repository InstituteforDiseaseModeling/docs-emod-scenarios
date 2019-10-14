# Animal reservoir zoonosis and migration

For many zoonotic diseases, there is a background animal reservoir that continuously exposes humans
to infection. When this is the case, outbreaks can be introduced from this reservoir and not just by
an outbreak event. This scenario simulates a zoonotic SEIRS model with an initial outbreak at day 40
and subsequent introductions from the animal reservoir as immunity wanes. 

In addition, this scenario uses Seattle as an example of a multi-node simulation with migration
among the nodes. Only one of the nodes has an animal reservoir. Individuals have a probability of
migrating to another node at every time step unless they have already migrated. When an individual
has migrated to another node, they can shed or acquire infection in that node. The migration pattern
for this simulation is configured as "WAYPOINTS_HOME" with Roundtrip_Waypoints set to 1. This means
individuals migrate one day and return home the next day.

The configuration parameter Enable_Infectivity_Reservoir allows for zoonotic outbreaks and the
demographics files set the timing and size of the reservoir. Birth is enabled, but both natural and
disease mortality are disabled. In this scenario, people's immunity decays with an average half-life
of 33 days and a 400-day offset. This assumption applies to transmission blocking, acquisition
blocking, and mortality blocking immunity. When enough susceptible individuals have accumulated due
to immunity waning and births, zoonotic introductions can occur.

Try changing the value in InfectivityReservoirSize or InfectivityReservoirStartTime in the
demographics file to see how this changes the timing, size, or frequency of outbreaks. Try moving
the reservoir parameters into the Defaults section of the demographics file to see what happens when
the animal reservoir is more widespread.