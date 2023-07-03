#!/usr/bin/python3

from pyutils.formatting import clrStr, printFrame
from pyutils.fs import ensureExists
import json


def main():
    with open('deps.json') as f:
        data = json.load(f)
        dependencies = data['dependencies']
        command = ''

        for d in dependencies:
            name = d['name']
            cmd = d['cmd']

            command += f'{cmd} > /dev/null || echo "{name}" \n'

        # Remove last \\\n from command
        command = command[:-2]

        message = ensureExists(command)
        printFrame(message)


if __name__ == "__main__":
    main()
