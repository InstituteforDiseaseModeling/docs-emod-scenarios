#!/usr/bin/env python

# SUMMARY: Plot the population by age group
# INPUT ARGUMENTS: (1) Path to BinnedReport.json
# OUTPUT: figure drawn on screen


from __future__ import print_function

import argparse
import json

import matplotlib.pyplot as pyplot


def main(filename, channel):

    with open(filename, 'rb') as handle:
        report = json.load(handle)

    labels = report['Header']['Subchannel_Metadata']['MeaningPerAxis'][0][0]
    data = report['Channels'][channel]['Data']

    figure = pyplot.figure('{0} by Age'.format(channel))
    pyplot.axes([0.1,0.1,0.71,0.8])
    for (trace, label) in zip(data, labels):
        pyplot.plot(trace, label=label)

    pyplot.title('{0} by Age'.format(channel))
    pyplot.xlabel('Simulation Day')
    pyplot.ylabel('Population')
    pyplot.legend(loc=(1.03, 0.135), prop={"size":10})

    pyplot.show()

    pass

def cli():
    parser = argparse.ArgumentParser(description="Plot the population by age group.")
    parser.add_argument('-c', '--channel', default='Population', help="Channel to plot")
    parser.add_argument('report', default='output/BinnedReport.json', help="Path to the report file (JSON)")
    return parser

if __name__ == '__main__':
    parser = cli()
    args = parser.parse_args()
    main(args.report, args.channel)

    pass
