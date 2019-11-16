# Multiple Interventions: Bednets, IRS, Pre-erythrocytic Vaccines, and Gametocyte-blocking Vaccines

As mentioned in the scenario, "Bednets and Pre-erythrocytic Vaccines,"" malaria control and elimination
will require a combination of multiple interventions. In that scenario, two interventions were
used: bednets (or insecticide-treated nets, ITNs) and pre-erythrocytic vaccines, which are
accquisition-blocking vaccines (they prevent individuals from getting infections).

Building upon what was introduced there, this scenario will add on two more interventions: a
transmission-blocking vaccine (one that prevents individuals already infected with malaria to
transmit it) and indoor residual spraying (spraying houses with pesticides to kill mosquitoes).



## Scenario configuration

The configuration file is identical to the file used in the "Bednet Distribution" scenario. The
campaign file now contains four different interventions: the bednets ("SimpleBednet"), pesticide
spraying ("IRSHousingModification"), an acquisition-blocking vaccine ("SimpleVaccine", with the
**Vaccine_Type** set to "AcquisitionBlocking"), and a transmission-blocking vaccine,
("SimpleVaccine", with the **Vaccine_Type** set to "TransmissionBlocking").


### Parameters of note

The initial configuration of the campaign file ONLY has distribution of the transmission-blocking
vaccine (TBV). The other interventions are included in the file, but the TBV is the only one
that has a non-zero value for **Demographic_Coverage**.



## Exercises

Run the scenario and compare the output to the output from the "Bednet Distribution" and "Bednets
and Pre-erythrocytic Vaccines" scenarios.

Experiment with different settings of **Demographic_Coverage** for each intervention type.
First compare different interventions by only having one with a non-zero value set at a time.
How do transmission-blocking and acquisition-blocking vaccines differ in their impacts on
malaria transmission?

Next, try using mulitple interventions at one time by setting two or more values of
**Demograpic_Coverage** to non-zero settings. Can you find a combination of intervention strategies
that eliminates all cases of malaria?
