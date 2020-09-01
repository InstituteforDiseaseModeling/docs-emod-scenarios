# Insect-killing Fence

This scenario introduces the insect-killing fence, which is a node-level intervention.  An insect-
killing fence refers to any sort of fence-like system designed to stop insects, such as mosquitoes.
For example, you could create an insect-killing fence by stringing together a series of bednets;
research is ongoing to develop a photonic fence, which kills mosquitoes with lasers. The
mode-of-action is the killing of the specified fraction of all feeding mosquitoes both at the
beginning and at the end of the feeding cycle.

While the idea of an insect-killing fence (especially a photonic fence) is interesting in and of
itself, the real focus of this tutorial concerns its use. Namely, this is an intervention that can
kill mosquitoes outdoors both on their way in to feed and on their way out to oviposit.


## Scenario configuration

This simulation uses the Vector model, not the Malaria model; this simulation type includes relevant
vector parameters but does not include malaria-specific parameters. The parameter **Simulation_Type**
is set to VECTOR_SIM.

This scenario introduces a node-level intervention, which is targeting mosquito populations. Previous
scenarios used individual-level interventions which are distributed to individuals, whereas node-
level events are distributed to particular nodes.


### Parameters of note

The campaign file for this scenario is straight-forward, and contains the parameters required for
the **InsectKillingFence** intervention class. Note that these types of interventions are typically
less effective that more targeted interventions; the parameter **Initial_Effect** is set to 28% to
reflect this.


## Exercises

Run the scenario. Compare the results of this simulation to that from the "Sugar-baited Trap"
scenario. Which type of intervention is more effective? Compare the results to scenarios that
use vaccination campaigns. Which type of intervention would you expect to be more effective?

