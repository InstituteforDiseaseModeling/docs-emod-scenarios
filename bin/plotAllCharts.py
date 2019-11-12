#!/usr/bin/env python

from __future__ import print_function
from __future__ import division
from builtins import str
import matplotlib.pyplot as plt
import argparse
import json
import sys
import pylab
from math import ceil, sqrt


def main(report, title = "" ):

    with open(report) as ref_sim:
        ref_data = json.loads( ref_sim.read() )

    num_chans = ref_data["Header"]["Channels"]

    square_root = ceil(sqrt(num_chans))

    n_figures_x = square_root
    n_figures_y = ceil(float(num_chans)/float(square_root))

    idx = 1
    plt.figure(1, figsize=(14.0, 7.5))
    for chan_title in sorted(ref_data["Channels"]):
        try:
            plt.subplot(n_figures_x, n_figures_y, idx)
            plt.tick_params(axis='both', which='major', labelsize=7)
            plt.tick_params(axis='both', which='minor', labelsize=5)
            plt.plot( ref_data["Channels"][chan_title]["Data"])
            plt.title( chan_title, fontsize = 9 )
            idx += 1
        except Exception as ex:
            print(str(ex))


    plt.tight_layout()
    plt.suptitle( title, fontsize=18 )
    plt.subplots_adjust( left=0.05, right=0.95, bottom=0.035, top=0.915, wspace=0.4, hspace=0.5 )
    plt.show()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("path", default="InsetChart.json", help="Path to the inset chart JSON file")
    parser.add_argument("title", default="", help="The title for the chart window")
    args = parser.parse_args()
    main(args.path, args.title)
    pass