import os
import sys
import posixpath
import argparse
from collections import Iterable
from pathlib import Path, PurePath
import json
# Type Hints
from typing import List, Union, Generator, Dict, Any
from os import PathLike

RealPath = Union[Path, PathLike]
WeakPath = Union[PurePath, PathLike]

# Paths
project_root = Path(os.path.realpath(os.path.dirname(__file__)), '..').resolve()
bin_root = project_root.joinpath('bin').resolve()
dll_root = project_root.joinpath('dll').resolve()
input_root = project_root.joinpath('Demographics_Files').resolve()
scenarios_root = project_root.joinpath('Scenarios').resolve()
scripts_root = project_root.joinpath('scripts').resolve()
helpers_ps1 = scripts_root.joinpath('helpers.ps1').resolve()
emod = bin_root.joinpath('Eradication')

UTF8 = 'utf-8'

def targets(start: RealPath, pattern="**/config.json", as_dirs=False) -> List[Path]:
    found: Generator[Path] = start.glob(pattern)
    if as_dirs:
        return sorted(
            map(lambda x: x.parent, found)
        )
    else:
        return sorted(found)


def relpath(target: WeakPath, start: WeakPath):
    return posixpath.relpath(target.as_posix(), start.as_posix())


def get_launcher_types(cls) -> List[str]:
    return list(
        map(
            lambda y: y.__func__.__name__,
            filter(
                lambda x: isinstance(x, staticmethod),
                cls.__dict__.values()
            )
        )
    )


class launcher:
    class install:
        @staticmethod
        def run_emod():
            name = 'runEmod'

            # Set output script name
            script_name = f"{name}.ps1"

            print(f"Installing the {name} script and launcher for all scenarios.")

            # Load script template
            template_file = scripts_root.joinpath(f'template.{script_name}')
            template = template_file.read_text(encoding=UTF8)
            print(f"Template: {template_file}")

            # Find all scenario folders (criteria: has a config.json file)
            scenarios = targets(scenarios_root, as_dirs=True)
            for scenario in scenarios:
                script = scenario.joinpath(script_name)
                short_path = relpath(scenario, scenarios_root)
                contents = template.format_map({
                    'helpers_script': relpath(helpers_ps1, scenario),
                    'emod': relpath(emod, scenario),
                    'input': relpath(input_root, scenario),
                    'dll': relpath(dll_root, scenario)
                })

                print(f"Generating {script_name} for {short_path}")
                script.write_text(contents, encoding=UTF8)

            print("Finished.")

        @staticmethod
        def plots():
            print(f"Installing launchers for all scenarios.")

            # Load script template
            template_file = scripts_root.joinpath(f'template.plot.ps1')
            template = template_file.read_text(encoding='utf-8')
            print(f"Template: {template_file}")

            # Find all scenario folders (criteria: has a config.json file)
            scenarios = targets(scenarios_root, pattern='**/.scenario')
            for scenario in scenarios:
                short_path = relpath(scenario.parent, scenarios_root)
                config = json.loads(scenario.read_text())

                print(f"{short_path}:")
                for name, args in config.items():
                    script = scenario.with_name(f"{name}.ps1")
                    contents = template.format_map({
                        'helpers_script': relpath(helpers_ps1, scenario),
                        'args': args,
                    })

                    print(f"    Generating {name}")
                    script.write_text(contents, encoding='utf-8')

            print("Finished.")
            pass

    class remove:
        @staticmethod
        def run_emod():
            name = 'runEmod'
            script_name = f"{name}.ps1"
            scripts = targets(scenarios_root, f"**/{script_name}")
            print(f"Deleting {len(scripts)} {script_name} scripts:")
            for script in scripts:
                os.remove(str(script))
            print("Finished.")
            pass


def main():
    parser = argparse.ArgumentParser(description="Generate various PowerShell launchers for all scenarios",
                                     add_help=True)

    # Register commands
    commands = parser.add_subparsers(title='commands',
                                     description='available commands',
                                     help='additional help',
                                     dest='command')
    install = commands.add_parser('install', help="Install or update launchers by type.", add_help=True)
    install.add_argument("type", choices=get_launcher_types(launcher.install), help="Launcher type.")

    remove = commands.add_parser("remove", help="Remove launchers by type.", add_help=True)
    remove.add_argument("type", choices=get_launcher_types(launcher.remove))

    # Change working directories to the repository root
    os.chdir(project_root)

    # Parse args (default: sys.argv)
    args = parser.parse_args()

    # Get command class from launcher
    command = getattr(launcher, args.command)

    # Get executing launcher function
    fn = getattr(command, args.type)
    if callable(fn):
        fn()


if __name__ == '__main__':
    main()
