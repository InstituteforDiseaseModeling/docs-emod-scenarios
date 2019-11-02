# Multiple health systems

In the demographics file, individual properties are used to divide individuals equally among three
groups: None, Private, and Public. These represent the different health care systems individuals have
access to.

In the configuration file, the qualify the different drug regimens is defined in TBHIV_Drug_Params.
Setting some rates very low effectively results in no one on the treatment experiencing that event.
For example, all individuals on the private health care drug will go into a latent state at the rate
specified. You must list the drugs that will be used in the simulation in
TBHIV_Drug_Types.

## Set up baseline care

On day 1, all individuals are infected and assigned to be fast progressors. TB_Presymptomatic_Rate
is set to 1, effectively eliminating the presymptomatic active state. The rate of spontaneous
cure or mortality without treatment is set very low.

In the campaign file, a single event contains several nested interventions.
NodeLevelHealthTriggeredIV is triggered when the TB infection activates, DelayedIntervention adds a
100-day delay before an individual seeks care, and AntiTBPropDepDrug delivers the drugs based on
their property value status. Campaign files often nest multiple interventions to respond to an event, add delays, change property values, and more.

Try experimenting with the length of the delay or effectiveness of the drug regimens to see how
that affects the course of the outbreak.

# Transition from no care to public care

At day 750, a new event is added that uses Property_Value_Changer is used to change the individual
property value from None to Public and AntiTBPropDepDrug is again used to distribute PublicDrug to
individual's in the public health care system 100 days after their TB activates.

Try changing the date at which individuals without care are transferred to the public system.

# Transition from private care to public care

This scenario adds a new event that uses NodeLevelHealthTriggeredIV to respond to cases of latent TB
relapsing (TBActivationPostRelapse event). The event again uses PropertyValueChanger to move those
individuals into the public health care system, DelayedIntervention to add a 100-day delay before
seeking treatment, and AntiTBPropDepDrug to distribute the drug regimen.

Try reducing the delay before seeking treatment to see what effect that has.

# System improvements

In this scenario, the original event that controls what treatment everyone receives is set to end at
day 75. After that point, a new campaign event indicates that  all individuals, whether they are in
the public or private health care system, receive the high-quality drug regimen used in the public
system. This substantially improves the outcomes of the private system, but does not raise it to
equal that of the public system. This is because TB cases that activate before day 75 will go into a
latent state and may relapse at a later date.

Try decreasing the date at which the improved system goes into place or adding a new drug regimen
that is intermediate between the private and public drug regimens.
