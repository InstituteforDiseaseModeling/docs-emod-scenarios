# SIR outbreak and vaccination

This collection of three scenarios illustrates how to control an SIR epidemic in a single-node,
village-scale location using vaccination campaigns. It also shows how to configure individual
properties in the demographics file so that vaccinations can be targeted to a specific segment of
the population.

## A: Baseline outbreak

This scenario illustrates an SIR outbreak without any campaign interventions. It is meant to
provide a baseline to compare to the accompanying scenarios that illustrate the effect of
vaccination on the spread of disease.

## B: Vaccination campaign for all individuals

This scenario illustrates an SIR outbreak with a vaccination campaign distributed to the entire
population. The vaccination campaign is repeated three times, seven days apart. The vaccine has
100% take and 50% demographic coverage. With this configuration, the fraction of immune people
is above herd immunity and the outbreak does not spread.

In the campaign.json file, try decreasing the demographic coverage, vaccine take, or
number of repetitions to see when herd immunity is no longer achieved.

## C: Vaccination campaign to targeted individuals

This scenario illustrates an SIR outbreak with a vaccination campaign distributed only to a
particular segment of the population. This can be the case when you are intentionally targeting
individuals who are at higher risk or, in this case, when there are individuals who are chronically
missed by intervention campaigns.

By default, EMOD assumes every individual has the same probability of receiving an intervention.
However, you can assign IndividualProperties to individuals in the demographics file to then target
interventions to individuals with certain property values.

With this configuration, the 30% of individuals who are difficult to access never receive
vaccinations and herd immunity is not achieved. Try modifying the demographics file to change the
property value distribution to see what fraction of the population can remain unvaccinated and still
achieve herd immunity.
