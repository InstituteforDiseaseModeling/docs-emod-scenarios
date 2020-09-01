# Seasonality

The ENVIRONMENTAL_SIM (and the sim types built upon its framework, such as TYPHOID_SIM) do not
have climate capability. However, as many environmentally-transmitted pathogens may be impacted by
seasonal effects, there is a feature that enables user-controlled seasonal attenuation of contagion.

To control seasonal impacts on environmental contagions, the model allows the user to specify a
trapezoidal-shaped infectivity multiplier.  This feature uses four parameters:

- Environmental_Peak_Start: The day of the year peak seasonality starts.
- Environmental_Ramp_Down_Duration: The duration (in days) from the environmental peak multiplier to
  when there is a multiplier of zero.
- Environmental_Cutoff_Days: The duration (in days) of a zero multiplier.
- Environmental_Ramp_Up_Duration: The duration (in days) for the time of zero multiplier to peak
  environmental multiplier.

The duration of this cycle lasts for 365 days; the cycle can be repeated annually.

The base of both the environmental and contact route contagion populations is set using the
parameter **Base_Infectivity.**


## Exercises

This scenario is designed to illustrate the trapezoidal-shaped infectivity multiplier (seasonality)
on the environmental contagion population (e.g. the amount of environmental contaminants present).

To begin, **Base_Infectivity** is set to 0.3.  After running the simulation, use the "plotAllCharts"
batch file to examine the model output. Notice that the graph for "Environmental Contagion Population"
creates a line that looks like trapezoids, and the maximum value reached is 0.3, the value set by
**Base_Infectivity.**  Now examine the "Contact Contagion Population" graph: it is a straight
horizontal line set at 0.3, again due to the value set by **Base_Infectivity.**

Notice that the number of infections for each contact route spike at the very beginning and then
remain flat at 0 new infections: this is because there are no multi-route HINT matrices specified
for this scenario (see the Multi-Route HINT tutorials for an explanation of this feature). All
individuals are infected very early in the simulation: the population is assumed to be well-mixed,
and individuals have two routes of exposure, contact and environmental, both set at 0.3. The plot
of "Daily (Human) Infection Rate" shows this, with a daily rate of 0.6!

Try modifying the value of **Base_Infectivity** to change the maximum value reached on the
"Environmental Contagion Population" plot. Notice a corresponding change in the value for the
"Contact Contagion Population."

Modify the values for the seasonality trapezoid (the four parameters listed above). See how changing
the duration of the ramps can lead to a different dynamic for what the seasonality curve will
become.

