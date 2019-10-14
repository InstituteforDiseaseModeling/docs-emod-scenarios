# Population heterogeneity in age and accessibility

This collection of three scenarios illustrates the effect of heterogeneity in both mixing between
population groups and in access to interventions, specifically vaccination. The scenarios simulate a
measles outbreak over a single year in an initially fully susceptible population, highlighting the
effect of differences in age and accessibility on disease dynamics.

Measles is a highly infectious virus that is typically transmitted by large respiratory and
aerosolized droplets. Some transmission also occurs via fomites, however this is believed to be a
less significant route for transmission as the virus only survives a short time on dry surfaces. The
pathogen is characterized by a high basic reproductive number, often estimated at 16-20 combined
with short incubation and infectious periods on the order of days. Immunity conferred is typically
lifelong and vaccination has high efficacy (~95%).

The fully susceptible population in this tutorial is used to illustrate the model features in the
most parsimonious manner. For calibration to real data, you would need to initialize a distribution
of immunity in the population at the beginning of the epidemic to represent past history of
infection and vaccination. This could be done through matching serology data and/or matching
vaccination dose history.

## A: Baseline outbreak with no interventions

This scenario illustrates a measles outbreak in a population with heterogeneous transmission and
no interventions.

The population is defined in the demographics file and individuals are assigned individual
properties for age and accessibility. Because age uses the demographics file for initial age
distribution and individuals move into different age bins as time progresses, it is configured
differently than the other property types, in which property values do not change unless configured
to do so.

At initialization, individuals are randomly assigned accessibility values of "Easy" or "Hard". The
TransmissionMatrix indicates that individuals who are easily accessible are nine times as likely to
be in contact with other easily accessible individuals. Similarly, individuals assigned to "Hard"
are  five times as likely to interact with similar individuals. The interpretation for this set of
scenarios is that hard to access individuals have only 60% of the contacts of easy to access
individuals. For example, hard accessibility could be caused by geographic isolation.

The initial distribution is defined in a different area of the demographics file and
Age_Bin_Edges_In_Years defines the upper and lower bounds of each age bin. This scenario has the
following age groups:

- Birth to age 6
- Older than 6 to age 10
- Older than 10 to age 20
- Older than 20

The simulation seeds an initial measles outbreak with a prevalence of 1% in individuals aged 10 to
20 years old who are easily accessible. Notice how, despite the number of individuals being evenly
split between easy and hard accessibility, the peak prevalence is higher for individuals who are
easy to access. This is due to the decreased transmission rate to hard to access individuals.

## B: Age-targeted vaccination campaign

This scenario illustrates how an outreach vaccination campaign targeted at 6 to 10 year olds
affects disease dynamics. The outreach campaign is designed to reach populations who are normally
inaccessible.

This simulation adds an age-targeted vaccination on day 1 with the same outbreak event as before.
Compare the number of infections by age in this simulation with the baseline outbreak scenario.
Notice the dramatic decrease of the infection in 6 to 10 year olds due to the vaccination of this
group. Compare infections in other ages, noting the overall decrease in infection across age groups
even though only 6 to 10 year olds were vaccinated.

## C: Standard mass vaccination campaign

This scenario illustrates how a standard mass vaccination campaign of the entire population, which
does not seek out inaccessible individuals, affects disease dynamics. This simulation adds a
vaccination campaign on day 1 that reaches all those individuals that are easily accessible. This is
followed by an outbreak that originates in hard to access individuals between 0.5 and 6 years old.
In the first two scenarios, the outbreak originates with an easy to access individual.

Notice the dramatic decrease in cumulative incidence (~300 vs. ~700) and peak prevalence from the
first scenario. The infection is almost entirely eliminated among the easily accessible population.
However, there is only a slight reduction in infection among the inaccessible population that was
not reached by the vaccination campaign.

To explore the model, try adjusting the target age and accessibility of the initial outbreak or
changing the values in the transmission matrix to see how this affects the overall incidence and
the spread between individuals of differing property values. For example, in the matrix try setting
the interaction with differing individuals to zero to see how this stops the spread between
different population segments.

Use the campaign cost output, which is proportional to the number of doses, to compare the cost-
effectiveness of vaccination campaigns targeted at different age and accessibility groups.  How do
results of the third scenario change if the outbreak begins within the easily accessible population?
Try lowering the vaccination coverage to see at what point it spreads to the inaccessible
population.

