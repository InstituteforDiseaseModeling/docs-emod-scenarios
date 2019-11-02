# SIRS and waning immunity

This scenario illustrates how waning immunity after recovered turns an SIR model into an SIRS model.
The immune decay for both transmission and acquisition is enabled so that recovered individuals
can return to susceptible at a later time.

In this simulation, individual’s immunity decays with an average half-life of 180 days and a 90-day
offset. This applies to both transmission blocking and acquisition blocking immunity. The scenario
reintroduces an outbreak of the disease every 180 days for 10 years. The
configuration of the disease in this scenario is similar to influenza (R0 = 1.75).

The output will show a damped oscillation due to people losing immunity and becoming susceptible
again. Individuals who are susceptible people due to waning immunity are not classified as
susceptible in the simulation. They are reported under the "Waning Population" channel.

Try changing the waning immunity distribution by modifying the number of days until immunity starts
to decay and the immunity decay rate. For example, to represent a step-like function:

1. Set the Acquisition_Blocking_Immunity_Duration_Before_Decay and
   Transmission_Blocking_Immunity_Duration_Before_Decay to 180.

2. Set Acquisition_Blocking_Immunity_Duration_Before_Decay and
   Transmission_Blocking_Immunity_Duration_Before_Decay to 1.

Additionally, you can assign a non-zero value to Base_Incubation_Period to configure the simulation
like an SEIRS model.
