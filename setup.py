import os
import venv
import sys
from setuptools import setup, find_packages
from io import open
from pathlib import Path

ROOT = Path(os.path.abspath(os.path.dirname(__file__)))
BIN = ROOT.joinpath('bin')
SCRIPTS = ROOT.joinpath('scripts')

is_win = (sys.platform == 'win32')

# Get the long description from the README file
with open(ROOT.joinpath('README.md'), encoding='utf-8') as f:
    long_description = f.read()
    f.close()

setup(
    name='emod_scenarios',
    version='2.0.0',
    description='EMOD example scenarios',
    long_description=long_description,
    long_description_content_type='text/markdown',
    url='http://idmod.org/docs',
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
    python_requires='>=3.6',
    install_requires=[
        'matplotlib',
        'numpy',
        'pandas',
        'seaborn'
    ],
    project_urls={
        'Bug Reports': 'https://github.com/InstituteforDiseaseModeling/docs-emod-scenarios/issues',
        'Source': 'https://github.com/InstituteforDiseaseModeling/docs-emod-scenarios',
     }
)

