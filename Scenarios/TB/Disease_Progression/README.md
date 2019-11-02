# TB disease progression

The scenarios in this directory demonstrate how to configure heterogeneity in disease progression
and infectiousness that is typical for tuberculosis. It uses a simple demographics file that
describes 10,000 people who are all 20 years old at the beginning of the simulation and live in a
single homogeneously mixed population. This population is represented in the demographics file as a
single node.

Begin with the SEIR baseline scenario to first remove all heterogeneity in the progression from
latent to active TB and the presentation of TB disease. This serves as a baseline for comparison
when you add other forms of heterogeneity to that baseline model. The compareScenarios.cmd script
plots the difference between that SEIR baseline and the current scenario.

## SEIR baseline

By default, the TB model includes heterogeneity in TB disease progression. However, to better
understand how to configure that heterogeneity, we first recommend disabling it. This simplifies the
TB model to "collapse" it to an SEIR model. You can do this by configuring a single latent
progression speed, a single symptomatic state, and a single disease presentation. Individuals
progress from susceptible to latent infection, followed by active infection and recovery.

TB_Fast_Progressor_Fraction_Adult and TB_Fast_Progressor_Fraction_Child are both set to 1 so that
there are no slow progressors (the latent stage is a single state) and children and adults are
treated as a single group. Similarly, all parameters that differentiate between children and adults
are set to the same value for this scenario.

You can effectively disable the presymptomatic state by transitioning individuals into the
symptomatic active state in a single day (TB_Presymptomatic_Rate set to 1). Similar to disease
progression, the fraction of smear-positive individuals is set to 1 to eliminate smear-negative
individuals.

Finally, the model is configured to not include any extrapulmonary TB cases
(TB_Extrapulmonary_Fraction_Adult and TB_Extrapulmonary_Fraction_Child set to 0).

When you run the model and plot the inset chart, you will see curves typical of an SEIR outbreak in
which the susceptible population is quickly depleted, with latent individuals transitioning to
active disease. Ultimately, the entire population gets infected and then recovers.

Try changing the parameter values so that all individuals are slow progressors or are smear-
negative. The dynamics will be the same, but in the output channels you will see the individuals
move into a different category.

## Latency progression

To add by heterogeneity to disease progression, this scenario makes half of the individuals fast
progressors and half slow progressors, in both children and adults. In other words,
TB_Fast_Progressor_Fraction_Adult and TB_Fast_Progressor_Fraction_Child are both set to 0.5. Then
set TB_Slow_Progressor_Rate to 0.002, ten times slower than the fast progressor rate or 0.02.

You will see that the outbreak spreads more slowly as some individuals stay in the latent stage for
longer. Try change the rate of fast progression to see how that affects the spread of the outbreak.

## Active disease presentation

This scenario adds heterogeneity in the way active disease presents. First, it adds a non-infectious
presymptomatic state that individuals progress through before developing active disease. The
addition of the active presymptomatic state increases the overall time from initial infection to
active disease. This is controlled by the parameter TB_Presymptomic_Rate, which defines how quickly
individuals transition to active disease and is set to 0.0333 (approximately 30 days in
presymptomatic state).

Individuals with active TB are classified as smear positive, smear negative, or extrapulmonary. The
fraction of individuals in each of these groups must add up to 1. The smear positive and
extrapulmonary fraction is set explicitly and the remainder is set to smear negative. As with
disease progression, children and adults are configured independently.

You must set the infectiousness of smear-negative and smear-positive TB; extrapulmonary TB is non-
infectious and therefore has no configurable infectiousness. For smear-positive individuals, the
value of Base_Infectivity is directly applied and, for smear-negative individuals, it is multiplied
by TB_Smear_Negative_Infectivity_Multiplier to configure reduced infectiousness.

The population is evenly split among smear-positive, smear-negative, and extrapulmonary disease
presentations. Extrapulmonary mortality is 40% of smear-positive, and the mortality and
infectiousness are the same for both smear-negative and smear-positive TB.

