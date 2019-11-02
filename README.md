# How to use these scenarios

Each of the included scenarios demonstrates important concepts, features, and capabilities of the
EMOD model. The README files in each of the scenario subdirectories describe what aspect of the
model the scenario illustrates. Each scenario subdirectory contains the configuration and campaign
files needed to run an EMOD simulation. The demographics files used for each scenario are listed in
the configuration file and included in the Demographics_Files directory.

The compiled EMOD model, Eradication.exe, is also included. Unlike other executables, you do not
double-click this file to run simulations. EMOD simulations are run by calling Eradication.exe from
the command line. For these examples, the commands are included in scripts that you can simply
double-click to run the simulation and create plots from the output.

Of course, you can also run simulations directly from the command line or using COMPS if you choose.
Review the documentation for complete information on running simulations from the command line, or
just open the batch scripts in a text editor to see what commands they contain.

# Prerequisites

We recommend running these scenarios on a Windows computer. You must install the HPC, MPI, and
Python packages described in the documentation here:

www.idmod.org/docs/general/install-windows.html

The plotting scripts included with these files expect Python 3.6 to be installed at C:\Python36.
Other plotting packages are optional.

Although EMOD also supports CentOS on Azure, the batch scripts to run simulations will not work and
the installation instructions differ. However, you can still run simulations from the command line.
See the CentOS installation instructions here:

www.idmod.org/docs/general/install-centos.html
