from setuptools import setup, find_packages
from os import path
from io import open

here = path.abspath(path.dirname(__file__))

# Get the long description from the README file
with open(path.join(here, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

# Arguments marked as "Required" below must be included for upload to PyPI.
# Fields marked as "Optional" may be commented out.
setup(
    name='emod_scenarios',  # Required
    version='1.0.0',  # Required
    description='Sample EMOD scenarios',  # Optional
    long_description=long_description,  # Optional
    long_description_content_type='text/markdown',  # Optional (see note above)
    url='http://idmod.org/docs',  # Optional
    author='Institute for Disease Modeling',
    author_email='support@idmod.org',
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Intended Audience :: Developers',
        'Intended Audience :: Science/Research'
        'Topic :: Software Development :: Build Tools',
        'License :: Creative Commons BY-NC-SA 4.0',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.6',
    ],
    packages=[],
    python_requires='>=3.5',
    install_requires=[
        'matplotlib',
        'numpy',
        'pandas',
        'seaborn'
    ],
    scripts=[
        'bin/eradication.py',
        'bin/plotAllCharts.py',
        'bin/plotBinnedPopulation.py',
        'bin/plotEventRecorder.py',
        'bin/plotHIVSummary_15_49.py',
        'bin/plotPropertyReport.py',
        'bin/plotSIRChannels.py',
        'bin/plotTBHIVART.py',
        'bin/plotTbResults_Progression_Baseline.py',
        'bin/plotTbResults_Progression_Comparison.py',
    ],
    project_urls={  # Optional
        'Bug Reports': 'https://github.com/InstituteforDiseaseModeling/docs-emod-scenarios/issues',
        'Source': 'https://github.com/InstituteforDiseaseModeling/docs-emod-scenarios',
     }
)

