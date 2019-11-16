# Contact scaling for intra-day commuting

This scenario simulates the person-person disease transmission of influenza in Seattle over the
course of one year. It assumes that individuals have round-trip travels, or commutes, between census
tracts in less than one day. The return time is less than or equal to 8 hours and movement is in
equilibrium. Different from homogeneous mixing, the heterogeneous movement links and rates between
census tracts will create a timing difference of epidemic trajectories upon initial seeding.
Intra-day migration, which is an example of contact scaling, can be approximated in EMOD using
HINT.

The scenario represents Seattle as a single node. There are 125 property values based on Seattle
census tract data. The heterogeneous infectivity between individuals and the 125 census tracts is
represented by a transmission matrix with beta values. The values, which represent the heterogeneous
force of infection at each census tract, are based on the movement rate between census tracts and
the return rate. Individuals interact mostly with other individuals in their own census tract but
also shed into or acquire infection from the census tracts that they commuted to during the day.

The matrix was created using a script with a specified return rate. The script loads the existing
multi-node demographics and migration input files, and converts them to a single-node demographics
file. Each component in the matrix is calculated based on the spatial coupling of round-trip
movement flow detailed in the article: Balcan, D., Colizza, V., Gonçalves, B., et al. (2009).
Multiscale mobility networks and the spatial spreading of infectious diseases. PNAS 106(51),
21484-21489. doi: 10.1073/pnas.0906910106. Since the average hours to stay at a destination is 8 hours (1/3 of a day) and the return rate is the inverse of the average hours, the return rate is 3. That is,  1/(1/3) = 3.

The outbreak occurs in census tract 7 and spreads to the other tracts based on commute patterns.
The property report shows the timing difference due to spatial coupling, listing the tracts
sequentially by number.

Try changing the return rates to either increase or decrease the spatial coupling. In general, when
the return rates are high, there is less coupling between census tracts so the disease curves of the
outbreak are less synchronized. You can use the Python scripts to modify the Seattle_template file
and regenerate the transmission matrix in the demographics file. Update the value of returnRate in
ConvertMultipleNodeDemographicsToSingleNodePools using an editor of your choice. All of the multi-
node demographics files and Seattle_template must be in the same directory.
