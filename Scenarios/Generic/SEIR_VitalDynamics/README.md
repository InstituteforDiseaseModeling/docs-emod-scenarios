# SEIR model with birth and death (vital dynamics)

This scenario explores the effect of birth and death on a simulation. In a closed population with no
vital dynamics, an epidemic will eventually die out due to an insufficient number of susceptible
individuals to sustain the disease. Infected individuals who are added later will not start another
epidemic due to the life-long immunity of the existing population.

However, new births can provide more susceptible individuals to the population.
In this case, when infected individuals are added later, another epidemic may start. The demographics
file specifies the birth and death rate at 20 per 1000 individuals per year (0.0000548 per day).
These values are scaled up in the configuration file using the parameters x_Birth and x_Other_Mortality.

This scenario assumes that 80% of individuals are immune at the beginning of the simulation and uses
an OutbreakIndividual event to reintroduce the disease every 2 years over the course of 10 years.
With larger population sizes, the epidemic can sustain itself and not need this reintroduction.

Notice how disease prevalence reaches a steady state after some time. Try increasing birth rate and
population size to see if the influx of new susceptible individuals is enough to sustain the
epidemic without reintroducing an outbreak. Also try disabling births and deaths by setting
Enable_Vital_Dynamics to 0 to see how eventually the number of susceptible individuals will be
exhausted and a reintroduction of the outbreak will not cause a new outbreak.
