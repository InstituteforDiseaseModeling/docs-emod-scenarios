# Bednet Distribution

In this scenario, you will begin to explore the use of campaign files to distribute interventions
to your populations.

Specifically, you will use a campaign file that distributes bednets to 70 percent of your
simulation population, starting at the beginning of year 4 of the simulation. Bednets, also known as
Insecticide-Treated Nets (ITNs), are a key component of modern malaria control efforts and have
recently been scaled up towards universal coverage in sub-Saharan Africa. Modern bednets are made
of a polyethylene or polyester mesh which is impregnated with a slowly releasing pyrethroid
insecticide. Mosquitoes that are seeking a blood meal will encounter a net, and if the net retains
its physical integrity and has been correctly installed, the feeding attempt is blocked. Some
mosquitoes will be killed during these blocked feeding attempts.



## Scenario configuration

This simulation uses the Vector model, not the Malaria model; this simulation type includes relevant
vector parameters but does not include malaria-specific parameters. The parameter **Simulation_Type**
is set to VECTOR_SIM.

Note that the configuration file used for this scenario is the same as the file used in the
"Simple vector model" scenario. The difference is that now your population will get bednets, so there
should be a decline in malaria cases after year 4.


### Parameters of note

To use a campaign file, the parameter **Enable_Interventions** must be set to 1.

The CampaignEvent parameters control:

- *when* the event occurs (**Start_Day**)
- *where* it is distributed (**Nodeset_Config**)
- *how* it is distributed (**Event_Coordinator_Config**)


Within the **Event_Coordinator_Config** you can control who in your population receives a bednet
with the parameters:

- **Demographic_Coverage**, which determines the percentage of the eligible population to receive the intervention
- **Target_Demographic**, which determines who in the population is eligible to receive the intervention


The  **Event_Coordinator_Config** also includes the **Intervention_Config**, which determines how
effective the bednet will be for killing or blocking mosquitoes.



## Exercises

Run the simulation to explore how bednet distribution impacts malaria transmission. For a good
comparison, compare the output from this scenario to the output from the Simple Vector Model.

Next, modify parameters in the campaign file to change the distribution and efficacy of the nets.
What happens to malaria transmission (the number of infected individuals) when you increase or
decrease the demographic coverage, or increase or decrease the killing or blocking rates?
