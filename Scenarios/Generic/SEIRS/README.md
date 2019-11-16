# SEIRS model with disease mortality

This scenario illustrates an SEIRS model in a single-node, village-scale location. In addition to
including natural mortality to more closely simulate population dynamics, it includes
disease mortality (Base_Mortality). Additionally, immune decay includes mortality as well as
acquisition and transmission.

The scenario includes a baseline outbreak at day 1, with a vaccination campaign at day 500 that has
100% vaccine take rate and 80% coverage. Immunity due to vaccination lasts for 10 years, whereas
immunity due to infection begins to decay after 100 days.

By varying disease infectivity and incubation durations, you can observe the effect of these
parameters on the height of the epidemic peak, the time to reach the peak, and the cumulative number
of disease cases. Additionally, you can increase or decrease the base mortality of the disease to
see how that affects disease dynamics.

For example, try increasing the base infectivity form 0.25 to 0.5, which changes the reproductive
number (R0) value from 1.5 to 3. You will see the disease cannot persist in the population because
the rate of consuming susceptible individuals was larger than the inflow of new susceptible
individuals. The infection could not find enough new susceptible individuals to sustain the
transmission.

Then try shortening the time period before immunity begins to decay from 100 to 50 days. You will
see the outbreak can persist due to an increased influx of susceptible individuals.
