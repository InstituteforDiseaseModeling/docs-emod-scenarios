import json
import os
import shutil
import sys

import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

if sys.argv[1] == '0':
    strdir = 'NoART'
elif sys.argv[1] == '1':
    strdir = 'ART'

df = pd.read_csv( strdir + '/output/Report_TBHIV_ByAge.csv', parse_dates= False, index_col='Year', skipinitialspace=True)

df.rename(columns = lambda y: y.strip())

df.reset_index(inplace=True, drop=False)
colvals = list(df.columns.values)
if ' NodeID' in colvals:
    a = 1
df.reset_index()
df.set_index(['Year', 'NodeID', 'AgeBin'], inplace=True)
df_sum = df.groupby(['Year','NodeID']).sum()

df_sum.reset_index(inplace=True)
df.reset_index(inplace=True)

sns.tsplot(df_sum, unit = 'NodeID',time='Year', interpolate=True, value='Active', color='blue')
plt.ylabel('Number with Active TB')
plt.title( strdir, fontsize = 12 )
plt.show()

sns.tsplot(df_sum, unit = 'NodeID',time='Year', interpolate=True, value='Incidence', color='blue')
plt.ylabel('Number of Incident Cases Active Symptomatic TB')
plt.title( strdir, fontsize = 12 )
plt.show()

sns.tsplot(df_sum, unit = 'NodeID', time='Year', interpolate=True, value='HIV', color='blue')
plt.ylabel('Number HIV Positive')
plt.title( strdir, fontsize = 12 )
plt.show()

sns.tsplot(df_sum, unit = 'NodeID', time='Year', interpolate=True, value='ART', color='blue')
plt.ylabel('Number on ART')
plt.title( strdir, fontsize = 12 )
plt.show()

sns.tsplot(df, unit = 'NodeID', condition= 'AgeBin', time='Year', interpolate=True, value='Incidence', legend=True, err_style= 'unit_traces')
plt.legend(loc= 'upper left', borderaxespad=0, ncol=2)
plt.title( strdir, fontsize = 12 )
plt.show()

sns.tsplot(df, unit = 'NodeID', condition= 'AgeBin', time='Year', interpolate=True, value='TBTestPreDOTS', legend=True, err_style= 'unit_traces')
plt.legend(loc='upper left', borderaxespad=0, ncol=2)
plt.title( strdir, fontsize = 12 )
plt.show()

sns.tsplot(df, unit = 'NodeID', condition = 'AgeBin', time = 'Year', interpolate=True, value = 'Active', legend=True, err_style = 'unit_traces')
plt.legend(loc='upper left', borderaxespad=0, ncol=2)
plt.title( strdir, fontsize = 12 )
plt.show()

