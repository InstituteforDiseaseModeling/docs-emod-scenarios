# Age-dependent immunity

Because the disease course for TB can differ between children and adults, EMOD has separate
configuration parameters for adults and children to facilitate more realistic TB simulations. By
default, the line between children and adults is defined at 15 years, though you can modify this
value using Minimum_Adult_Age_Years. This simulation runs for approximately 20 years and has an
initial TB outbreak and then a second outbreak at year 15. Both outbreaks are targeted to children.
Birth is enabled.

In addition to scripts that plot the inset chart and all output channels, there is a plotResults.cmd
script that specifically highlights children and adults.

## Lifelong immunity

To confer lifelong immunity after infection, you can disable waning immunity by setting
Enable_Immune_Decay to 0. You could also enable immune decay but prevent anyone from
losing immunity by setting TB_Immune_Loss_Fraction to 0. Post_Infection_Acquisition_Multiplier specifies the
reduction in full immunity after infection; it is set to 0, indicating that individuals are fully
immune to reacquisition.

All children are set to be slow progressors and all adults are set to be fast progressors. However,
the actual rate of disease progression is set to be same for both groups. This makes it easier to
differentiate between children and adults in the output reports. The demographics file also defines
age bins so you can graph the property report to see incidence for children vs. adults.

## Waning immunity

To configure waning immunity across the entire population, TB_Immune_Loss Fraction is set to 1.
Acquisition_Blocking_Immunity_Duration_Before_Decay is set to 3650 (10 years) and
Acquisition_Blocking_Immunity_Decay_Rate to 0.05. After 10 years, immunity will quickly wane and be
completely gone after 12 years. You will see the entire population infected during the second
outbreak at year 15.

Try varying the fraction of the population that loses immunity, the decay rate, and the duration of
total immunity.


## Childhood vaccination

The campaign file includes a vaccination intervention that occurs after each birth. The efficacy of
the vaccination is 100% and lasts for 15 years. The other parameters remain the same. Therefore,
when the second TB outbreak occurs at year 15, all children born during the simulation will be
immune. All adults will have lost the immunity acquired during the first outbreak, so only adults
will contract the disease.

Try changing the efficacy of the vaccine or how long immunity lasts before it begins to wane.

