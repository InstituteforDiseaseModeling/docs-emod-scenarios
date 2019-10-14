# Population burn-in and steady state dynamics

To model a population with endemic TB at a low absolute prevalence, you must run the simulation for
a period of time until the disease dynamics reach an equilibrium (aside from stochastic noise). This
is known as steady state.

## Steady state

This scenario runs a TB simulation that initially infects have of the population with TB, resulting
in an initial peak of active disease. It runs for 100 years until you can see TB begins to reach an
equilibrium within the population after approximately 40 years. Because the simulation includes a
large population over a long period of time, only 5% of the population is sampled (in other words,
each agent in the model represents 20 people). Additionally, each time step represents 5 days,
rather than the typical 1 day. These settings enable the simulation to run more quickly.

The population is serialized at years 10, 20, 40 and 80 (values are given in number of time steps).
This outputs a file that can be read by a subsequent simulation so you will not need to run the 
burn-in period again.

## Private to public intervention

This scenario consumes the serialized population file from year 80 to examine the effect of
improving the quality of care in an endemic setting. To see the effect over 10 years, you can run
this simulation for only 10 years instead of 90 because you are consuming a serialized population
file.


