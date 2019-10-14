# SEIR models with incubation periods

This scenario shows an initial outbreak of a disease with an incubation period, a period during
which an individual has been exposed to a disease but is not yet infectious. This changes the SIR
model to an SEIR model. As with SIR models, immunity waning must be disabled so recovered
individuals cannot become susceptible again.

You can see that after the initial fast growth, the epidemic depletes the susceptible population.
Eventually the disease cannot find enough new susceptible people and dies out. Introducing the
incubation period does not change the cumulative number of infected individuals.

The configuration of the disease in this scenario is similar to measles (R0 = 14). The configuration
file specifies an incubation period of 8 days. Try changing the length of the incubation period to
see how that affects the course of the outbreak.
