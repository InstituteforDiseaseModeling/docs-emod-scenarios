# Health care systems

In these scenarios, you will learn how to configure a health care system and what governs the way
individuals move through the system. These health care systems are created by configuring campaign
classes in the campaign.json file to determine what will be distributed, whom it will be distributed
to, and when it will be distributed. For example, you can distribute interventions, such as
diagnostic tests or specific treatments; discontinue or delay treatment; or even record an individual's
current disease state or biomarker information. The outcome of one intervention can be used to
initiate  the start of another, which is what creates the overall "cascade of care".


Please note that most of the information in this README is aimed towards facilitating understanding
of the campaign.json file included for this tutorial.


## The cascade of care

The main files for this scenario demonstrate a cascade of care. Note that this file is large, and
the simulation may take a couple minutes to run. The flowchart that represents the cascade is
available as a jpg file in this folder; comparison of the flowhcart and the campaign file should
help to clarify how individuals move through the care cascade. This care system incorporates many of
the available care options: HIV counseling and testing (HCT), symptomatic testing, testing on
antenatal care (ANC), ART staging, pre-ART, ART, ART dropout, voluntary male medical circumcision
(VMMC), and prevention of mother to child transmission (PMTCT), and allows for re-enrollment as well
as permanent loss to care. In the included .jpg, note that the green boxes represent triggers for
entry into the care, and interventions are represented by purple rectangles.

Care systems can be as simple or as complex as is necessary. The included example is complex, as it
demonstrates numerous aspects of the health care system. Customized systems can include features such
as diagnostic tests (which may include blood draws and measures of CD4 counts), decisions (which can
be based on random choice, CD4 count, calendar time, age, or sexual debut status), delays between
test results and care, and actual care itself (such as initiation of ART).

The following subsections will highlight some portions of the campaign file included in this tutorial.


### Voluntary male medical circumcision (VMMC)

This file uses a birth trigger for VMMC, with a time-variable sigmoidal uptake rate that rises from
0% to 30%, with an inflection point at 15% in the year 2002 [See lines 168 - 188 in the campaign.json
file]. This intervention is applied at birth, but the transmission-blocking effects of VMMC will not
take place until males have exposure to HIV (sometime after sexual debut). Therefore, the true
impact of the intervention is lagged by 15-20 (or more) years.


### Prevention of mother-to-child transmission (PMTCT)

HIV testing through antenatal care (ANC) can lead to both antiretroviral therapy for a pregnant
woman’s own health, and prevention of mother-to-child transmission (PMTCT). In this scenario, there
are multiple blocks of code in the campaign.json file describing the process for ANC/PMTCT [see lines
545-793]. This is because there are multiple options for care and outcomes.

When women reach the 12th week of pregnancy, ANC testing is triggered. Each woman has a time-variable
sigmoid probability of receiving antenatal HIV testing for that pregnancy; ANC testing coverage
ranges from 0% - 91.5% with an inflection point near the end of 2005.

Women diagnosed HIV-negative receive no interventions, and may re-test at a later time, including a
future pregnancy or through one of the other testing modalities. Women diagnosed HIV-positive
simultaneously receive a 67% probability of linking to ARTStaging, and an opportunity to receive one
of three PMTCT options:  a single-dose (and less effective) nevirapine-based PMTCT, Option A (a
combination of ANC & PMTCT), or Option B (PMTCT).

The scenario is configured so that ART has the same efficacy for PMTCT as configured for Option B: a
30-fold reduction in transmission with an overall 1% rate of MTCT. Because the ANC HIV test links to
both ARTStating and PMTCT, a woman may receive ART and a PMTCT intervention during the same
pregnancy. If this happens, the efficacy of ART is used, and that of the PMTCT regimen is ignored.


### Antiretroviral treatment

The most complex aspect of the healthcare configuration is the antiretroviral treatment process. This
can be subdivided into four broad categories: testing, staging, pre-ART, and ART. The campaign.json
file has numerous sections devoted to ART categories due to the large number of categories and the
potential ways individuals can move through the stages.

For example, ARTStagingDiagnosticTest is separate from ARTStaging  in order to allow HIV-negative
individuals to re-test at a later date. ARTStaging assumes that all individuals have already been
diagnosed HIV-positive, and therefore aborts simultaneous re-testing for HIV. On the other hand,
ARTStagingDiagnosticTest can be applied to either HIV-positive or HIV-negative individuals. If
ARTStagingDiagnosticTest were part of ARTStaging, then HIV-negative individuals would be blocked
from re-testing later, as long as their last contact with health care were an
ARTStagingDiagnosticTest.


#### Testing

People take diagnostic HIV tests for a variety of reasons. The campaign.json file contains four
separate modes of testing: health seeking due to AIDSrelated symptoms, testing as part of antenatal
care (ANC), pediatric testing at six weeks of age, and routine/voluntary testing via HIV counseling
and testing (HCT). The first three of these (symptomatic, pediatric, and antenatal) are composed of
relatively simple pathways to testing.


#### Staging

ART staging contains a linear flow of building blocks, without loops. There are two different points
in ART staging where individuals can be lost to follow-up. The first step of ART staging is a
RandomChoice with a 15% probability of loss to follow-up, linking to the  HCTUptakePostDebut code block
for potential re-initiation. The penultimate step is where individuals who are not eligible based on
CD4-agnostic criteria must wait for a CD4 result. This is also a RandomChoice with 15% probability
of loss to follow-up, and this one links to the  HCTUptakePostDebut code block.

