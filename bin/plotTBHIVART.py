#!/usr/bin/env python

import argparse

import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns


def main(report, title):
    fontsize = 12
    df = pd.read_csv(report, parse_dates=False, index_col='Year',
                     skipinitialspace=True)

    df.rename(columns=lambda y: y.strip())

    df.reset_index(inplace=True, drop=False)
    colvals = list(df.columns.values)
    if ' NodeID' in colvals:
        a = 1
    df.reset_index()
    df.set_index(['Year', 'NodeID', 'AgeBin'], inplace=True)
    df_sum = df.groupby(['Year', 'NodeID']).sum()

    df_sum.reset_index(inplace=True)
    df.reset_index(inplace=True)

    sum_plots = (
        dict(
            ylabel="Number with Active TB",
            value='Active',
        ),
        dict(
            ylabel='Number of Incident Cases Active Symptomatic TB',
            value='Incidence'
        ),
        dict(
            ylabel='Number HIV Positive',
            value='HIV'
        ),
        dict(
            ylabel='Number on ART',
            value='ART'
        )
    )
    for sum_plot in sum_plots:
        sns.tsplot(df_sum, value=sum_plot['value'], unit='NodeID', time='Year', interpolate=True, color='blue')
        plt.ylabel(sum_plot['ylabel'])
        plt.title(title, fontsize=fontsize)
        plt.show()

    bin_plots = ('Incidence', 'TBTestPreDOTS', 'Active')
    for value in bin_plots:
        sns.tsplot(df, value=value, unit='NodeID', condition='AgeBin', time='Year', interpolate=True, legend=True,
                   err_style='unit_traces')
        plt.legend(loc='upper left', borderaxespad=0, ncol=2)
        plt.title(title, fontsize=fontsize)
        plt.show()

def cli():
    parser = argparse.ArgumentParser(description="Plot ART or NoART scenarios", add_help=True)
    parser.add_argument('-t','--title', help="Plot window title", type=str)
    parser.add_argument('report', default="output/Report_TBHIV_ByAge.csv",
                        help="Relative or absolute path to the custom 'TBHIV by Age' report.")
    return parser

if __name__ == '__main__':
    parser = cli()
    args = parser.parse_args()
    main(args.report, args.title)