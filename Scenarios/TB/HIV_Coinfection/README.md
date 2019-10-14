# TB with HIV and ART

This scenario illustrates the HIV coinfection features introduced to the TBHIV model in EMOD v2.18.
This model can be used to specify HIV and TB co-dynamics. While TB transmission occurs dynamically,
HIV incidence is an external input to the model that can be specified in a time- dependent age- and
sex-stratified manner. In practice, this is generally done by using estimated HIV incidence from
statistical or dynamic HIV transmission models such as EMOD using the HIV simulation type.

In this scenario, we simulate hypothetical TB dynamics in a high HIV prevalence setting. Follow the
steps below to build the model sequentially.

## Burn in, TB diagnostics, and treatment

We initialize a TB outbreak at time 0 via OutbreakIndividualTBorHIV. Notice that as we are
considering both TB and HIV, we specify the Outbreak_Type as TB. Note also we have set
Enable_Coinfection to 1 to turn on the HIV-TB co-dynamics features. 

To achieve TB disease equilibrium, we allow TB dynamics to continue for 185 years without HIV
dynamics. We include TB treatment dynamics in the burn-in: case detection occurs passively and
individuals seek care after developing symptomatic TB via a SimpleHealthSeekingBehavior, receiving
their first test on average 4 months following onset of symptoms as specified by the Tendency.

Tests are broadcast via the custom user event TBTestPreDOTS defined in Listed_Events. Though custom
events are not included in default reporting in InsetChart.json, they may be added to the
Report_TBHIV_ByAge.csv by adding the events to the Additional_Events list in custom_reports.json
file. This event will appear as a column in the CSV file with rows stratified by 5-year age bins at
half-yearly intervals indicated in the Year column. Tallies are non-cumulative.

At this point individuals receive a diagnostic (DiagnosticTreatNeg) with a sensitivity dependent on
the individual’s smear status. Those testing positive (TBTestPositive) proceed to treatment. For
simplicity of illustration, individuals who fail treatment (TBFailedTreatment) or receive a false
negative test (TBTestNegative) do not re-seek care.

## Population serialization

After some years, the prevalence of latent and active TB in the population remains relatively
consistent and shows that the disease dynamics have stabilized. At this point, we will serialize the
population so subsequent simulations can begin after the burn-in period when the disease dynamics
are stable. 


## Introduction of HIV

HIV is introduced into the model after 185 years (corresponding to the year 1985). This is
accomplished through the GroupInterventionDistributionEventCoordinatorHIV, which is used to
introduce HIV incidence on a per-timestep basis according to the HIVCoinfectionDistribution in the
demographics overlay file, which specifies HIV incidence by age and sex over time.

CD4 declines among HIV-positive individuals are determined by the EMOD HIV model. Individuals
experience an increased rate of progression from latent to active disease. This is reflected by the
overall rapid increase in TB incidence and the proportion of HIV among those with HIV.

Yearly  HIV testing is introduced in 2007 via HIVSimpleDiagnostic. CD4Diagnostic is used to classify
individuals by CD4 counts into four  mutually exclusive bins.  Individuals with CD4 counts below 350
proceed immediately to antiretroviral therapy. We see a dramatic reduction in TB incidence mortality
and prevalence following ART as individuals' CD4 counts recover.

Running and plotting simulations
================================

Run the NoART and ART simulations, then use the plotARTScenarios to compare the output in each scenario.
This script uses the Report_TBHIV_ByAge.csv files created by the custom reporter.

WARNING: Because this simulation runs the model for many years, it can take a few minutes to run
the simulation locally.