After the first loss to follow-up block, individuals pass through a muxer (see below) with a one-
timestep delay (to avoid multiple entries into ART staging), receive phlebotomy with an HIVDrawBlood
block, and are then tested for CD4-agnostic eligibility. Eligible individuals proceed to ART,
whereas ineligible individuals go to the next step of ARTStaging.

The next step of ART staging is another 15% loss to follow-up probability, which is applied only to
individuals who are ineligible based on CD4-independent criteria. This represents an increased loss
to follow-up associated with a CD4 count as a prerequisite for ART.

For those who are retained in ART staging at the penultimate step, the final step of ART staging is
determining CD4-based eligibility. Those who are eligible go to LinkingToART, and those who are
ineligible go to LinkingToPreART.


#### Linking to care

HIVSigmoidByYearAndSex is used to link individuals to PreART and to ART. It is also possible to
include a gender bias in linkage probability using the parameter Female_Multiplier, or to configure
loss to follow-up.

The probability of linking to pre-ART is time-variable, ramping from 46% to 70% with an inflection
point in the year 2002 [see lines 1160 - 1193 in the campaign.json file]. Those who do not link to
pre-ART are lost to follow-up; those who do link move to OnPreART.

Pre-ART is composed of five steps, similar to ART staging. The first step provides fixed a 6-month
delay representing the recommended frequency of pre-ART monitoring. The second step contains a time-
invariant probability of loss to follow-up upon each return appointment for pre-ART monitoring. It
is configured using HIVRandomChoice to have a 25% probability of loss to follow-up. The final three
stages mirror those of ARTStaging: a CD4-agnostic eligibility check that leads to either OnART (if
eligible) a phlebotomy step to record CD4 count (if ineligible by CD4-agnostic criteria). The final
step checks eligibility by CD4 count, and leads to either OnART or another pre-ART monitoring visit
6 months later.

The probability of linking to ART is time-variable, ramping from 0% to 90% with an inflection point
in the year 2005 (see lines 1433 - 1464 in the campaign.json file). Those who do not link to ART are
lost to follow-up, with a potential to re-initiate care later. Those who do link move to OnART.

The components of OnART deliver the final effect of the ART health care system on the individuals.
There are three sections that make up OnART: the first applies ART to the individual, the second
configures the delay time until discontinuation of ART, and the third determines the proportion of
those discontinued who could re-initiate ART (versus those who are LostForever).

The first component of OnART is triggered by LinkingToART and by the two eligibility groups in
OnPreART: CD4-agnostic and CD4-dependent. The effects of the first OnART component are four-fold:
First, it creates a random delay, with a duration that is uniformly distributed between 1 and 120
days. This delay represents the time required for an individual to begin taking antiretroviral
medications. Second, it prevents multiple initiations ART during this time, because it is a muxer.
Third, after the delay time, it distributes the ARTBasic intervention. Fourth, it moved the
individual into a delay state that determines the time until ART discontinuation. ART
discontinuation is assumed to occur at a rate of 20% per year, configured using an exponentially
distributed delay time with a mean of 5 years.



## Restricting multiple entries into the health care system

Because health care in EMOD can be applied to individuals, or can sought by individuals
in response to various triggering events it's possible that an individual could end up in care multiple
times. The HIVMuxer was created to prevent multiple entries into the cascade of care system. In the
folder "Restricting_Multiple_Entries," you will find a set of files with an example HIVmuxer.

The total number of entries is not allowed to exceed Max_Entries. Max_Entries must be a positive
integer. All the examples provided for configuring health care set the number of Max_Entries to 1,
ensuring that an individual can only be waiting in the delay one time. A second entry to the muxer
will be denied until the first entry completes the delay period or expires.

In the included example, individuals are placed into a delay loop that triggers itself annually.
After three years, the individuals attempt to re-enter the delay loop, but are denied entry because
the Max_Entries is set to 1.


## Treatment eligibility

For this section of the tutorial, use the files in the folder "ART_Eligibility."

An important aspect of health care systems is to accurately configure treatment eligibility.
Treatment guidelines are set with Times and Values arrays (for an example, look at the
HIVARTStagingCD4AgnosticDiagnostic code block in the campaign.json file). To change the
guidelines, simply edit the values for past years. For example, for guidelines based on WHO stage:

"Adult_by_WHO_Stage": {
        "Times": [2004, 2011.8],
        "Values": [4, 3]
}

Historical guidelines can be edited by changing the values for past years; future guidelines can be
added into the arrays by including a future day (for example, 2020) and a value for that year. To
increase eligibility, simply use a number that will not exclude anyone (so a value of 1 or 0 for a WHO
stage). The same can be configured for CD4 values, for example, if the Times and Values arrays are
determining the threshold counts for CD4 eligibility. Adding in a date with an extremely high threshold
will create universal eligibility.


It is important to note that changing eligibility may also impact retention in the care system as well
as linkage to care. Increasing eligibility will increase the number of people seeking care, which
may result in failures of health care systems. If health care systems aren't equipped to handle the
influx of patients, higher dropout rates may result.


