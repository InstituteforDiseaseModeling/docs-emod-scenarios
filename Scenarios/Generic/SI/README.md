# SI model for lifelong infection

This scenario simulates the person-to-person disease transmission of an SI model in a hypothetical
population for a 100 year period. Because the simulation runs for so long, the time step is set to
10 to decrease the time needed for calculations. Vital dynamics (birth and death) are enabled and a
baseline outbreak occurs on day 30.

To configure EMOD to run as an SI model, set the incubation period to 0 and the infectious period
to a time longer than the maximum age allowed for any individual (125 years).

Try changing the base infectivity or birth and death rates to see how that affects the fraction of
infected people at steady state. Remember you can use the birth and death rate scaling parameters
to avoid changing the demographics file directly. Alternatively, you could turn off vital dynamics
and see how eventually everyone becomes infected.
