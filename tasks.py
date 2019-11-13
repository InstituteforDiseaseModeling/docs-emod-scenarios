import sysconfig
import os
import sys
import glob
from pathlib import Path
from invoke import task, Responder

def targets(start):
    found = glob.glob(f"{start}/**/config.json", recursive=True)
    return [os.path.dirname(file) for file in found]

# Paths
project_root = Path(os.path.realpath(os.path.dirname(__file__)))
bin_root = project_root.joinpath('bin').resolve()
dll_root = project_root.joinpath('dll').resolve()
input_root = project_root.joinpath('Demographics_Files').resolve()
scenarios_root = project_root.joinpath('Scenarios').resolve()

# Change working directories
os.chdir(project_root)

# Add the bin/ folder to the path
sys.path.insert(0, bin_root)

# Find all scenario folders (criteria: has a config.json file)
scenarios = targets(scenarios_root)

@task
def emod(c):
    """
    Run Eradication for all scenarios in the 'Scenarios' folder
    """
    cont = input(f"Run all {len(scenarios)} scenarios? (y/n) ").lower() == 'y'
    if (cont):

        emod_app = bin_root.joinpath('Eradication').resolve()
        if(sys.platform == 'win32'):
            emod_app = bin_root.joinpath('Eradication.exe').resolve()
        command = f"{emod_app} -C config.json -I '{input_root}' -O output -D '{dll_root}'"

        for scenario in scenarios:
            os.chdir(scenario)
            c.run(command)

        os.chdir(project_root)
    pass

@task
def clean(c):
    """
    Remove all execution artifacts in the 'Demographics_Files' and 'Scenarios' folders.
    """
    c.run("git clean -ffdx Scenarios Demographics_Files")
    pass

@task
def purge(c):
    """
    Remove ALL artifacts created by builds, RStudio, other IDEs, etc.
    """
    c.run("git clean -ffdx")
    pass

@task
def list(c):
    """
    List all scenarios
    """
    cont = input(f"Show all {len(scenarios)} scenarios? (y/n) ").lower() == 'y'
    if (cont):
        for scenario in scenarios:
            print(f"    {scenario}")

