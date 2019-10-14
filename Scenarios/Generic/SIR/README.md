# Simple SIR single-node outbreak

This scenario demonstrates a simple SIR epidemic in a single-node, village-scale location. EMOD uses
an SEIR-like disease model by default. You can modify the default SEIR model to an SIR model by
turning off the incubation period (Base_Incubation_Period = 0 and Incubation_Period_Distribution
= FIXED_DURATION) and immune decay (Enable_Immune_Decay = 0) in the config.json file.

The spread of disease in the SIR model depends on the basic reproductive number R0. In this
simulation, the average infection duration is 4 days, and R0 is 14 (measles-like). An exponentially
distributed period is used to match the behavior of the ODE SIR model.

This simulation uses an OutbreakIndividual event at day 1 in campaign.json as the initial seeding of
the infection.

The demographic file generic_scenarios_demographics defines a single node with 10,000 individuals
and has a fixed birth and death rate at 20 per 1000 individual per year (0.0000548 per day). This
demographics file is used by this scenario and several of the other Generic simulation scenarios.
However, for this scenario and some others that use this file, the birth and death rate needs to be
0. You can disable births and deaths by setting the configuration parameter Enable_Vital_Dynamics to
0.

After running the base simulation of the SIR epidemic, you can vary the parameters for disease
infectivity and infection duration to see the effect on the height of the epidemic peak, the time to
reach the peak, and the cumulative number of disease cases.

The EMOD model is individual-based, which allows the implementation of a flexible distribution. In
an ODE model the time constants are exponentially distributed, however, this is not case for some
diseases. You can test the effects of different distributions in the EMOD executable by changing
Infectious_Period_Distribution in the configuration file. For example, set it to "FIXED_DURATION"
and let all other parameters remain the same, which shows a much faster spread of disease.

You can also try the same SIR model with different basic reproductive number values. For example,
run the simulation with R0 equal to 0.2 and 2.0. The disease will die out for the former and progress
much faster for the latter.

* Simulation with R0 = 0.2 :  Keep Base_Infectious_Period equal to 4 and change
  Base_Infectivity to 0.05.

* Simulation with R0 = 2.0 :  Keep Base_Infectious_Period equal to 4 and change
  Base_Infectivity to 0.5.