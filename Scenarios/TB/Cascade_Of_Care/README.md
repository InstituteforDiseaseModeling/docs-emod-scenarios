# Passive and active case finding in a care cascade

This scenario uses both event triggers to move individuals through the health care cascade and
individual properties to produce output using the plotPropertyReport script.In this example, testing
covers 100% of the population and the smear test is perfect (all smear-positive individuals test positive and all smear-negative individuals test negative).

# Passive case finding

This scenario illustrates a simple cascade of care that represents symptomatic individuals who
present themselves to providers. As most individuals do not immediately seek treatment for symptoms,
this uses SimpleHealthSeekingBehavior to set the exponential rate at which individuals seek care.

Once they visit the provider, they receive a diagnostic smear test for TB (DiagnosticTreatNeg). Some
individuals may not return to get their test result (defaulters), which can occur for various
reasons, including lack of trust in the provider or lack of time and funds to make a second trip to
this provider. Individuals who do return to get their test result may receive either a positive or
negative test result. If the TB test is positive, providers order higher quality treatment, which is
highly affective against TB.

If the TB test is negative, providers may order empiric treatment, which is not effective against
TB. At the close of their treatment, patients would continue to be symptomatic and again re-seek
treatment. However, in the passive case finding scenario, the rate of health seeking is very low
(set in HealthSeekingBehaviorUpdateable) so individuals who default or fail treatment are
effectively lost to treatment.

# Active case finding

In this scenario, the campaign file is changed slightly to add a HealthSeekingBehaviorUpdate event
at day 500 that sets the tendency of individuals to seek out care to 100%. This simulates finding
active cases and bringing them to a clinic for treatment.

To vary these scenarios to simulate more realistic situations, try reducing the
Demographic_Coverage, Base_Sensitivity, and Base_Specificity of the smear test. Try increasing or
decreasing the rates at which individuals who default or fail treatment seek out care.
