#!/usr/bin/python

import os
import sys
import argparse
from pathlib import Path

script_root = Path(os.path.realpath(os.path.dirname(__file__)))
project_root = script_root.joinpath('..').resolve()
input_path = project_root.joinpath('Demographics_Files').resolve()

eradication_exe = script_root.joinpath('Eradication')
if (sys.platform == 'win32'):
    eradication_exe = script_root.joinpath('Eradication.exe')

def main(config, input, output, python = None):
    command = f'{eradication_exe} -C "{config}" -I "{input}" -O "{output}"'
    if (python):
        command += f' -P {python}'
    os.system(command)
    pass

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-C', '--config', default='config.json', help="Name of the configuration file.")
    parser.add_argument('-I', '--input', default=str(input_path),
                            help="Relative or absolute path to location of model input files")
    parser.add_argument('-O', '--output',
                            default="output",
                            help="Relative or absolute path for execution output")
    parser.add_argument('-P', '--python',
                            help="Path to Python scripts.")
    args = parser.parse_args()
    main(args.config, args.input, args.output, args.python)

    pass