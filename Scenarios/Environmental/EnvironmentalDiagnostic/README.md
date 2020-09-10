# EnvironmentalDiagnostic

This scenario illustrates a node-level diagnostic that is a unique feature of environmentally-
transmitted pathogens. The scenario uses the ENVIRONMENTAL_SIM to demonstrate the features of
EnviromnentalDiagnostic.

The EnvironmentalDiagnostic is a node-level intervention which enables the user to identify
contaminated locations by sampling the environment. The value obtained is compared to a threshold
value, and then it will broadcast either "positive" (the sample value is higher than the threshold),
or "negative" (the sample value is lower than the threshold). For policymaking and further scenario
testing, this can be used in conjunction with other interventions to target  and treat contaminated
areas; however this example does not include further interventions.


# Exercises

Run the simulation.  Running the plotAllCharts batch script will open the set of inset charts to
visualize contagion and infection data. Notice that there are six spikes of new infections; these
correspond to the PrevalenceIncrease outbreaks from the campaign file.

To examine the results of the EnvironmentalDiagnostic intervention, open the ReportNodeEventRecorder.csv
file in the "output" folder. For each node (here, there are two nodes) the report shows the
result of the diagnostic: Positive_Event_Node for positive diagnostic tests and Negative_Event_Node
for negative test outcomes.  In addition to the diagnostic information, the node's population and
number of infected individuals is also displayed.

Try experimenting with **Sample_Threshold**, **Base_Sensitivity**, and **Base_Specificity** in the
campaign.json file to manipulate the outcome of the diagnostic test.  Note that the number of
diagnostic samples obtained can be modified by changing **Number_Repetitions** in the campaign.json
file.

Note that the parameters for both nodes are the same, yet there are slightly different numbers of
infections for each node in the diagnostic report. This is due to the stochastic nature of the
model: having the same input parameters will not guarantee the same results.

For advanced exercises, try modifying the demographics file to make the nodes differ in their
transmission properties. Note that you can modify prevalence and susceptibility in the file
"enviro-diagnostic-demographics.json" and you can modify the TransitionMatrix values for each node
(and each type, contact and environmental) in the "enviro-diagnostic-demographics_2groups_overlay.json"
file to change the way individuals come into contact with contagions.