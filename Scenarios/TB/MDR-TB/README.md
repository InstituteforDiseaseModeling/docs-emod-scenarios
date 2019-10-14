# Multidrug-resistant TB (MDR-TB)

Multidrug-resistant TB (MDR-TB) can be acquired or transmitted. Individuals may be infected with a
drug-sensitive strain, receive ineffective treatment, and then acquire MDR-TB as the resistant
strains proliferate. MDR-TB may also be transmitted directly, infecting an individual with drug-
resistant strains from the beginning. Testing for MDR-TB is vital for effective treatment.

## Ineffective treatment

In the ineffective treatment scenario, the files are initially configured so that all individuals
are immediately infected with TB, receive ineffective treatment, and go on to acquire MDR-TB as
drug-resistant strain proliferate. Try running the model and graphing the output using
plotAllCharts.bat. You will see the proportion of active TB cases that are MDR-TB gradually
increase.

In the campaign file, try changing the value of Demographic_Coverage in the initial outbreak to a
smaller proportion of the population, such as 0.01. You will see see how those individuals acquire
MDR-TB and then go on to transmit it to others over the course of the simulation. However, not
everyone in the population will become infected. Try changing the values of
TB_MDR_Fitness_Multiplier to reduce the infectiousness of MDR-TB or Reduced_Transmit to reduce the
transmissibility while on drugs.


Then, you can "turn on" the second intervention listed in the campaign file. The Coverage parameter
is initially set to 0; if you change that value to 1, all individuals who fail treatment with the
first-line combo will be treated again with the empiric treatment. With EMOD, failed treatment
indicates no change in disease state. The empiric treatment is equally ineffective. Try changing the
efficacy or coverage of the empiric treatment.

## Second-line drugs

In the second scenario, individuals who fail treatment are tested for MDR-TB before they receive
additional treatment. If they test negative, they receive the empiric treatment. However, because
the MDR-TB test is configured to be perfect (no false positives or negatives), no individuals should
receive that intervention. Try reducing the sensitivity or specificity to see how the course of the
outbreak changes.

If individuals test positive, they receive effective treatment that cures the infection in an
average of 10 days (Drug_Cure_Rate is 0.1). Try changing this rate or the rate of other drug effects
(inactivation, relapse, mortality, etc.).
