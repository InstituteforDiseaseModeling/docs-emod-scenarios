# Density scaling of infectivity

This scenario explores the effect of population density on the transmissibility of disease. By
default, EMOD uses frequency-dependent transmission and the overall transmissibility does not change
with population size or density. An infected individual will infect the same number of people either
in a small village or in a metropolitan area.

The scenario simulates the person-person disease transmission of an influenza-like illness model
with immunity that begins to wane after 90 days (SEIRS). The initial node size, infectiousness, and
duration of infectivity set in the configuration file corresponds to a saturated R0 to 1.5.

When Population_Density_Infectivity_Correction is set to SATURATING_FUNCTION_OF_DENSITY, EMOD uses a
scaling function to calculate β based on the value set in Population_Density_C50. Try increasing the
value in Node_Grid_Size (from 0.1 to 0.15 then 0.3) to see how this decreases population density and
saturated R0 (from 1.5 to ~1 then <1). You can see that even with multiple disease outbreaks, the
epidemic cannot be sustained when R0 <1. The Excel file under the script directory can calculate
node size and population density based on population size, location, and grid size.
